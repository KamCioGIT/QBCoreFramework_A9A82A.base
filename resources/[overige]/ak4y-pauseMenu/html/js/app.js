var discordURL = "https://www.discord.gg/ak4y";
var instagramURL = "https://www.instagram.com/";
var youtubeURL = "https://www.youtube.com/";

$(document).on("click", ".rightGameItem", function () {
    var selectedDiv = this.id;
    $(".playingGameSection").show();
    if (selectedDiv == "hextris") {
        appendDiv = `
            <iframe class="gamePlay" src="https://fosiper.com/games/hextris-lite/"></iframe>
            <div class="closeButtonGame">X</div>
        `;
        $(".playGameArea").html(appendDiv);
    } else if (selectedDiv == "towerBuilding") {
        appendDiv = `
        <iframe class="gamePlay" src="https://iamkun.github.io/tower_game/"></iframe>
        <div class="closeButtonGame">X</div>
    `;
        $(".playGameArea").html(appendDiv);
    } else if (selectedDiv == "drillBunny") {
        appendDiv = `
        <iframe class="gamePlay" src="https://dreamshowadventures.github.io/LudumDare29/"></iframe>
        <div class="closeButtonGame">X</div>
    `;
        $(".playGameArea").html(appendDiv);
    } else if (selectedDiv == "pacman") {
        appendDiv = `
        <iframe class="gamePlay" src="https://rishabhdevbanshi.github.io/Pacman-Game/"></iframe>
        <div class="closeButtonGame">X</div>
    `;
        $(".playGameArea").html(appendDiv);
    } else if (selectedDiv == "pool") {
        appendDiv = `
        <iframe class="gamePlay" src="https://henshmi.github.io/Classic-Pool-Game/"></iframe>
        <div class="closeButtonGame">X</div>
    `;
        $(".playGameArea").html(appendDiv);
    } else if (selectedDiv == "tetris") {
        appendDiv = `
        <iframe class="gamePlay" src="https://tetris.hericl.es/"></iframe>
        <div class="closeButtonGame">X</div>
    `;
        $(".playGameArea").html(appendDiv);
    }
});

$(document).on("click", ".wrapperItems", function () {
    var selectedDiv = this.id;
    if (selectedDiv == "discordItem") {
        window.invokeNative("openUrl", discordURL);
    } else if (selectedDiv == "settingsItem") {
        $.post("https://ak4y-pauseMenu/openSettings", JSON.stringify());
        $(".pauseGeneral").hide();
    } else if (selectedDiv == "resumeItem") {
        $.post("https://ak4y-pauseMenu/closeMenu", JSON.stringify());
        $(".pauseGeneral").hide();
    } else if (selectedDiv == "mapItem") {
        $.post("https://ak4y-pauseMenu/openMap", JSON.stringify());
        $(".pauseGeneral").hide();
    } else if (selectedDiv == "exitItem") {
        $(".exitSection").show();
    }
});

$(document).on("click", "#cancelButton", function () {
    $(".exitSection").hide();
});

$(document).on("click", "#exitButton", function () {
    $.post("https://ak4y-pauseMenu/exit", JSON.stringify());
});

$(document).on("click", ".closeButtonGame", function () {
    $(".playGameArea").empty();
    $(".playingGameSection").hide();
});

$(document).on("click", ".midBottomFirstBox", function () {
    window.invokeNative("openUrl", youtubeURL);
});

$(document).on("click", ".midBottomSecondBox", function () {
    window.invokeNative("openUrl", instagramURL);
});

var profilePhoto = "";
var firstOpen = true;

window.addEventListener("message", function (event) {
    var v = event.data;
    switch (v.action) {
        case "show":
            if (firstOpen) {
                firstOpen = false;
                var xhr = new XMLHttpRequest();
                xhr.responseType = "text";
                xhr.open("GET", v.steamid, true);
                xhr.send();
                xhr.onreadystatechange = processRequest;
                function processRequest(e) {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        var string = xhr.responseText.toString();
                        var array = string.split("avatarfull");
                        var array2 = array[1].toString().split('"');
                        profilePhoto = array2[2].toString();
                        $(".ppPhoto").attr("src", profilePhoto);
                    }
                }
            } else {
                $(".ppPhoto").attr("src", profilePhoto);
            }

            $(".pauseGeneral").show();
            $(".genderInfo").html(v.gender);
            $(".secondJobInfo").html(v.job);
            $(".charInfoFirstName").html(v.firstname);
            $(".charInfoLastName").html(v.lastname);
            $(".cashMoneyAmount").html(`
            <span>$</span>
            ${setCurrency(v.moneyCash)}
            `);
            $(".bankMoneyAmount").html(`
            <span>$</span>
            ${setCurrency(v.moneyBank)}
            `);
            $("#currentPlayer").html(v.connectedPlayers);
            $("#maxPlayer").html(`
                /${v.maxPlayers}
            `);
            break;
        case "setJS":
            discordURL = v.discordURL;
            instagramURL = v.instagramURL;
            youtubeURL = v.youtubeURL;
            $("#dcText").html(v.translate.discord);
            $("#settingsText").html(v.translate.settings);
            $("#resumeText").html(v.translate.resume);
            $("#mapText").html(v.translate.map);
            $("#exitText").html(v.translate.exit);
            $(".genderText").html(v.translate.gender);
            $(".secondJobText").html(v.translate.job);
            $(".bottomInstaText").html(v.translate.instagram);
            $(".serverText").html(v.translate.server);
            $(".onlineText").html(v.translate.online);
            $(".rightTopTitle").html(v.translate.miniGames);
            $(".rightTopDesc").html(v.translate.miniGamesDesc);
            $(".youText").html(v.translate.you);
            $(".tubeText").html(v.translate.tube);
            $(".cashText").html(v.translate.cash);
            $(".bankText").html(v.translate.bank);
            $(".moneyText").html(v.translate.money);
            $(".doYouWantExitText").html(v.translate.wantExit);
            $("#cancelButton").html(v.translate.cancelButton);
            $("#exitButton").html(v.translate.exitButton);
            break;
    }
});

$(document).on("keydown", function () {
    switch (event.keyCode) {
        case 27:
            $.post("https://ak4y-pauseMenu/closeMenu", JSON.stringify());
            $(".pauseGeneral").hide();
            break;
    }
});

function setCurrency(price) {
    return price.toLocaleString("nl-NL", { style: "decimal", maximumFractionDigits: 0, minimumFractionDigits: 0 });
}
