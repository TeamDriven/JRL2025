
getData = function () {
	$.ajax({
		//give the url to go to (the .. means go up a folder)
		url: './php/getMatch.php',
		type: 'POST',
		data: { 'match_num': $('#inputBox').value },
		success: function (data) {
			//console.log(data); //print out the data

			//convert the JSON string to a JavaScript object (also called a key:value array)
			var info = $.parseJSON(data);
			for (var i = 0; i < 4; i++) {
				if (info[i]["position"] == "red1") {
					$("#red1").html(info["team_num"]);
					$("#red1Mobility").html(info["auto_mobility"]);
					$("#red1TeleBlock").html(info["tele_block"]);
					$("#red1AutoBlock").html(info["auto_block"]);
					$("#red1TeamBridgeBalance").html(info["team_bridge_balance"]);
					$("#red1BallBonus").html(info["ball_bonus"]);
					$("#red1Penalty").html(info["penalty"]);
				} else if (info[i]["position"] == "red2") {
					$("#red2").html(info["team_num"]);
					$("#red2Mobility").html(info["auto_mobility"]);
					$("#red2TeleBlock").html(info["tele_block"]);
					$("#red2AutoBlock").html(info["auto_block"]);
					$("#red2TeamBridgeBalance").html(info["team_bridge_balance"]);
					$("#red2BallBonus").html(info["ball_bonus"]);
					$("#red2Penalty").html(info["penalty"]);
				} else if (info[i]["position"] == "red3") {
					$("#red3").html(info["team_num"]);
					$("#red3Mobility").html(info["auto_mobility"]);
					$("#red3TeleBlock").html(info["tele_block"]);
					$("#red3AutoBlock").html(info["auto_block"]);
					$("#red3TeamBridgeBalance").html(info["team_bridge_balance"]);
					$("#red2BallBonus").html(info["ball_bonus"]);
					$("#red2Penalty").html(info["penalty"]);
				} else if (info[i]["position"] == "blue1") {
					$("#blue2").html(info["team_num"]);
					$("#blue2Mobility").html(info["auto_mobility"]);
					$("#blue2TeleBlock").html(info["tele_block"]);
					$("#blue2AutoBlock").html(info["auto_block"]);
					$("#blue2TeamBridgeBalance").html(info["team_bridge_balance"]);
					$("#blue2BallBonus").html(info["ball_bonus"]);
					$("#blue2Penalty").html(info["penalty"]);
				} else if(infor[i]["position"] == "blue2") { //blue 2
					$("#blue2").html(info["team_num"]);
					$("#blue2Mobility").html(info["auto_mobility"]);
					$("#blue2TeleBlock").html(info["tele_block"]);
					$("#blue2AutoBlock").html(info["auto_block"]);
					$("#blue2TeamBridgeBalance").html(info["team_bridge_balance"]);
					$("#blue2BallBonus").html(info["ball_bonus"]);
					$("#blue2Penalty").html(info["penalty"]);
				} else { //blue 3
					$("#blue3").html(info["team_num"]);
					$("#blue2Mobility").html(info["auto_mobility"]);
					$("#blue2TeleBlock").html(info["tele_block"]);
					$("#blue2AutoBlock").html(info["auto_block"]);
					$("#blue2TeamBridgeBalance").html(info["team_bridge_balance"]);
					$("#blue2BallBonus").html(info["ball_bonus"]);
					$("#blue2Penalty").html(info["penalty"]);
				}
			}

		},
	});
}

$(document).ready(function () {
	$('#submit_score').click(getData);
	//set interval causes a function to run every given miliseconds (in this case 500)
	setInterval(getData, 500);
});
