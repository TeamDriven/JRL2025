var counter = {
    "auto_fire1": 0, "auto_fire2": 0, 
	"tele_fire1": 0, "tele_fire2": 0, "tele_fire3": 0,
	
	"auto_air1": 0, "auto_air2": 0, 
	"tele_air1": 0, "tele_air2": 0, "tele_air3": 0,
	
	"auto_water1": 0, "auto_water2": 0, 
	"tele_water1": 0, "tele_water2": 0, "tele_water3": 0,
	
	"auto_earth1": 0, "auto_earth2": 0, 
	"tele_earth1": 0, "tele_earth2": 0, "tele_earth3": 0,
	
	"red_auto_mob": 0, "red_auto_disp": 0, "red_auto_pool": 0, "red_tele_pool": 0,
	"red_endgame_climb": 0, "red_endgame_park": 0, "red_endgame_wizlow": 0, "red_endgame_wizmid": 0, "red_endgame_wizhigh": 0,
	
	"blue_auto_mob": 0, "blue_auto_disp": 0, "blue_auto_pool": 0, "blue_tele_pool": 0,
	"blue_endgame_climb": 0, "blue_endgame_park": 0, "blue_endgame_wizlow": 0, "blue_endgame_wizmid": 0, "blue_endgame_wizhigh": 0,
	
	"red_foul": 0, "red_techfoul": 0,
	"blue_foul": 0, "blue_techfoul": 0,
 
};
pos = "red1";
lastTeamNum = 0;

$(document).ready(function () {

    //set interval causes a function to run every given miliseconds (in this case 500)
    setInterval(function () {
        if ($("#position_select").val().includes('1')) {
            $(".one").show();
            $(".two").hide();
        } else {
            $(".one").hide();
            $(".two").show();
        }

        //this is a jQuery function to send a HTTP request
        $.ajax(
            {

                //give the url to go to (the .. means go up a folder)
                url: './php/GetTeamNumber.php',
                data: { 'position': $("#position_select").val() },
                type: 'POST',
                //this says what todo as soon as all the data has been loaded
                success: function (data) {
                    console.log(data);
                    if (lastTeamNum != parseInt(data)) {
                        //clear data
                        for (id in counter) {
                            counter[id] = 0;
                            console.log(id);
                            document.getElementById(id +"Counter").innerHTML = 0;

                        }
                    }
                    lastTeamNum = parseInt(data);
                }

            });

    }, 500);
});

$("#reset").click(function () {
    for (id in counter) {
        counter[id] = 0;

        document.getElementById(id + "Counter").innerHTML = 0;

    }
});

function add(ele) {
    var id = ele.id;
    id = id.replace("AddButton", "");
    counter[id]++;
    var max = ele.getAttribute("max");
    if (max != null) {
        if (counter[id] > parseInt(max)) {
            counter[id] = max;
        }
    }
    document.getElementById(id + "Counter").innerHTML = counter[id];
    sendScore(id);
}

function sub(ele) {
    var id = ele.id;
    id = id.replace("SubButton", "");
    counter[id]--;
    var min = ele.getAttribute("min");
    if (min != null) {
        if (counter[id] < parseInt(min)) {
            counter[id] = min;
        }
    }
    document.getElementById(id + "Counter").innerHTML = counter[id];
    sendScore(id);
}

function checkChange(ele) {
    counter[ele.id] = ele.checked ? 1 : 0;
    sendScore(ele.id);
}

function sendScore(id) {
    var alliance = $("#position_select").val().slice(0, -1);
    if (id.includes("coin"))
        alliance = $("#position_select").val();
    var key = alliance + "_" + id;
    var vals = { [key]: counter[id] };
    $.ajax(
        {
            //give the url to go to (the .. means go up a folder)
            url: './php/sendScore.php',
            data: vals,
            type: 'POST',
            //this says what todo as soon as all the data has been loaded
            success: function (info) {
                console.log(info);
            }

        });
}
