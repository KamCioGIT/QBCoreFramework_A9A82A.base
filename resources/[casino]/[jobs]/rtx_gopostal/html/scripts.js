var gopostalresourcename = "rtx_gopostal";

var synth = window.speechSynthesis;

function voice(speaktext){
    if (synth.speaking) {
        console.error('speechSynthesis.speaking');
        return;
    }
    var voicemanagment = new SpeechSynthesisUtterance(speaktext);
	const voices = window.speechSynthesis.getVoices();
    voicemanagment.pitch = 1.4;
    voicemanagment.rate = 1;
	voicemanagment.lang = "en";
	voicemanagment.voice = voices[8]; 
    synth.speak(voicemanagment);
}
var lettersender = {}
var lettertext = {}
var letterselected = {}

var itemlabel = {}
var itemselected = {}

var packagesender = {}
var packageprice = {}
var packageitems = {}
var packageselected = {}

function closeMainiWYJtcXenICFZbRdts9tH2bFwTAHNBMpX() {
	$("body").css("display", "none");
}
function openMainX() {
	$("body").css("display", "block");
}

$(".closegopostaldutymenu").click(function(){
    $.post('http://'+gopostalresourcename+'/quit', JSON.stringify({}));
});

$(".closegopostalmissionmenu").click(function(){
    $.post('http://'+gopostalresourcename+'/quit', JSON.stringify({}));
});

$(".closegopostalpackagesend").click(function(){
    $.post('http://'+gopostalresourcename+'/quit', JSON.stringify({}));
});

$(".closegopostalwarehouseend").click(function(){
    $.post('http://'+gopostalresourcename+'/quit', JSON.stringify({}));
});

$(".closegopostalservicechoose").click(function(){
    $.post('http://'+gopostalresourcename+'/quit', JSON.stringify({}));
});

$(".closegopostalsendletter").click(function(){
    $.post('http://'+gopostalresourcename+'/quit', JSON.stringify({}));
});

$(".closegopostalletters").click(function(){
    $.post('http://'+gopostalresourcename+'/quit', JSON.stringify({}));
});

$(".closegopostalsendpackage").click(function(){
    $.post('http://'+gopostalresourcename+'/quit', JSON.stringify({}));
});

$(".closegopostalpackages").click(function(){
    $.post('http://'+gopostalresourcename+'/quit', JSON.stringify({}));
});

window.addEventListener('message', function (event) {

	var item = event.data;
	
	if (item.message == "showinduty") {
		openMainX();
		$('#gopostalmission').hide();
		$('#showoffduty').hide();
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#gopostalpackagemissionend').hide();
		$('#missionprogressloading').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#gopostalduty').show();
		$('#showinduty').show();			
	}
	
	if (item.message == "showoffduty") {				
		openMainX();
		$('#gopostalmission').hide();
		$('#showinduty').hide();
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#gopostalpackagemissionend').hide();
		$('#missionprogressloading').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#gopostalduty').show();
		$('#showoffduty').show();			
	}
	
	if (item.message == "showmissionselect") {				
		openMainX();
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#gopostalpackagemissionend').hide();
		$('#missionprogressloading').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#gopostalmission').show();
	}	
		
	if (item.message == "showgopostalmissionpackageloadandunloadprogress") {				
		openMainX();
		document.getElementById("packagesinvehicle").innerHTML = item.currentpackagesingopostalvehicle;
		document.getElementById("packagesinvehiclemax").innerHTML = item.maxpackagesingopostalvehicle;		
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#gopostalpackagemissionend').hide();
		$('#missionprogressloading').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#packageloadprogress').show();
	}	

	if (item.message == "showgopostalloadingprogress") {				
		openMainX();
		document.getElementById("missionprogressheaderdataload").innerHTML = item.missionprogressheaderdata;
		document.getElementById("missionprogresstextdataload").innerHTML = item.missionprogresstextdata;		
		document.getElementById("missionprogressvaluedataload").innerHTML = item.missionprogressvaluedata;	
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionpackageinfo').hide();
		$('#gopostalpackagemissionend').hide();
		$('#missionprogresstext').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#missionprogressloading').show();
	}	
	
	
	if (item.message == "showgopostalmissionprogresstext") {				
		openMainX();
		document.getElementById("missionprogressheaderdata").innerHTML = item.missionprogressheaderdata;
		document.getElementById("missionprogresstextdata").innerHTML = item.missionprogresstextdata;		
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionpackageinfo').hide();
		$('#gopostalpackagemissionend').hide();
		$('#missionprogressloading').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#missionprogresstext').show();
	}		

	if (item.message == "showgopostalmissionpackageinfo") {				
		openMainX();
		document.getElementById("gopostalmisisonpackageinforecipientnamedata").innerHTML = item.missionrecipientname;
		document.getElementById("gopostalmisisonpackageinfoadressdata").innerHTML = item.missionrecipientadress;		
		document.getElementById("gopostalmisisonpackageinfoshipmentsdata").innerHTML = item.missionremainingshipments;	
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#gopostalpackagemissionend').hide();
		$('#missionprogressloading').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#missionpackageinfo').show();
	}

	if (item.message == "showmissiondeliverypackagesend") {				
		openMainX();
		document.getElementById("gopostalmissionpackagerewarddata").innerHTML = item.missionreward;
		document.getElementById("gopostalmissionpackagetimedata").innerHTML = item.missiontime;		
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#missionprogressloading').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#gopostalpackagemissionend').show();
	}

	if (item.message == "showmissiondeliverywarehouseend") {				
		openMainX();
		document.getElementById("gopostalmissionwarehouserewarddata").innerHTML = item.missionreward;
		document.getElementById("gopostalmissionwarehousetimedata").innerHTML = item.missiontime;		
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#missionprogressloading').hide();
		$('#gopostalpackagemissionend').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#gopostalwarehousemissionend').show();
	}	
	
	if (item.message == "showdeliverylocations") {				
		openMainX();
		$( ".deliverylocations" ).empty()
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#missionprogressloading').hide();
		$('#gopostalpackagemissionend').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#gopostaldeliverymissionlocations').show();
	}	
	
	if (item.message == "adddeliverylocation"){
		$( ".deliverylocations" ).append('<div class="deliverylocation">' +
					'<div class="container">' + 
						'<h4><div class="deliverylocationame"><b>' + item.deliveryname + '</b></h4></div>' +
						'<div class="deliverylocationadress">' + item.deliveryadress + '</div>' +
						'<div class="deliverylocationdistance"><span class="deliverylocationdistancedata">' + item.deliverydistance + '</span> km</div>' +
						'<div class="buttondeliverylocationmain">' + 
							'<div class="selectdeliverylocation" deliveryid="' + item.deliveryid + '">Choose</div>' + 
						'</div>' +			
					'</div>' +
				'</div>');		
	}

	if (item.message == "showservicesmenu") {				
		openMainX();		
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#missionprogressloading').hide();
		$('#gopostalpackagemissionend').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#gopostalcservicechoose').show();
	}	

	if (item.message == "showsendlettermenu") {				
		openMainX();		
		$("#gopostalfirstnamesendletter").val(""); 
		$("#gopostallastnamesendletter").val(""); 
		$("#gopostalsendlettertextdata").val(""); 
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#missionprogressloading').hide();
		$('#gopostalpackagemissionend').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#gopostalservicesendletter').show();
	}		
	
	if (item.message == "showlettersmenu") {				
		openMainX();		
		$( ".letters" ).empty()
		lettersender = {}
		lettertext = {}
		letterselected = {}
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#missionprogressloading').hide();
		$('#gopostalpackagemissionend').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostalservicesendletter').hide();
		$('#letterinfoshow').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#queueshow').hide();
		$('#gopostalserviceletters').show();
	}		
	
	if (item.message == "addletter"){
		$( ".letters" ).append('<div class="letter" letterid="' + item.letterid + '">' +
					'<div class="lettersender"><span class="lettersenderfrom">Letter from</span> ' + item.lettersender + '</div>' +
				'</div>');
		lettersender[item.letterid] = item.lettersender;
		lettertext[item.letterid] = item.lettertext;				
	}	
	
	if (item.message == "showsendpackagemenu") {				
		openMainX();	
		$("#gopostalfirstnamesendpackage").val(""); 
		$("#gopostallastnamesendpackage").val(""); 
		$("#gopostalcostsendpackage").val(""); 			
		itemlabel = {}
		itemselected = {}			
		$( ".inventorypackagessend" ).empty()
		$( ".packageitemssend" ).empty()	
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#missionprogressloading').hide();
		$('#gopostalpackagemissionend').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicepackages').hide();
		$('#itemcountshow').hide();	  
		$('#queueshow').hide();
		$('#gopostalservicesendpackage').show();
	}
	
	if (item.message == "updatepackageitems") {				
		$( ".packageitemssend" ).empty()
	}	
	
	if (item.message == "additeminventory"){
		$( ".inventorypackagessend" ).append('<div class="iteminventory" itemname="' + item.itemname + '">' +
					'<div class="inventoryiteminfo"><img class="itempicture" src="img/items/' + item.itemname + '.png"></img><span class="itemlabel">' + item.itemlabel + '</span><span class="itemcountmain">x <span class="itemcount">' + item.itemcount + '</span></span></div>' +
				'</div>');
		itemlabel[item.itemname] = item.itemlabel;	
	}		
	
	if (item.message == "additempackage"){
		$( ".packageitemssend" ).append('<div class="itempackage" itemname="' + item.itemname + '">' +
					'<div class="inventoryiteminfo"><img class="itempicture" src="img/items/' + item.itemname + '.png"></img><span class="itemlabel">' + item.itemlabel + '</span><span class="itemcountmain">x <span class="itemcount">' + item.itemcount + '</span></span></div>' +
				'</div>');
	}			

	if (item.message == "showspackagesmenu") {				
		openMainX();		
		packagesender = {}
		packageprice = {}
		packageitems = {}	
		packageselected = {}	
		$( ".packages" ).empty()
		$( ".packageitems" ).empty()
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionprogresstext').hide();
		$('#missionpackageinfo').hide();
		$('#missionprogressloading').hide();
		$('#gopostalpackagemissionend').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#packageinfoshow').hide();
		$('#queueshow').hide();
		$('#gopostalservicepackages').show();
	}	

	if (item.message == "addpackage"){
		$( ".packages" ).append('<div class="package" packageid="' + item.packageid + '">' +
					'<div class="packagesender"><span class="packagesenderfrom">Package from</span> ' + item.packagesender + '</div>' +
				'</div>');
		packagesender[item.packageid] = item.packagesender;
		packageprice[item.packageid] = item.packageprice;	
		packageitems[item.packageid] = item.packageitems;
	}		
	
	if (item.message == "additempackagetake"){
		$( ".packageitems" ).append('<div class="itempackagetake" itemname="' + item.itemname + '">' +
					'<div class="inventoryiteminfo"><img class="itempicture" src="img/items/' + item.itemname + '.png"></img><span class="itemlabel">' + item.itemlabel + '</span><span class="itemcountmain">x <span class="itemcount">' + item.itemcount + '</span></span></div>' +
				'</div>');
	}		

	if (item.message == "showqueue") {				
		openMainX();
		document.getElementsByClassName("queuecounterdata")[0].innerHTML = item.counternumber;	
		document.getElementsByClassName("queuenumberdata")[0].innerHTML = item.queuenumber;
		$('#gopostalduty').hide();
		$('#showinduty').hide();
		$('#showoffduty').hide();	
		$('#gopostalmission').hide();
		$('#packageloadprogress').hide();
		$('#missionpackageinfo').hide();
		$('#gopostalpackagemissionend').hide();
		$('#missionprogressloading').hide();
		$('#gopostalwarehousemissionend').hide();
		$('#gopostalcservicechoose').hide();
		$('#gopostaldeliverymissionlocations').hide();
		$('#gopostalservicesendletter').hide();
		$('#gopostalserviceletters').hide();
		$('#gopostalservicesendpackage').hide();
		$('#gopostalservicepackages').hide();
		$('#missionprogresstext').hide();
		$('#queueshow').show();
	}	

	if (item.message == "hidequeue") {				
		$('#queueshow').hide();
	}	

	if (item.message == "voice") {				
		voice(item.speaktext);
	}		
		
	if (item.message == "hide") {
		closeMainiWYJtcXenICFZbRdts9tH2bFwTAHNBMpX();
	}
	
	if (item.message == "updateinterfacedata") {
		gopostalresourcename = item.gopostalresourcenamedata;
		let root = document.documentElement;
		root.style.setProperty('--color', item.interfacecolordata);	
	}			
	
    document.onkeyup = function (data) {
        if (open) {
            if (data.which == 27) {
				$.post('http://'+gopostalresourcename+'/quit', JSON.stringify({}));
            }
        }	
	};
});

$(".quitdutybutton").click(function () {
	$.post('http://'+gopostalresourcename+'/quitduty', JSON.stringify({}));
});

$(".enterdutybutton").click(function () {
	$.post('http://'+gopostalresourcename+'/enterduty', JSON.stringify({}));
});

$(".selectpackagesdelivery").click(function () {
	$.post('http://'+gopostalresourcename+'/selectmissionpackagesdelivery', JSON.stringify({}));
});

$(".selectwarehousedelivery").click(function () {
	$.post('http://'+gopostalresourcename+'/selectmissionwarehousedelivery', JSON.stringify({}));
});

$(".selectendbuttonmissionpackage").click(function () {
	$.post('http://'+gopostalresourcename+'/endmissionpackagedelivery', JSON.stringify({}));
});

$(".selectendbuttonmissionwarehouse").click(function () {
	$.post('http://'+gopostalresourcename+'/endmissionwarehousedelivery', JSON.stringify({}));
});

$(".selectsendparcelbutton").click(function () {
	$.post('http://'+gopostalresourcename+'/selectsendparcelbutton', JSON.stringify({}));
});

$(".selectsendletterbutton").click(function () {
	$.post('http://'+gopostalresourcename+'/selectsendletterbutton', JSON.stringify({}));
});

$(".selectwithdrawparcelbutton").click(function () {
	$.post('http://'+gopostalresourcename+'/selectwithdrawparcelbutton', JSON.stringify({}));
});

$(".selectwithdrawletterbutton").click(function () {
	$.post('http://'+gopostalresourcename+'/selectwithdrawletterbutton', JSON.stringify({}));
});

$(".gopostalsendletterbutton").click(function () {
	$.post('http://'+gopostalresourcename+'/sendletter', JSON.stringify({
		letterfirstname: $("#gopostalfirstnamesendletter").val().trim(),
		letterlastname: $("#gopostallastnamesendletter").val().trim(),
		lettertext: $("#gopostalsendlettertextdata").val().trim()
	}));		
});

$(".deliverylocations").on("click", ".selectdeliverylocation", function() {
	var $button = $(this);
	var $name = $button.attr('deliveryid')
	$.post('http://'+gopostalresourcename+'/selectdeliverylocation', JSON.stringify({
		deliveryidselected: $name
	}));
});

$(".letters").on("click", ".letter", function() {
	var $button = $(this);
	var $name = $button.attr('letterid')
	letterselected = $name; 
	document.getElementsByClassName("gopostalsendernameletterinfotextother")[0].innerHTML = lettersender[$name];
	document.getElementsByClassName("gopostalletterinfotextlettermain")[0].innerHTML = lettertext[$name];		
	$('#letterinfoshow').show();	         
});

$(".inventorypackagessend").on("click", ".iteminventory", function() {
	var $button = $(this);
	var $name = $button.attr('itemname')
	itemselected = $name; 
	document.getElementsByClassName("itemnamesendcount")[0].innerHTML = itemlabel[$name];	
	$("#gopostalitemcountdata").val("1"); 
	$('#itemcountshow').show();	         
});

$(".closecountchoose").click(function () {
	itemselected = {};
	$('#itemcountshow').hide();	  
});

$(".gopostaladditembutton").click(function () {
	var $name = itemselected;
	$.post('http://'+gopostalresourcename+'/addpackageitem', JSON.stringify({
		itemname: $name,
		itemlabel: itemlabel[$name],
		itemcount: $("#gopostalitemcountdata").val().trim(),
	}));
	itemselected = {};
	$('#itemcountshow').hide();	  	
});

$(".packageitemssend").on("click", ".itempackage", function() {
	var $button = $(this);
	var $name = $button.attr('itemname')
 	$.post('http://'+gopostalresourcename+'/removepackageitem', JSON.stringify({
		itemname: $name
	}));    
});

$(".gopostalsendpackagebutton").click(function () {
	$.post('http://'+gopostalresourcename+'/sendpackage', JSON.stringify({
		packagefirstname: $("#gopostalfirstnamesendpackage").val().trim(),
		packagelastname: $("#gopostallastnamesendpackage").val().trim(),
		packageprice: $("#gopostalcostsendpackage").val().trim()
	}));		
});

$(".gopostalletterinfodelete").click(function () {
	var $name = letterselected;
	$.post('http://'+gopostalresourcename+'/deleteletter', JSON.stringify({
		letterid: $name
	}));	
});

$(".packages").on("click", ".package", function() {
	var $button = $(this);
	var $name = $button.attr('packageid')
	$( ".packageitems" ).empty()
	$.post('http://'+gopostalresourcename+'/addpackagesitems', JSON.stringify({
		packageitems: packageitems[$name]
	}));			
	packageselected = $name; 
	document.getElementsByClassName("gopostalsendernamepackageinfotextother")[0].innerHTML = packagesender[$name];	
	document.getElementsByClassName("packageprice")[0].innerHTML = packageprice[$name];	
	$('#packageinfoshow').show();	         
});

$(".gopostalreturnpackagebutton").click(function () {
	var $name = packageselected;
	$.post('http://'+gopostalresourcename+'/returnpackage', JSON.stringify({
		packageid: $name,
		packagesender: packagesender[$name]
	}));	
});

$(".gopostaltakepackagebutton").click(function () {
	var $name = packageselected;
	$.post('http://'+gopostalresourcename+'/takepackage', JSON.stringify({
		packageid: $name,
		packagesender: packagesender[$name],
		packageprice: packageprice[$name]
	}));	
});