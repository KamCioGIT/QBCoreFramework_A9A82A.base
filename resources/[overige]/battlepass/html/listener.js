
$('#body').hide();

var url


function startSlider() {
    
var sliderDom = {};
var sliderProperties = {};
var slideToPosition = 0;
var loopSlider = true; 
var svgs = {};
svgs.leftchevron = `<?xml version="1.0" encoding="UTF-8"?><svg enable-background="new 0 0 404.258 404.258" version="1.1" viewBox="0 0 404.258 404.258" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><polygon points="289.93 18 265.93 0 114.33 202.13 265.93 404.26 289.93 386.26 151.83 202.13"/></svg>`;
svgs.rightchevron = `<?xml version="1.0" encoding="UTF-8"?><svg enable-background="new 0 0 404.258 404.258" version="1.1" viewBox="0 0 404.258 404.258" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><polygon points="138.33 0 114.33 18 252.43 202.13 114.33 386.26 138.33 404.26 289.93 202.13"/></svg>`;


function initSlider() {
    sliderDom.sliderWrapper = document.getElementById("slider-wrapper");
    sliderDom.slider = document.getElementById("slider");
    sliderDom.sliderItems = document.getElementsByClassName("slider__item");
    sliderDom.sliderPrevious = document.getElementById("slider-previous");
    sliderDom.sliderNext = document.getElementById("slider-next"); 
    sliderDom.sliderPaginationWrapper = document.getElementById("slider-pagination");   
    sliderDom.sliderPrevious.innerHTML = svgs.leftchevron;
    sliderDom.sliderNext.innerHTML = svgs.rightchevron;
    sliderProperties.isAnimating = false;
    sliderProperties.isAtBeginning = true;
    sliderProperties.isAtEnd = false;
    sliderProperties.currentPosition = 0;
    sliderProperties.oneSlideWidth = 0;
    sliderProperties.sliderItemSpacing = parseInt(getComputedStyle(sliderDom.sliderItems[1]).marginRight, 20) * 25;

    updateSliderProperties();

    sliderDom.sliderPrevious.addEventListener("click", slidePrevious);
    sliderDom.sliderNext.addEventListener("click", slideNext);
    sliderDom.slider.addEventListener('transitionend', () => {
        sliderProperties.isAnimating = false;
    });

    window.addEventListener('resize', resetSlider);
    sliderDom.slider.addEventListener('transitionend', () => {
        sliderProperties.isAnimating = false;
    });
}

function slidePrevious() {
    
    if (sliderProperties.isAnimating || sliderProperties.isAtBeginning) {
        if (!loopSlider) {
            return;   
        }
    }
    
    if (loopSlider && sliderProperties.isAtBeginning) {
        slideToPosition = -(sliderProperties.sliderTotalWidth - (sliderProperties.oneSlideWidth - sliderProperties.sliderItemSpacing));
        sliderProperties.isAtBeginning = false;
        sliderProperties.isAtEnd = true;
    } else {
        sliderProperties.isAnimating = true;
        sliderProperties.isAtEnd = false;

        slideToPosition = sliderProperties.currentPosition + sliderProperties.oneSlideWidth + sliderProperties.sliderItemSpacing;

        if (slideToPosition >= 0) {
            slideToPosition = 0;
            sliderProperties.isAtBeginning = true;
        } else {
            sliderProperties.isAtBeginning = false;
        }
    }
    
    sliderDom.slider.style.webkitTransform = `translateX(${slideToPosition}px)`;
    sliderProperties.currentPosition = slideToPosition;
}

function slideNext() {
    
    if (sliderProperties.isAnimating || sliderProperties.isAtEnd) {
        if (!loopSlider) {
            return;   
        }
    }
    
    if (loopSlider && sliderProperties.isAtEnd) {
        slideToPosition = 0;
        sliderProperties.isAtBeginning = true;
        sliderProperties.isAtEnd = false;
    } else {
        sliderProperties.isAtBeginning = false;
        sliderProperties.isAnimating = true;

        slideToPosition = sliderProperties.currentPosition - (sliderProperties.oneSlideWidth + sliderProperties.sliderItemSpacing);

        if (slideToPosition <= -(sliderProperties.sliderTotalWidth - sliderProperties.oneSlideWidth)) {
            slideToPosition = -(sliderProperties.sliderTotalWidth - (sliderProperties.oneSlideWidth - sliderProperties.sliderItemSpacing));
            sliderProperties.isAtEnd = true;   
        } else {
            sliderProperties.isAtEnd = false;
        }   
    }

    sliderDom.slider.style.webkitTransform = `translateX(${slideToPosition}px)`;
    sliderProperties.currentPosition = slideToPosition;
}

function resetSlider() {
    sliderDom.slider.style.webkitTransform = "translateX(0)";
    sliderProperties.isAtBeginning = true;
    sliderProperties.isAtEnd = false;
    sliderProperties.currentPosition = 0;
    updateSliderProperties();
}

function updateSliderProperties() {
    sliderProperties.sliderWrapperWidth = sliderDom.sliderWrapper.offsetWidth;
    sliderProperties.oneSlideWidth = sliderDom.slider.offsetWidth;
    sliderProperties.sliderItemWidth = sliderDom.sliderItems[0].offsetWidth;
    sliderProperties.sliderTotalWidth = calculateSliderTotalWidth(sliderDom.sliderItems);
}

function calculateSliderTotalWidth(sliderItems) {
    var width = 0;
    var itemSpacingNumber = sliderItems.length - 2;
    
    for(var i = 0; i < sliderItems.length; i++) {
        width += sliderItems[i].offsetWidth;
    }
    
    if (sliderProperties.sliderItemSpacing > 0) {
        width += sliderProperties.sliderItemSpacing * itemSpacingNumber;   
    }
    
    return width;
}

document.addEventListener("DOMContentLoaded", initSlider);
}

function openWeb() {
    window.invokeNative('openUrl', url);
}

  



$(function(){
	window.onload = function(e) {
		window.addEventListener("message", (event) => {
			var item = event.data;
			var test = item.points;
			var rank = item.rank;
			var coins = item.coins;
			var vip = item.vip;
			var porcentajecompletado = item.porcentajecompletado;
			var recompensas = item.recompensas;
			var recompensa = item.recompensa;
			var recompensavip = item.recompensavip;
			document.getElementById('points').innerHTML = test;
			document.getElementById('recompensa').innerHTML = recompensa;
			document.getElementById('recompensavip').innerHTML = recompensavip;
			document.getElementById('recompensas').innerHTML = recompensas;
            document.getElementById('firstname').innerHTML = item.firstname;
            document.getElementById('xppendiente').innerHTML = item.xppendiente;
            document.getElementById('passprice').innerHTML = item.passprice;
            document.getElementById('countdownseason').innerHTML = item.countdownseason;
            document.getElementById('seasonnumber').innerHTML = item.seasonnumber;
            document.getElementById('siguienterango').innerHTML = item.siguienterango;
			document.getElementById('coins').innerHTML = coins; 
            document.getElementById('rank').style.marginRight='9%';
            
           
            if (vip === true) {
                document.getElementById('iconuserstatus').src="./img/v7_31.png";
            } else {
                document.getElementById('iconuserstatus').src="./img/v41_29.png";
            }
            document.getElementById('rank').innerHTML = rank; 
			document.getElementById('progress').style.width = porcentajecompletado+'%';		

			if(item !== undefined && item.type === "ui") {
				if (item.display === true) {
                    url = item.urlwebsite;
                    $('#confirmvip').hide();
                    $('#body').show();
                    $('#cw').show();
                    $('#slider-previous').show();
                    $('#slider-next').show();
					$('#container').show();
					$("#close").click(function () {
					        $.post('https://battlepass/exit', JSON.stringify({}));
				        return}) 
					$("#vip").click(function () {
							if (item.levels === true) {
                                $('#cw').hide();
                                $('#slider-previous').hide();
                                $('#slider-next').hide();
								$('#25price').text(item.levelsprice)
					        	$('#confirmvip').show();
							} else {
                                $('#body').hide();
								$.post('https://battlepass/becomevip', JSON.stringify({text:false}));	
							}
				        return}) 
					$("#becomevipyes").click(function () {
                            $('#confirmvip').hide();
                            $('#body').hide();
					    	$.post('https://battlepass/becomevip', JSON.stringify({text:true}));
				        return}) 
					$("#becomevipno").click(function () {
                            $('#confirmvip').hide();
                            $('#body').hide();
					        $.post('https://battlepass/becomevip', JSON.stringify({text:false}));
				        return}) 
					
					  			
				} else {
					$('#body').hide();
				}
			}
		}) 
	}


})

startSlider()

document.onkeyup = function (data) {
    if (data.which == 27 ) {
        $('#body').hide();
        $('#confirmvip').hide();
        $.post('https://battlepass/exit', JSON.stringify({}));
    }
  };