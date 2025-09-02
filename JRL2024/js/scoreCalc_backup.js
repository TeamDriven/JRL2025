var MAX_MATCHES = 10;

function calcScoreFromData(info) {
    var redScore = 0;
    var redBonusScore = 0;
    var redTeleScore = 0;
    var redAutoScore = 0;
    var blueScore = 0;
    var blueBonusScore = 0;
    var blueTeleScore = 0;
    var blueAutoScore = 0;

    redAutoScore += parseInt(info["red_ramp_bonus"]) * 15;
    redAutoScore += parseInt(info["red_auto_venus"]) * 10;
    redAutoScore += parseInt(info["red_mobility"]) * 5;
    redAutoScore += parseInt(info["red_auto_pollen"]) * 4;
    redAutoScore += parseInt(info["red_auto_pollen_high"]) * 8;
    redTeleScore += parseInt(info["red_pollen"]) * 2;
    redTeleScore += parseInt(info["red_pollen_high"]) * 4;
    //redTeleScore += parseInt(info["red_levitate"]) * 2;
    redTeleScore += parseInt(info["red_venus"]) * 5;
    // redBonusScore += parseInt(info["red_climb"]) * 25;
    redTeleScore -= parseInt(info["red_penalty"]) * 15;

    var redClimbs = parseInt(info["red_climb"]) + parseInt(info["red_levitate"]);
    if (redClimbs > 3)
        redClimbs = 3;
    redBonusScore += redClimbs * 25;

    if ((parseInt(info["red_levitate"]) +
        parseInt(info["red_auto_venus"])) >= 20) {
        redBonusScore += 30;
    }

    redScore = redBonusScore + redAutoScore + redTeleScore;

    blueAutoScore += parseInt(info["blue_ramp_bonus"]) * 15;
    blueAutoScore += parseInt(info["blue_auto_venus"]) * 10;
    blueAutoScore += parseInt(info["blue_auto_pollen"]) * 4;
    blueAutoScore += parseInt(info["blue_auto_pollen_high"]) * 8;
    blueAutoScore += parseInt(info["blue_mobility"]) * 5;

    blueTeleScore += parseInt(info["blue_pollen"]) * 2;
    blueTeleScore += parseInt(info["blue_pollen_high"]) * 4;
    //blueBonusScore += parseInt(info["blue_levitate"]) * 25;

    blueTeleScore += parseInt(info["blue_venus"]) * 5;
    //blueBonusScore += parseInt(info["blue_climb"]) * 25;
    blueTeleScore -= parseInt(info["blue_penalty"]) * 15;

    var blueClimbs = parseInt(info["blue_climb"]) + parseInt(info["blue_levitate"]);
    if (blueClimbs > 3)
        blueClimbs = 3;
    blueBonusScore += blueClimbs * 25;

    blueScore = blueBonusScore + blueAutoScore + blueTeleScore;


    var scores = {
        red_score: redScore,
        red_bonus_score: redBonusScore,
        red_tele_score: redTeleScore,
        red_auto_score: redAutoScore,
        blue_auto_score: blueAutoScore,
        blue_tele_score: blueTeleScore,
        blue_bonus_score: blueBonusScore,
        blue_score: blueScore
    };

    return scores;
}

function calcScoreFromMatchJSON(json) {
    //convert the JSON string to a JavaScript object (also called a key:value array)
    var info = $.parseJSON(json)[0];
    var scores = calcScoreFromData(info);
    return scores;
}



function calcScore() {
    var blueScore = 0;
    var redScore = 0;
    var scores = {};
    $.ajax({
        //give the url to go to (the .. means go up a folder)
        url: './php/GetCurrentMatch.php',

        //this says what todo as soon as all the data has been loaded
        success: function (data) {
            scores = calcScoreFromMatchJSON(data);


            $.ajax({
                url: './php/updateStatus.php',
                data: scores,
                type: 'POST',
                success: function (data) {

                }
            });


        }
    });
    return scores;
}

function updateTeamsInMatch(match_num) {
    var updatedData = [];
    var data = { "match_num": match_num };
    $.ajax({
        url: './php/getMatch.php',
        data: data,
        type: 'POST',
        success: function (data) {
            //convert the JSON string to a JavaScript object (also called a key:value array)
            var info = $.parseJSON(data)[0];
            var scores = calcScoreFromMatchJSON(data);
            // 0 is red win, 1 is blue win, 2 is tie
            var winScenario = 0;
            if (scores["blue_score"] > scores["red_score"]) {
                winScenario = 1;
            } else if (scores["blue_score"] == scores["red_score"]) {
                winScenario = 2;
            }

            var positions = ['red1', 'red2', 'red3', 'blue1', 'blue2', 'blue3'];
            positions.forEach(function (pos) {
                addMatchToTeam(pos, info, scores, winScenario);
            });


        }
    });
}


function addMatchToTeam(pos, matchData, scores, winScenario) {
    $.ajax({
        url: './php/getTeamData.php',
        data: { "team_num": matchData[pos] },
        type: 'POST',
        success: function (y) {
            var teamData = $.parseJSON(y);
            var newData = { "team_num": matchData[pos] };
            newData["matches_played"] = parseInt(teamData["matches_played"]) + 1;
            newData["qualification_score"] = parseInt(teamData["qualification_score"]);

            var alliance = pos.slice(0, -1);
            if (winScenario == 2) {
                newData["qualification_score"] += 1;
            } else if (alliance == "blue") {
                if (winScenario == 1) {
                    newData["qualification_score"] += 2;
                }
            } else {
                if (winScenario == 0) {
                    newData["qualification_score"] += 2;
                }
            }

            newData["auto_score"] = parseInt(teamData["auto_score"]) + scores[alliance + "_auto_score"];
            newData["tele_score"] = parseInt(teamData["tele_score"]) + scores[alliance + "_tele_score"];
            newData["bonus_score"] = parseInt(teamData["bonus_score"]) + scores[alliance + "_bonus_score"];
            if (newData["matches_played"] < MAX_MATCHES)
                updateTeamData(newData);
        }
    });
}

function clearTeamData() {

    $.ajax({
        url: './php/getTeams.php',
        data: newData,
        type: 'POST',
        success: function (data) {

            var newData = {
                "auto_score": 0,
                "tele_score": 0,
                "bonus_score": 0,
                "qualification_score": 0,
                "matches_played": 0
            };
            var teamData = $.parseJSON(data);
            for (var i = 0; i < teamData.length; i++) {
                var teamNum = teamData[i]["team_num"];
                newData["team_num"] = teamNum;
                updateTeamData(newData);
            }
        }
    });
}

function updateTeamData(data) {
    $.ajax({
        url: './php/updateTeam.php',
        data: data,
        type: 'POST',
        success: function (info) {
            console.log("update team data: " + info);
        }
    });
}

function updateTeamRanks() {
    var updatedData = [];
    $.ajax({
        url: './php/getMatches.php',
        success: function (data) {
            //convert the JSON string to a JavaScript object (also called a key:value array)
            var info = $.parseJSON(data);
            for (var i = 0; i < info.length; i++) {
                match = info[i];


                if (match["played"] == 1) {
                    var scores = calcScoreFromData(match);
                    // 0 is red win, 1 is blue win, 2 is tie
                    var winScenario = 0;
                    if (scores["blue_score"] > scores["red_score"]) {
                        winScenario = 1;
                    } else if (scores["blue_score"] == scores["red_score"]) {
                        winScenario = 2;
                    }

                    var positions = ['red1', 'red2', 'red3', 'blue1', 'blue2', 'blue3'];
                    positions.forEach(function (pos) {
                        addMatchToTeam(pos, match, scores, winScenario);
                    });
                }

            }


        }
    });
}