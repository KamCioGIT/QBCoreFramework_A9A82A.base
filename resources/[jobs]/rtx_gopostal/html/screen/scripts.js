function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
    function (m, key, value) {
        vars[key] = value;
    });
    return vars;
}
var counterdata = getUrlVars()["data1"];
if (counterdata) { 
    document.getElementsByClassName("counter1data")[0].innerHTML = counterdata;
}

var counterdata2 = getUrlVars()["data2"];
if (counterdata2) { 
    document.getElementsByClassName("counter2data")[0].innerHTML = counterdata2;
}