
var MAX_MATCHES = 9;

function min(x,y){
	if (x>y){
		return y;
	}
	return x;
}

var redScore = 0;

var redBonusScore = 0;
var redBalanceScore = 0;
var redTeleScore = 0;
var redAutoScore = 0;

var fire = 0;
var air = 0;

var blueScore = 0;

var blueBonusScore = 0;
var blueBalanceScore = 0;
var blueTeleScore = 0;
var blueAutoScore = 0;

var water = 0;
var earth = 0;
	
function calcScoreFromData(info) {
    redScore = 0;
    redBonusScore = 0;
	redBalanceScore = 0;
    redTeleScore = 0;
    redAutoScore = 0;
	fire = 0;
	air = 0;
    blueScore = 0;
    blueBonusScore = 0;
    blueBalanceScore = 0;
    blueTeleScore = 0;
    blueAutoScore = 0;
	water = 0;
    earth = 0;
	
	redPenalties = 0;
	bluePenalties = 0;
	
	redPenalties += parseInt(info["red_foul"]) * 5;
	redPenalties += parseInt(info["red_techfoul"]) * 15;
	bluePenalties += parseInt(info["blue_foul"]) * 5;
	bluePenalties += parseInt(info["blue_techfoul"]) * 15;



    redAutoScore += parseInt(info["red_auto_mob"]) * 5;
    redAutoScore += parseInt(info["red_auto_disp"]) * 8;
    redAutoScore += parseInt(info["red_auto_pool"]) * 8;

	redAutoScore += parseInt(info["auto_fire1"])* 12;
	redAutoScore += parseInt(info["auto_fire2"])* 12;
	redTeleScore += parseInt(info["tele_fire1"])* 6;
	redTeleScore += parseInt(info["tele_fire2"])* 6;
	redTeleScore += parseInt(info["tele_fire3"])* 6;
	
	redAutoScore += parseInt(info["auto_air1"])* 12;
	redAutoScore += parseInt(info["auto_air2"])* 12;
	redTeleScore += parseInt(info["tele_air1"])* 6;
	redTeleScore += parseInt(info["tele_air2"])* 6;
	redTeleScore += parseInt(info["tele_air3"])* 6;
		
	redTeleScore += parseInt(info["red_tele_pool"]) * 4;

	redBonusScore += parseInt(info["red_endgame_climb"]) * 15;
	redBonusScore += parseInt(info["red_endgame_park"]) * 5;
    redBonusScore += parseInt(info["red_endgame_wizlow"]) * 5;
    redBonusScore += parseInt(info["red_endgame_wizmid"]) * 10;
    redBonusScore += parseInt(info["red_endgame_wizhigh"]) * 20;	

	fire += parseInt(info["auto_fire1"]);
	fire += parseInt(info["auto_fire2"]);
	fire += parseInt(info["tele_fire1"]);
	fire += parseInt(info["tele_fire2"]);
	fire += parseInt(info["tele_fire3"]);
	
	air += parseInt(info["auto_air1"]);
	air += parseInt(info["auto_air2"]);
	air += parseInt(info["tele_air1"]);
	air += parseInt(info["tele_air2"]);
	air += parseInt(info["tele_air3"]);
	
	redBalanceScore = min(fire,air) * 6;

	redTeleScore += redBalanceScore;
    redScore = redBonusScore + redAutoScore + redTeleScore + bluePenalties;
	
	//--------------------------------------------//
	//--------------------------------------------//
	
	blueAutoScore += parseInt(info["blue_auto_mob"]) * 5;
    blueAutoScore += parseInt(info["blue_auto_disp"]) * 8;
    blueAutoScore += parseInt(info["blue_auto_pool"]) * 8;
 
	blueAutoScore += parseInt(info["auto_water1"])* 12;
	blueAutoScore += parseInt(info["auto_water2"])* 12;
	blueTeleScore += parseInt(info["tele_water1"])* 6;
	blueTeleScore += parseInt(info["tele_water2"])* 6;
	blueTeleScore += parseInt(info["tele_water3"])* 6;
	
	blueAutoScore += parseInt(info["auto_earth1"])* 12;
	blueAutoScore += parseInt(info["auto_earth2"])* 12;
	blueTeleScore += parseInt(info["tele_earth1"])* 6;
	blueTeleScore += parseInt(info["tele_earth2"])* 6;
	blueTeleScore += parseInt(info["tele_earth3"])* 6;
	
	blueTeleScore += parseInt(info["blue_tele_pool"]) * 4;

	blueBonusScore += parseInt(info["blue_endgame_climb"]) * 15;
	blueBonusScore += parseInt(info["blue_endgame_park"]) *5;
    blueBonusScore += parseInt(info["blue_endgame_wizlow"]) * 5;
    blueBonusScore += parseInt(info["blue_endgame_wizmid"]) * 10;
    blueBonusScore += parseInt(info["blue_endgame_wizhigh"]) * 20;
		
	water += parseInt(info["auto_water1"]);
	water += parseInt(info["auto_water2"]);
	water += parseInt(info["tele_water1"]);
	water += parseInt(info["tele_water2"]);
	water += parseInt(info["tele_water3"]);
	
	earth += parseInt(info["auto_earth1"]);
	earth += parseInt(info["auto_earth2"]);
	earth += parseInt(info["tele_earth1"]);
	earth += parseInt(info["tele_earth2"]);
	earth += parseInt(info["tele_earth3"]);
	
	blueBalanceScore = min(water,earth) * 6;
	

	blueTeleScore += blueBalanceScore;
    blueScore = blueBonusScore + blueAutoScore + blueTeleScore + redPenalties;


    var scores = {
        red_score: redScore,
        red_auto_score: redAutoScore,
		red_tele_score: redTeleScore,
		//red_balance_score: redBalanceScore,
		red_bonus_score: redBonusScore,
		fire_count: fire,
		air_count: air,
		red_penalties: redPenalties,
		
        blue_score: blueScore,
        blue_auto_score: blueAutoScore,
        blue_tele_score: blueTeleScore,
		//blue_balance_score: blueBalanceScore,
        blue_bonus_score: blueBonusScore,
        water_count: water,
		earth_count: earth,
		blue_penalties: bluePenalties
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
	console.log(blueBonusScore ,blueAutoScore ,blueTeleScore, blueBalanceScore)
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
			console.log("Score data from match: "+match_num);
			console.log(scores);
            // 0 is red win, 1 is blue win, 2 is tie
            var winScenario = 0;
            if (scores["blue_score"] > scores["red_score"]) {
                winScenario = 1;
            } else if (scores["blue_score"] == scores["red_score"]) {
                winScenario = 2;
            }

            var positions = ['red1', 'red2','red3', 'blue1', 'blue2','blue3'];
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
			console.log(y);
			//if (y.startsWith("0 results", 0)) return;
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
			//newData["balance_score"] = parseInt(teamData["balance_score"]) + scores[alliance + "_balance_score"];
            if (newData["matches_played"] < MAX_MATCHES){
				updateTeamData(newData);
			}
        }
    });
}

function clearTeamData() {

	var newData = {
		"balance_score": 0,
		"auto_score": 0,
		"tele_score": 0,
		"bonus_score": 0,
		"qualification_score": 0,
		"matches_played": 0
		
	};
    $.ajax({
        url: './php/getTeams.php',
        data: newData,
        type: 'POST',
        success: function (data) {

            var teamData = $.parseJSON(data);
            for (var i = 0; i < teamData.length; i++) {
                var teamNum = teamData[i]["team_num"];
                newData["team_num"] = teamNum;
                updateTeamData(newData);
            }
			
            console.log("Cleared team data");
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

					var positions = ['red1', 'red2','red3', 'blue1', 'blue2','blue3'];
					positions.forEach(function (pos) {
            
						addMatchToTeam(pos, match, scores, winScenario);
					});
				}
			}
			
            console.log("Recalculated team data");
		}
	});
}