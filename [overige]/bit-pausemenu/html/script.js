var website
var discord
var earnmoneyoption
var shopoption
var inventoryoption

function openWeb() {
    if (shopoption === true) {
        $.post('https://bit-pausemenu/exit', JSON.stringify({}));
        $.post('https://bit-pausemenu/shopoptioncommand', JSON.stringify({}));
    } else {
        window.invokeNative('openUrl', website);
    }
}

function openDis() {
    if (earnmoneyoption === true) {
        $.post('https://bit-pausemenu/exit', JSON.stringify({}));
        $.post('https://bit-pausemenu/earnmoneycommand', JSON.stringify({}));
    } else {
        window.invokeNative('openUrl', discord);
    }
}


$(function () {
    function display(bool, item) {
        if (bool) {
            if (item.earnmoneyoption === true) {
                earnmoneyoption = item.earnmoneyoption
            } else if (item.shopoption === true) {
                shopoption = item.shopoption
            } else if (item.inventoryoption === true) {
                inventoryoption = item.inventoryoption
            }
            if (item.bp === true) {
                $("#prime").html('<img class="prime-img-bp" src="./img/crown.png"><span class="prime-title-first">'+item.servername+'</span><span class="prime-title-second">BATTLEPASS</span>')
            } else {
                $("#prime").html('<img id="prime-img" class="prime-img" src="./img/logo.png">')
            }
            $("#username").text(item.username)
            if (item.showphone === true) {
                $("#user-phone").html('<span class="phone-text"><img class="phone-icon" src="./img/phone.png"> </span><span id="phone-data" class="phone-data">634721659</span>')
                $("#phone-data").text(item.userphone)
            }
            if (item.showiban === true) {
                $("#user-iban").html('<span class="iban-text">IBAN</span><span id="iban-data" class="iban-data"></span>')
                $("#iban-data").text(item.useriban)
            }
            $("#cash-data").text(item.usercash+"$")
            $("#bank-data").text(item.userbank+"$")
            $("#work-data1").text(item.userjob)
            $("#work-data2").text(item.userjobgrade)
            $("#eventitem-title").text(item.eventtitle)
            $("#events-data").text(item.eventtitle)
            $("#eventitem-text").text(item.eventtext)
            $("#eventitem-img").attr("src",item.eventimg)
            $("#eventitem").hide()
            document.getElementById("body").style.display="block";
        } else {
            document.getElementById("body").style.display="none";
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true, item)
                website = item.website;
                discord = item.discord;
            } else {
                display(false)
            }
        }
    })
    
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://bit-pausemenu/exit', JSON.stringify({}));
            return
        }
    };

    $("#map").click(function () { 
        $.post('https://bit-pausemenu/map', JSON.stringify({}));
    })

    $("#configuration").click(function () { 
        $.post('https://bit-pausemenu/configuration', JSON.stringify({}));
    })

    $("#prime").click(function () { 
        $.post('https://bit-pausemenu/prime', JSON.stringify({}));
    })

    $("#inventory").click(function () { 
        $.post('https://bit-pausemenu/inventory', JSON.stringify({}));
    })

    $("#report").click(function () { 
        $.post('https://bit-pausemenu/report', JSON.stringify({}));
    })

    $("#events").click(function () { 
        $("#eventitem").show()
    })

    $("#eventitem-close").click(function () { 
        $("#eventitem").hide()
    })
        
})