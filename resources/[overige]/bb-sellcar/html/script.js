var viewInfo = false

$(function () {
    function display(bool) {
        if (bool) {
            document.getElementById("body").style.display="block";
            $(".container").show()
            $(".vehicleinfo").hide()
            $(".priceoption").hide()
            $(".selloption").show()
        } else {
            document.getElementById("body").style.display="none";
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                const box = document.querySelector('.container');
                box.classList.remove("finishanim");
                display(true)
            } else {
                if (viewInfo == true) {
                    viewInfo = false
                    display(false)
                } else{
                    const box = document.querySelector('.container');
                    box.classList.toggle('finishanim');
                    setTimeout(function() {
                        display(false)
                    }, 3000);
                }
            }
        }
        if (item.type === "info") {
            viewInfo = true
            document.getElementById("body").style.display="block";
            $(".vehicleinfo-plate-text").text(item.plate)
            $(".vehicleinfo-owner-text").text(item.username)
            $(".vehicleinfo-engine-text").text(item.engine)
            $(".vehicleinfo-turbo-text").text(item.turbo)
            $(".vehicleinfo-armor-text").text(item.armor)
            $(".vehicleinfo-brakes-text").text(item.brakes)
            $(".vehicleinfo-vel-text").text(item.vel+ ' km/h')
            $(".vehicleinfo-price-text").text(item.price+"€")
            $(".container").hide()
            $(".vehicleinfo").show()
            if (item.istheowner === true) {
                $(".vehicleinfo-buy-text").text("Kopen")
            } else {
                $(".vehicleinfo-buy-text").text("Buy")
            }
        }
    })

    $(".box-sellbutton").click(function () { 
        $(".selloption").hide()
        $(".priceoption").show()
    })

    $(".box-cancelbutton").click(function () { 
        $.post('https://bb-sellcar/exit', JSON.stringify({}));
    })

    $(document).on("click", ".priceoption-sellbutton", function(){
        $.post('https://bb-sellcar/sell', JSON.stringify({text: $("#inputprice").val()}));
        $.post('https://bb-sellcar/exit', JSON.stringify({}));
    });  
    
    $(".priceoption-cancelbutton").click(function () { 
        $.post('https://bb-sellcar/exit', JSON.stringify({}));
    })

    $(".vehicleinfo-cancel").click(function () { 
        $.post('https://bb-sellcar/exit', JSON.stringify({}));
    })

    $(".action-camara").click(function () { 
        $.post('https://bb-sellcar/camara', JSON.stringify({}));
    })

    $(".action-capo").click(function () { 
        $.post('https://bb-sellcar/abrircapo', JSON.stringify({}));
    })

    $(".action-maletero").click(function () { 
        $.post('https://bb-sellcar/abrirmaletero', JSON.stringify({}));
    })

    $(".action-puertas").click(function () { 
        $.post('https://bb-sellcar/abrirpuertas', JSON.stringify({}));
    })

    $(".vehicleinfo-buy-text").click(function () { 
        $.post('https://bb-sellcar/buy', JSON.stringify({}));
    })

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://bb-sellcar/exit', JSON.stringify({}));
            return
        }
    };
        
})