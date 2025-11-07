//var endGame = new Audio('./sounds/4_match_endgame.wav');
//endGame.play();

//This function updates the time display given the time as an int
function updateTime(newTime) {
    var min = Math.floor(newTime / 60).toString();
    var sec = newTime % 60;
    if (sec < 10) {
        sec = "0" + sec.toString();
    } else {
        sec = sec.toString();
    }
    var display = min + ":" + sec;
    $("#time").html(display);
}

var lastState = 2 //match view
var revealScore = false;
var lastData = {};

//this runs when the page has loaded
$(document).ready(function () {
	$("#RedWin").hide();
	$("#BlueWin").hide();
	$("#Tie").hide();
	$("#ScoreReveal").hide();

    //set interval causes a function to run every given miliseconds (in this case 500)
    setInterval(function () {
        calcScore();

        //this is a jQuery function to send a HTTP request
        $.ajax({
            //give the url to go to (the .. means go up a folder)
            url: './php/GetStatus.php',

            //this says what todo as soon as all the data has been loaded
            success: function (data) {
                //console.log(data); //print out the data
                console.log(data);
                //convert the JSON string to a JavaScript object (also called a key:value array)
                var info = $.parseJSON(data);
				lastData = info;

                //every value in the JavaScript object is a string so it must be converted to an int
                updateTime(parseInt(info["match_time"]));
                $("#blue1").html(info["blue1"]);
                $("#blue2").html(info["blue2"]);
                $("#blue3").html(info["blue3"]);
                $("#red1").html(info["red1"]);
                $("#red2").html(info["red2"]);
                $("#red3").html(info["red3"]);
                $("#redScore").html(info["red_score"]);
                $("#blueScore").html(info["blue_score"]);
				
				
				

                var matchNum = parseInt(info["match_num"]);
                if (matchNum < 300 && matchNum > 200) {
                    $("#matchNum").html("Practice Match #" + (matchNum - 200));
                } else if (matchNum < 400 && matchNum > 300) {
                    $("#matchNum").html("Pre-Quarters #" + (matchNum - 300));
                } else if (matchNum < 500 && matchNum > 400) {
                    $("#matchNum").html("Quarter Finals #" + (matchNum - 400));
                } else if (matchNum < 600 && matchNum > 500) {
                    $("#matchNum").html("Elims Match #" + (matchNum - 500));
                } else if (matchNum < 700 && matchNum > 600) {
                    $("#matchNum").html("Finals #" + (matchNum - 600));
                } else {
                    $("#matchNum").html("Match # " + (matchNum));
                }
				switch(info["display_state"]){
					case "1": //winner videos
						$("#background").hide();
						if (revealScore){
							showReveal();
						}else{
							$("#Videos").show();
							$("#centered").hide();
							
							$("#RedWin").hide();
							$("#BlueWin").hide();
							$("#Tie").hide();
							
							var restartVideo = lastState != 1;
							var vid = null;
								
							if(parseInt(lastData["red_score"]) > parseInt(lastData["blue_score"])){ //red wins
								vid = $("#RedWin");
							}else if(parseInt(lastData["red_score"]) < parseInt(lastData["blue_score"])){ //blue wins
								vid = $("#BlueWin");
							}else{
								vid = $("#Tie");
							}
							
							vid.show();
							if(restartVideo){
								vid[0].pause();
								vid[0].currentTime = 0;
								vid[0].playbackRate = 0.7;
								vid[0].play();
							}
							if (vid[0].ended){
								revealScore = true;
							}
							
							lastState = 1;
						}
						break;
					case "2": //match view
						revealScore = false;
						$("#Videos").hide();
						$("#centered").show();
						$("#background").hide();
						lastState = 2;
						break;
					case "3": //background only
						revealScore = false;
						$("#Videos").hide();
						$("#centered").hide();
						$("#background").show();
						lastState = 3;
						break;
				}
				
				
				if(!revealScore) $("#ScoreReveal").hide();
				
				
				$("#water_count").html(info["water_count"]);
                $("#earth_count").html(info["earth_count"]);
				
				$("#fire_count").html(info["fire_count"]);
                $("#air_count").html(info["air_count"]);
            }
        });

    }, 250);
});

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function showReveal(){
	updateReveal();
	//$("#centered").show();
	$("#ScoreReveal").show();
	$("#Videos").hide();
	
}

function updateReveal(){
	//$("#rev_matchNum").html($("#matchNum").html);
	document.getElementById('rev_matchNum').innerHTML = document.getElementById('matchNum').innerHTML;
	//console.log(lastData);
	$("#rev_blue1").html(lastData["blue1"]);
	$("#rev_blue2").html(lastData["blue2"]);
	$("#rev_blue3").html(lastData["blue3"]);
	$("#rev_red1").html(lastData["red1"]);
	$("#rev_red2").html(lastData["red2"]);
	$("#rev_red3").html(lastData["red3"]);
	$("#rev_redScore").html(lastData["red_score"]);
	$("#rev_blueScore").html(lastData["blue_score"]);
	$("#rev_redEndgame").html(lastData["red_bonus_score"]);
	$("#rev_blueEndgame").html(lastData["blue_bonus_score"]);
	$("#rev_redTele").html(lastData["red_tele_score"]);
	$("#rev_blueTele").html(lastData["blue_tele_score"]);
	$("#rev_redAuto").html(lastData["red_auto_score"]);
	$("#rev_blueAuto").html(lastData["blue_auto_score"]);
	$("#rev_redPenalties").html(lastData["red_penalties"]);
	$("#rev_bluePenalties").html(lastData["blue_penalties"]);
	
	/*
	{"match_time":"140","match_num":"9",
	"red_score":"126","blue_score":"126","red1":"12",
	"red2":"14","red3":"9","blue1":"28","blue2":"15",
	"blue3":"21","red_auto_score":"24",
	"red_tele_score":"12","red_balance_score":"0",
	"red_bonus_score":"90","fire_count":"0",
	"air_count":"4","blue_auto_score":"24",
	"blue_tele_score":"12","blue_balance_score":"6",
	"blue_bonus_score":"90","water_count":"4",
	"earth_count":"0","display_state":"1",
	"ranking_page_state":"0","score_lock":"0",
	"blue_confirm":"0","red_confirm":"0"}
	*/
}