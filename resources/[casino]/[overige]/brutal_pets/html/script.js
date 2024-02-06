BigPos = localStorage.getItem("BigMenuPosition")
SmallPos = localStorage.getItem("SmallMenuPosition")
TaskPos = localStorage.getItem("TaskMenuPosition")
button_down = 0
InSmallMenuPos = false
InPetChooser = false
InPetMenu = false
InShop = false
HavePet = false
HideSmallMenu = false
IsAnyOrder = false
ChoosedOrderType = "me"
AllOrders = 0
AllPrice = 0
AssistList = []

if (localStorage.getItem("BigMenuPosition") === "null"){
  BigPos = "20, 250"
}

if (localStorage.getItem("SmallMenuPosition") === "null"){
  SmallPos = "20, 250"
}

if (localStorage.getItem("TaskMenuPosition") === "null"){
  TaskPos = "500, 800"
}

localStorage.setItem("TaskMenuPosition", TaskPos)
localStorage.setItem("BigMenuPosition", BigPos)
localStorage.setItem("SmallMenuPosition", SmallPos)

NameOpened = 0

panel = document.getElementById("pet-section")
tasks = document.getElementById("tasks_container")

tasks.style.left = TaskPos.split(',')[0] + 'px'
tasks.style.top = TaskPos.slice(TaskPos.indexOf(',') + 1) + 'px'

panel.style.left = SmallPos.split(',')[0] + 'px'
panel.style.top = SmallPos.slice(SmallPos.indexOf(',') + 1) + 'px'

window.addEventListener('message', function(event) {
    let data = event.data
   
    if (data.action === "SendDefaults") {
      Pets = data.petlist
      MoneyForm = data.moneyform
      PremiumForm = data.premiumform
      Itemlist = data.items
      MaxOrder = data.maxamount 

      $(".tasks_container").css("top", data.top+"%")
      $(".tasks_container").css("left", data.left+"%")
    }
    else if (data.action === "HavePet") {
      if (data.info === true && InPetMenu === false && InShop === false && HideSmallMenu === false){
        HavePet = true
        PetCount = data.petcount

        if (PetCount > 1){
          $(".pet_switch_con").css("display", "block")
        }
        else{
          $(".pet_switch_con").css("display", "none")
        }

        show(".pet-section")
        show(".small-mode")
        $(".pet-section .small-mode .pet_img_small").attr("src", "assets/"+data.img+".png")
        PetShowDatas(data.thirst, data.hunger, data.hp)
      }
      else if(data.info === false && InPetMenu === false){
        HavePet = false
        hide(".small-mode")
        hide(".pet-section")
      }
    }
    else if (data.action === "OpenBuyMenu") {
      InShop = true
      LastOpened = 0
      PlayerJob = data.playerjob
      ShopData = data.shopdata
      ShopLabel = data.shoplabel
      $(".buy_section h1").html(ShopLabel)
      show(".buy_section")
      show(".menu_btn")
      hide(".pet-section")
      CreateShop()
      $(".tasks_container").css("opacity", "0")
    }
    else if (data.action === "OpenManagementMenu") {
      InShop = true
      ManagementTable = data.table
      YourShop = data.shoptable
      $(".sell_shop_menu h1").html(YourShop.name)
      $(".sell_shop_menu h2").html((YourShop.price/2).toLocaleString()+MoneyForm)
      SortList()
      SwitchPage("main")
      show(".shop_management")
    }
    else if (data.action === "RefreshOrderMenu") {
      ManagementTable = data.table
      SwitchPage("orders")
    }
    else if (data.action === "OpenShopBuyMenu") {
      InShop = true
      BuyShopData = data.table
      $(".buy_shop h1").html(BuyShopData.name)
      $(".buy_shop h3").html(BuyShopData.price.toLocaleString()+MoneyForm)
      show(".buy_shop")
    }
    else if (data.action === "OpenPetMenu") {
      if (InPetMenu === false){
        $(".small-mode").css("display", "none")
        hide(".small-mode")
        show(".pet-section")
        setTimeout(function(){
          if (InPetMenu === false){
            show(".big-mode")
            setTimeout(function(){
              InPetMenu = true
            },400)
          }
        },800)
        $(".pet-section").css({
          "height": "550px",
          "width": "350px",
        })
        panel.style.left = BigPos.split(',')[0] + 'px'
        panel.style.top = BigPos.slice(BigPos.indexOf(',') + 1) + 'px'

        $(".pet-section .big-mode .pet_img_big").attr("src", "assets/"+data.img+".png")
        $(".pet-section .small-mode .pet_img_small").attr("src", "assets/"+data.img+".png")
        $(".pet-section .big-mode h1").html(data.name+'<button class="rename_btn" onclick="rename_pet()" onmousedown="Mousedown()" onmouseup="Mouseup()" onmouseout="Mouseup()"><i class="fa-solid fa-pen"></i></button>')

        PetShowDatas(data.thirst, data.hunger, data.hp)
        $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"nuifocus"}))
      }
    }
    else if (data.action === "RefreshPetMenu") {
      $(".pet-section .big-mode .pet_img_big").attr("src", "assets/"+data.img+".png")
      $(".pet-section .small-mode .pet_img_small").attr("src", "assets/"+data.img+".png")
      $(".pet-section .big-mode h1").html(data.name+'<button class="rename_btn" onclick="rename_pet()" onmousedown="Mousedown()" onmouseup="Mouseup()" onmouseout="Mouseup()"><i class="fa-solid fa-pen"></i></button>')
      PetShowDatas(data.thirst, data.hunger, data.hp)
    }
    else if (data.action === "OpenNameMenu") {
      show(".name-container")
    }
    else if (data.action === "StartTask") {
      $(".tasks_container").append(`
      <div class="inprogress ${data.petnum}">
        <img class="pet_img" src="assets/${data.petmodel}.png">
        <div class="name">${data.petname}</div>
        <hr>
        <div class="state" id="state">${data.state}</div>
      </div>
      `)
      setTimeout(function(){
        $(".tasks_container ."+data.petnum).css("opacity", "1")
      }, 10)
    }
    else if (data.action === "FinishTask") {
      $(".tasks_container ."+data.petnum).css("opacity", "0")
      setTimeout(function(){
        $(".tasks_container ."+data.petnum).remove()
      },400)
    }
    else if (data.action === "SmallMenuPos") {
      panel = panel
      hide(".big-mode")
      show(".pet-section")
      setTimeout(function(){
        $(".pet-section").css({
          "height": "60px",
          "width": "200px",
        })
        panel.style.left = SmallPos.split(',')[0] + 'px'
        panel.style.top = SmallPos.slice(SmallPos.indexOf(',') + 1) + 'px'
      },300)
      setTimeout(function(){
        show(".small-mode")
      },800)
      InSmallMenuPos = true
    }
    else if (data.action === "HideSmallMenu") {
      if (HideSmallMenu === false){
        HideSmallMenu = true
        hide(".pet-section")
        hide(".small-mode")
      }
      else{
        HideSmallMenu = false
        show(".pet-section")
        show(".small-mode")
      }
    }
    else if (data.action === "Close") {
      hide(".name-container")
      hide(".bg")
      hide(".buy_section")
      hide(".transfer_menu")
      hide(".shop_management")
      hide(".sure")
      hide(".pet_container")
      hide(".jobs_menu")
      hide(".buy_container")
      $(".tasks_container").css("opacity", "1")
      hide(".shop_container")
      hide(".buy_section h4")
      if (HavePet === true && HideSmallMenu === false){
        show(".pet-section")
      }
      InSmallMenuPos = false
      InShop = false
      $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"close"}))
      ClosePetMenu()
    }
})

document.onkeydown = function(data) {
  if (event.key == 'Escape') {
    Close()
    ClosePetMenu()
  }

  if (InPetChooser === true){
    if (event.key == 'ArrowLeft') {
      RotatePet(0)
    }
    else if(event.key == 'ArrowRight') {
      RotatePet(1)
    }
  }
}

function Close(){
  if (InShop === true || InSmallMenuPos === true){
    hide(".shop_management")
    hide(".name-container")
    hide('.dep_tran_menu#1')
    hide('.dep_tran_menu#2')
    hide('.sell_shop_menu')
    hide(".bg")
    hide(".buy_section")
    hide(".sure")
    hide(".pet_container")
    hide(".jobs_menu")
    hide(".transfer_menu")
    hide(".buy_shop")
    hide(".buy_container")
    $(".tasks_container").css("opacity", "1")
    hide(".shop_container")
    hide(".buy_section h4")
    if (HavePet === true && HideSmallMenu === false){
      show(".pet-section")
    }
    $(".tasks_container .test").css("opacity", "0")
    InSmallMenuPos = false
    InShop = false
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"close"}))
  }
}

function ClosePetMenu(){
  if (InPetMenu === true){
    hide(".big-mode")
    hide(".transfer_menu")
    hide(".name-container")
    hide(".sure")
    setTimeout(function(){
      $(".pet-section").css({
        "height": "60px",
        "width": "200px",
      })
      panel.style.left = SmallPos.split(',')[0] + 'px'
      panel.style.top = SmallPos.slice(SmallPos.indexOf(',') + 1) + 'px'
    },300)
    setTimeout(function(){
      if (HideSmallMenu === false){
        show(".small-mode")
      }
      else{
        hide(".pet-section")
      }
      setTimeout(function(){
        InPetMenu = false
      },500)
    },800)
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"close"}))
  }
}

function RotatePet(value){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"RotatePet", value}))
}

function UseButton(id) {
  let data = JSON.stringify({action:id})

  if(id === 'pets'){
    hide(".menu_btn")
    show(".pet_container")
    show(".buy_container")
    show(".buy_section h4")
    Buy_btn(0)
    InPetChooser = true
  }
  else if (id === "shop"){
    hide(".menu_btn")
    show(".shop_container")
  }
  else if (id === "backpetshop"){
    hide(".bg")
  }
  else if (id === "backmainmenu"){
    show(".menu_btn")
    hide(".shop_container")
    hide(".pet_container")
    hide(".buy_container")
    hide(".buy_section h4")
    hide(".jobs_menu")
    InPetChooser = false
  }
  else if (id === "backmini"){
    if (InPetMenu === true){
      hide(".big-mode")
      setTimeout(function(){
        $(".pet-section").css({
          "height": "60px",
          "width": "200px",
        })
        panel.style.left = SmallPos.split(',')[0] + 'px'
        panel.style.top = SmallPos.slice(SmallPos.indexOf(',') + 1) + 'px'
      },300)
      setTimeout(function(){
        if (HideSmallMenu === false){
          show(".small-mode")
        }
        else{
        hide(".pet-section")
        }
        InPetMenu = false
      },800)
    }
  }
  else if (id === "backname"){
    hide(".name-container")
  }
  else if (id === "backtransfer"){
    hide(".transfer_menu")
  }
  else if (id === "backmain"){
    hide('.dep_tran_menu#deposite')
    hide('.dep_tran_menu#withdraw')
    hide('.sell_shop_menu')
  }
  else if (id === "jobs"){
    show(".jobs_menu")
    CreateJobs()
  }

  $.post('https://'+GetParentResourceName()+'/UseButton', data)
}

function CreateShop(){
  $(".pet_elements_container").html("")
  for (let i = 0; i < Pets.length; i++) {
    if (ShopData.stock[Pets[i].model.toLowerCase()].amount > 0){
      $(".pet_elements_container").append(`
      <button class="pet_element" id="${i}" onclick="ChangePet(id)"> 
          <table>
              <tr>
                  <th class="image"><img class="elm_img" src="assets/${Pets[i].model}.png"></th>
                  <th class="name">${Pets[i].label}</th>
                  <th class="price"><a>Price</a> <br> ${ShopData.stock[Pets[i].model.toLowerCase()].price.toLocaleString()}<money>${MoneyForm}</money></th>
              </tr>
          </table>
      </button>
      `)
    }
  }

  $(".shop_elements_container").html("")
  for (let i = 0; i < Itemlist.length; i++) {
    if (ShopData.stock[Itemlist[i].item.toLowerCase()].amount > 0){
      $(".shop_elements_container").append(`
      <div class="shop_element">
      <img class="item" src="assets/${Itemlist[i].item}.png">
      <h11 id="item_${i}">${Itemlist[i].label}</h11>
      <h6>${ShopData.stock[Itemlist[i].item.toLowerCase()].price.toLocaleString()}<money>${MoneyForm}</money></h6>
      <div class="arrow1 left" id="${Itemlist[i].item}/left" onclick="shopbtn(id)"><i class="fa-solid fa-chevron-left"></i></div>
      <div class="num" id="${Itemlist[i].item}">0</div>
      <div class="arrow1 right" id="${Itemlist[i].item}/right" onclick="shopbtn(id)"><i class="fa-solid fa-chevron-right"></i></div>
      </div>`)
    }
  }
}

function PetShowDatas(thirst, hunger, hp){
  Thirst = thirst
  Hunger = hunger
  Hp = hp
  $(".pet_datas #drink h2").html(Thirst+"%")
  $(".pet_datas #food h2").html(Hunger+"%")
  $(".pet_datas #healt h2").html(Hp+"%")
  Thirst = 100 - (Thirst * 0.6 + 20)
  Hunger = 100 - (Hunger * 0.6 + 20)
  Hp = 100 - (Hp * 0.6 + 20)
  $(".pet_datas #drink").css("background-image", `linear-gradient(rgba(255, 255, 255, 0.447) ${Thirst}%, #147cea ${Thirst}%)`)
  $(".pet_datas #food").css("background-image", `linear-gradient(rgba(255, 255, 255, 0.447) ${Hunger}%, #eae314 ${Hunger}%)`)
  $(".pet_datas #healt").css("background-image", `linear-gradient(rgba(255, 255, 255, 0.447) ${Hp}%, #ea1414 ${Hp}%)`)
}

function BuyPetwithmoney(id){
  hide(".bg")
  let petid = +LastOpened + +1
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"buypet", petid, moneytype:id}))
}

function ChangePet(id){
  let HaveRang = false
  if (Pets[id].Jobs != false){
    for (let i = 0; i < Pets[id].Jobs.length; i++) {
      if (PlayerJob === Pets[id].Jobs[i]){
        HaveRang = true
        break
      }
    }
  }
  else{
    HaveRang = true
  }

  if (HaveRang === true){
    LastOpened = id
    let petid = +id + +1
    Buy_btn(id)
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"changepet", petid}))
  }
  else{
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"NoCopsJob"}))
  }
}

function Buy_btn(num){
  price = $(`.pet_elements_container #${num} table tr .price`).html()
  price = price.slice(price.indexOf('b') + 1)

  $(".buy_section .buy_container #first #price").html(price.slice(price.indexOf('>') + 1))
  $(".buy_section .buy_container #second #petname").html($(`.pet_elements_container #${num} table tr .name`).html())
}

function ChangePetType(){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"ChangeSkin"}))
}

function ChangePetCollar(){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"ChangeCollar"}))
}

function NameFunction() {
  var name = document.getElementById("name").value
  let data = JSON.stringify({action:name, value:NameOpened})
  document.getElementById("name").value = ""

  $.post('https://'+GetParentResourceName()+'/Name', data)
}

function shopbtn(id){
  let Direction = id.slice(id.indexOf('/') + 1)
  let ItemName = id.split('/')[0]
  if (Direction === "left" && document.getElementById(ItemName).innerHTML != 0){
    $('#'+ItemName).html(+document.getElementById(ItemName).innerHTML - +1)
  }
  else if (Direction === "right" && document.getElementById(ItemName).innerHTML < 9){
    $('#'+ItemName).html(+document.getElementById(ItemName).innerHTML + +1)
  }
  changemoney()
}

function changemoney(){
  let AllMoney = 0
  for (let i = 0; i < Itemlist.length; i++) {
    AllMoney += ShopData.stock[Itemlist[i].item.toLowerCase()].price * document.getElementById(Itemlist[i].item).innerHTML
  }
  $('.buy_section .shop_container h3').html(AllMoney.toLocaleString())
  $('.buy_section .shop_container h3').append('<money>'+MoneyForm+'</money>')
}

function BuyInShop(){
  BuyItems = []
  for (let i = 0; i < Itemlist.length; i++) {
    if (document.getElementById(Itemlist[i].item).innerHTML > 0){
      BuyItems.push([Itemlist[i].item, document.getElementById(Itemlist[i].item).innerHTML, ShopData.stock[Itemlist[i].item.toLowerCase()].price])
    }
  }

  if (BuyItems.length > 0){
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"BuyInShop", BuyItems}))
  }

  setTimeout(function(){
    for (let i = 0; i < Itemlist.length; i++) {
      $('#'+Itemlist[i].item).html(0)
    }
    changemoney()
  }, 200)
}

var mousePosition;
var offset = [0,0];
var isDown = false;

function Mousedown(){button_down = 1}
function Mouseup(){button_down = 0}

panel.onmousedown = function(e){
  if ((button_down) == 0) {
    panel.style.cursor = "move"
    panel.style.opacity = "0.6"
    panel.style.scale = "1.05"
    panel.style.transition = " 0s"
    panel.style.transition = "opacity 0.4s, scale 0.2s"

      isDown = true;
      offset = [
        panel.offsetLeft - e.clientX,
        panel.offsetTop - e.clientY
      ]
  }
}

document.addEventListener('mouseup', function() {
    isDown = false;
    panel.style.transition = "all 0.7s"
    panel.style.cursor = ""
    panel.style.scale = "1"
    panel.style.opacity = "1"
}, true);

document.addEventListener('mousemove', function(event) {
    event.preventDefault();
    if (isDown) {
        mousePosition = {

            x : event.clientX,
            y : event.clientY

        };
        panel.style.left = (mousePosition.x + offset[0]) + 'px'
        panel.style.top  = (mousePosition.y + offset[1]) + 'px'
        if (InSmallMenuPos === true){
          SmallPos = [mousePosition.x + offset[0], mousePosition.y + offset[1]]
          localStorage.setItem("SmallMenuPosition", SmallPos)
          SmallPos = localStorage.getItem("SmallMenuPosition")
        }
        else{
          BigPos = [mousePosition.x + offset[0], mousePosition.y + offset[1]]
          localStorage.setItem("BigMenuPosition", BigPos)
          BigPos = localStorage.getItem("BigMenuPosition")
        }
      
    }
}, true)

function delete_pet(){
  show(".sure")
}

function open_trans_menu(){
  show(".transfer_menu")
}

function transfer_pet(){
  let id = document.getElementById("tran_id").value
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"TransferPet", target:id}))
  hide(".transfer_menu")
}

function switch_pet(id){
  if (id === "right"){
    Type = "1"
  }else{
    Type = "-1"
  }
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"SwitchPet", Type}))
}

function returnsure(id){
  if (id === "yes"){
    hide(".sure")
    Close()
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"DeletePed"}))
  }else{
    hide(".sure")
  }
}

function show(element){
  $(element).css("display", "block")
  setTimeout(function(){
      $(element).css("opacity", "1")
  }, 10);
}

function hide(element){
  $(element).css("opacity", "0")
  setTimeout(function(){
    $(element).css("display", "none")
  }, 400)
}

function rename_pet(){
  NameOpened = 1
  show(".name-container")
}

function isNumber(evt) {
  evt = (evt) ? evt : window.event
  var charCode = (evt.which) ? evt.which : evt.keyCode
  if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false
  }
  return true
}

/*////////////////////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/
CurrentPage = "main"

function SwitchPage(id){
  document.getElementById("main").classList.remove("current")
  document.getElementById("stock").classList.remove("current")
  document.getElementById("orders").classList.remove("current")
  document.getElementById(id).classList.add("current")
  CurrentPage = id
  if (id == "main"){
    $(".content_container").html(`
    <div class="row row-cols-1 m-3" style="margin-top: 110px !important;">
    <div class="col">
        <div class="row">
            <div class="col d-flex flex-column align-items-center">
                <div class="big_container">
                    <div class="title">STOCK</div>
                    <div class="stock_num">200/400</div>
                    <div class="progress_bar_con">
                        <div class="progress_bar" id="stock_progressbar" style="width: 0%"></div>
                    </div>
                    <div class="subtitle">FILLING PROCESS</div>
                    <div class="employees">EMPLOYEES</div>
                    <div class="progress_bar_con">
                        <div class="progress_bar" id="filling_progressbar" style="width: 0%"></div>
                    </div>
                </div>
            </div>
            <div class="col d-flex flex-column align-items-center">
                <div class="big_container">
                    <div class="title">BALANCE</div>
                    <div class="balance">845 000$</div>
                    <div class="col d-flex flex-column align-items-center">
                      <button class="balance_long_btn" onclick="show('.dep_tran_menu#deposite')">DEPOSIT</button>
                      <button class="balance_long_btn" onclick="show('.dep_tran_menu#withdraw')">WITHDRAW</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col mt-3">
        <div class="row least_items_con">
            <div class="col d-flex flex-column align-items-center">
                <div class="small_container">
                    <div class="d-flex flex-column align-items-center">
                        <img class="pet_img" src="">
                    </div>
                    <div class="progress_bar_con">
                        <div class="progress_bar" id="stock_progressbar" style="width: 75%"></div>
                    </div>
                    <div class="count">5 ARE LEFT</div>
                </div>
            </div>
            <div class="col d-flex flex-column align-items-center">
                <div class="small_container"></div>
            </div>
            <div class="col d-flex flex-column align-items-center">
                <div class="small_container"></div>
            </div>
        </div>
    </div>
    </div>
    `)
    CreateMainPage()
  }
  else if(id == "stock"){
    $(".content_container").html(`
    <div class="d-flex flex-column align-items-center">
        <div class="stock_title" style="margin-top: 110px !important;">
            <div class="row">
                <div class="col-4">
                    <h1>Item</h1>
                </div>
                <div class="col">
                    <h1>Amount</h1>
                </div>
                <div class="col">
                    <h1>Order Price</h1>
                </div>
                <div class="col">
                    <h1>Price</h1>
                </div>
            </div>
        </div>

        <div class="fade_up"></div>
        <div class="stock_container">

        </div>
    </div>
    `)
    CreateStockPage()
  }
  else{
    $(".content_container").html(`
    <div class="row row-cols-2 m-3" style="margin-top: 110px !important;">
                <div class="col-7">
                    <div class="order_fade_up"></div>
                    <div class="order_fade_down"></div>
                    <div class="shop_items_con">

                    </div>
                </div>
                <div class="col-5">
                    <div class="small_controls">
                        <div class="row row-cols-2">
                            <div class="col d-flex flex-column align-items-center">
                                <button class="control_btn current" id="me" onclick="SwitchDeliveryMode(id)">Me</button>
                            </div>
                            <div class="col d-flex flex-column align-items-center">
                                <button class="control_btn" id="players" onclick="SwitchDeliveryMode(id)">Players</button>
                            </div>
                        </div>
                    </div>

                    <div class="description" id="ds">
                     
                    </div>

                    <div class="max_order" id="max_order">0/${MaxOrder}</div>
                    <div class="order_price">0$</div>
                    
                    <div class="bottom_btn_con">
                        <div class="row">
                            <div class="col pe-1">
                                <button class="reset_btn" onclick="CreateOrderPage(), CheckEveryOrders()"><i class="fa-solid fa-trash"></i></button>
                            </div>
                            <div class="col pe-1">
                                <button class="order_btn" id="order_btn" onclick="CreateOrder()" disabled>ORDER</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    `)
    CreateOrderPage()
  }
}

function SwitchDeliveryMode(id){
  document.getElementById("me").classList.remove("current")
  document.getElementById("players").classList.remove("current")
  document.getElementById(id).classList.add("current")
  ChoosedOrderType = id

  if (id == "players"){
    $(".description").html("")

    if (IsAnyOrder){
      $(".description").html(`
        <div class="title">SALARY</div>
        <input type="text" id="salary" placeholder="Amount" onkeypress="return isNumber(event)" oninput="CheckEveryOrders()">
        <div class="des">The salary which the employee will get.</div>
      `)
    }
    else{
      if (ManagementTable.orders.length > 0){
        for (var k in ManagementTable.orders) {
          let Items = ""
          let AllItems = 0
          for (var _k in ManagementTable.orders[k].items) {
            AllItems = +AllItems + +ManagementTable.orders[k].items[_k].amount
            if (Items != ""){
              Items = Items + ", " + ManagementTable.stock[ManagementTable.orders[k].items[_k].item].label
            }
            else{
              Items = Items + ManagementTable.stock[ManagementTable.orders[k].items[_k].item].label
            }
            
          }
          if (ManagementTable.orders[k].started){
            $(".description").append(`
            <div class="order_element" id="order_element_${k}">
                <div class="row">
                    <div class="col pe-0 me-0">
                      <div class="item">${AllItems}/${MaxOrder}</div>
                    </div>
                    <div class="col-3 px-0 mx-0">
                    </div>
                    <div class="col-4">
                        <button class="show_more" id="show_more_${k}" onclick="ShowMoreOfOrder('order_element_${k}', id)"><i class="fa-solid fa-caret-down"></i></button>
                        <button class="order_del_btn" id="${ManagementTable.orders[k].orderid}" onclick="DeleteOrder(id)" disabled><i class="fa-solid fa-trash"></i></button>
                    </div>
                </div>
            </div>
            `)
          }
          else{
            $(".description").append(`
            <div class="order_element" id="order_element_${k}">
                <div class="row">
                    <div class="col pe-0 me-0">
                      <div class="item">${AllItems}/${MaxOrder}</div>
                    </div>
                    <div class="col-3 px-0 mx-0">
                    </div>
                    <div class="col-4">
                        <button class="show_more" id="show_more_${k}" onclick="ShowMoreOfOrder('order_element_${k}', id)"><i class="fa-solid fa-caret-down"></i></button>
                        <button class="order_del_btn" id="${ManagementTable.orders[k].orderid}" onclick="DeleteOrder(id)"><i class="fa-solid fa-trash"></i></button>
                    </div>
                </div>
                <div class="items">${Items}</div>
            </div>
            `)
          }
        }
      }
      else{
        $(".description").html(`
        <div class="no_orders_text">NO ORDERS</div>
        `)
      }

    }
    
  }
  else{
    $(".description").html(`
      <div class="des">In this mode you will have to deliver your order to your shop.</div>
    `)
  }
  
    
}

function ShowMoreOfOrder(id, showid){
  let height = document.getElementById(id).clientHeight
  if (height < 180){
    $("#"+showid).css("transform", "rotate(180deg)")
    $("#"+id).css({
      "height": "180px",
      "overflow": "auto",
      "padding-bottom": "10px"
    })
  }
  else{
    $("#"+showid).css("transform", "rotate(0deg)")
    $("#"+id).css({
      "height": "50px",
      "overflow": "hidden",
      "padding-bottom": "0px"
    })
  }
}

function SortList(){
  AssistList = []
  for (var k in ManagementTable.stock) {
    AssistList.push(k)
  }

  for (let i = 0; i < AssistList.length; i++) {
    for(var j= i+1;j<AssistList.length;j++){
      let value1 = ManagementTable.stock[AssistList[i]].amount / ManagementTable.stock[AssistList[i]].max
      let value2 = ManagementTable.stock[AssistList[j]].amount / ManagementTable.stock[AssistList[j]].max
        if(value1 > value2){
          var swap = AssistList[i]
          AssistList[i] = AssistList[j]
          AssistList[j] = swap
        }
    }
  }
}

function CreateMainPage(){
  $(".balance").html(ManagementTable.balance.toLocaleString()+MoneyForm)
  AllStock = 0
  StockNum = 0
  MaxStock = 0

  for (var k in ManagementTable.stock) {
    AllStock = AllStock + ManagementTable.stock[k].amount
    MaxStock = MaxStock + ManagementTable.stock[k].max
    StockNum ++
  }

  $(".stock_num").html(AllStock+"/"+MaxStock)
  setTimeout(function(){
    $("#stock_progressbar").css("width", AllStock/MaxStock*100+"%")
  }, 400)

  $(".least_items_con").html("")
  for (let i = 0; i < 3; i++) {
    let progressbar = ManagementTable.stock[AssistList[i]].amount / ManagementTable.stock[AssistList[i]].max * 100
    $(".least_items_con").append(`
    <div class="col d-flex flex-column align-items-center">
        <div class="small_container" id="small_con_${i}">
            <div class="d-flex flex-column align-items-center">
                <img class="pet_img" src="assets/${AssistList[i]}.png">
            </div>
            <div class="progress_bar_con">
                <div class="progress_bar" id="stock_progressbar" style="width: ${progressbar}%"></div>
            </div>
            <div class="count">${ManagementTable.stock[AssistList[i]].amount} ARE LEFT</div>
        </div>
    </div>
    `)
    if (progressbar < 25){
      document.getElementById("small_con_"+i).classList.add("low")
    }
    else if (progressbar < 40){
      document.getElementById("small_con_"+i).classList.add("medium")
    }
    else{
      document.getElementById("small_con_"+i).classList.add("good")
    }
  }

  let Orders = [0,0]

  for (var k in ManagementTable.orders) {
    Orders[0] = Orders[0] + 1
    if (ManagementTable.orders[k].started){
      Orders[1] = Orders[1] + 1
    }
  }

  if (ManagementTable.orders.length > 0){
    $(".employees").html("EMPLOYESS")
    setTimeout(function(){
      if (CurrentPage == "main"){
        document.getElementById("filling_progressbar").style.width = Orders[1] / Orders[0] * 100 + "%"
      }
    }, 400)
  }
  else{
    $(".employees").html("NOT GOING")
    setTimeout(function(){
      if (CurrentPage == "main"){
        document.getElementById("filling_progressbar").style.width = "0%"
      }
    }, 400)
  }

}

function CreateStockPage(){
  $(".stock_container").html("")

  for (let i = 0; i < AssistList.length; i++) {
    if ((ManagementTable.stock[AssistList[i]].amount / ManagementTable.stock[AssistList[i]].max) < 0.20){
      $(".stock_container").append(`
      <div class="stock_element">
          <div class="row">
              <div class="col-4">
                  <h1>${ManagementTable.stock[AssistList[i]].label}</h1>
              </div>
              <div class="col">
                  <h1><span class="red_text">${ManagementTable.stock[AssistList[i]].amount}</span>/${ManagementTable.stock[AssistList[i]].max}</h1>
              </div>
              <div class="col">
                  <h2>${ManagementTable.stock[AssistList[i]].basicprice.toLocaleString()+MoneyForm}</h2>
              </div>
              <div class="col">
                  <div class="d-flex flex-column align-items-center my-2">
                      <input type="text" id="stock_price_in_${AssistList[i]}" placeholder="${ManagementTable.stock[AssistList[i]].price.toLocaleString()+MoneyForm}" onkeypress="return isNumber(event)" onBlur="SaveStockPrice(id, '${AssistList[i]}')">
                  </div>
              </div>
          </div>
      </div>
      `)
    }
    else{
      $(".stock_container").append(`
      <div class="stock_element">
          <div class="row">
              <div class="col-4">
                  <h1>${ManagementTable.stock[AssistList[i]].label}</h1>
              </div>
              <div class="col">
                  <h1>${ManagementTable.stock[AssistList[i]].amount}/${ManagementTable.stock[AssistList[i]].max}</h1>
              </div>
              <div class="col">
                  <h2>${ManagementTable.stock[AssistList[i]].basicprice.toLocaleString()+MoneyForm}</h2>
              </div>
              <div class="col">
                  <div class="d-flex flex-column align-items-center my-2">
                      <input type="text" id="stock_price_in_${AssistList[i]}" placeholder="${ManagementTable.stock[AssistList[i]].price.toLocaleString()+MoneyForm}" onkeypress="return isNumber(event)" onBlur="SaveStockPrice(id, '${AssistList[i]}')">
                  </div>
              </div>
          </div>
      </div>
      `)
    }
  }
}

function CreateOrderPage(){
  $(".shop_items_con").html("")

  SwitchDeliveryMode(ChoosedOrderType)

  for (let i = 0; i < AssistList.length; i++) {
    let name = ManagementTable.stock[AssistList[i]].label
    if (name.length > 7){
      name = name.substring(0, 7) + "..."
    }
    if ((ManagementTable.stock[AssistList[i]].amount / ManagementTable.stock[AssistList[i]].max) < 0.20){
      $(".shop_items_con").append(`
      <div class="item_element px-3" id="item_${AssistList[i]}">
          <div class="row">
              <div class="col pe-2">
                  <div class="details">
                      <img class="pet_img" src="assets/${AssistList[i]}.png">
                      <div class="row ms-5 pt-1 px-2" style="width: 315px">
                          <div class="col-5">
                              <div class="name">${name}</div>
                          </div>
                          <div class="col-3 px-0">
                              <div class="count red_text">${ManagementTable.stock[AssistList[i]].amount}</div>
                          </div>
                          <div class="col-4 px-0">
                              <div class="price">${ManagementTable.stock[AssistList[i]].basicprice.toLocaleString()+MoneyForm}</div>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="col ps-2">
                  <input type="text" id="order_num_${AssistList[i]}" placeholder="-" onkeypress="return isNumber(event)" oninput="CheckValidOrder(id, '${AssistList[i]}')">
              </div>
          </div>
      </div>
    `)
    }
    else{
      $(".shop_items_con").append(`
      <div class="item_element px-3" id="item_${AssistList[i]}">
          <div class="row">
              <div class="col pe-2">
                  <div class="details">
                      <img class="pet_img" src="assets/${AssistList[i]}.png">
                      <div class="row ms-5 pt-1 px-2" style="width: 315px">
                          <div class="col-5">
                              <div class="name">${name}</div>
                          </div>
                          <div class="col-3 px-0">
                              <div class="count">${ManagementTable.stock[AssistList[i]].amount}</div>
                          </div>
                          <div class="col-4 px-0">
                              <div class="price">${ManagementTable.stock[AssistList[i]].basicprice.toLocaleString()+MoneyForm}</div>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="col ps-2">
                  <input type="text" id="order_num_${AssistList[i]}" placeholder="-" onkeypress="return isNumber(event)" oninput="CheckValidOrder(id, '${AssistList[i]}')">
              </div>
          </div>
      </div>
    `)
    }
    if (ManagementTable.stock[AssistList[i]].basicprice.toString().length > 4){
      $("#item_"+AssistList[i]+" .price").css("font-size", "19px")
      $("#item_"+AssistList[i]+" .price").css("margin-top", "12px")
    }
    else{
      $("#item_"+AssistList[i]+" .price").css("font-size", "30px")
      $("#item_"+AssistList[i]+" .price").css("margin-top", "5px")
    }
  }
}

function SaveStockPrice(id, num){
  if (document.getElementById(id).value > 0){
    ManagementTable.stock[num].price = Number(document.getElementById(id).value)
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"EditStockPrice", table:ManagementTable}))
    document.getElementById(id).style.animation = "savetext 0.7s ease"
    setTimeout(function(){
      if (CurrentPage == "stock"){
        document.getElementById(id).placeholder = document.getElementById(id).value.toLocaleString() + MoneyForm
        document.getElementById(id).value = ""
        document.getElementById(id).style.animation = "none"
      }
    }, 700)
  }
}

function DepositMoney(){
  let amount = document.getElementById("deposit_amount").value
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"Deposit", amount}))
  document.getElementById("deposit_amount").value = null
  hide('.dep_tran_menu#1')
}

function WithdrawMoney(){
  let amount = document.getElementById("withdraw_amount").value
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"Withdraw", amount}))
  document.getElementById("withdraw_amount").value = null
  hide('.dep_tran_menu#2')
}

function CheckValidOrder(id, k){
  let InputValue = document.getElementById(id).value
  let OrderedItems = 0

  for (var _k in ManagementTable.orders) {
    for (var j in ManagementTable.orders[_k].items) {
      if (ManagementTable.orders[_k].items[j].item == k){
        OrderedItems = OrderedItems + +ManagementTable.orders[_k].items[j].amount 
      }
    }
  }

  if (InputValue > ManagementTable.stock[k].max - (ManagementTable.stock[k].amount + OrderedItems)){
    document.getElementById(id).value = ManagementTable.stock[k].max - (ManagementTable.stock[k].amount + OrderedItems)
    document.getElementById(id).style.animation = "wrongtext 0.7s ease"
    setTimeout(function(){
      document.getElementById(id).style.animation = "none"
    }, 700)
  }
  else if (InputValue < 0){
    document.getElementById(id).value = 0
  }

  CheckAllOrders(id)

}

function CheckAllOrders(in_id){
  CheckEveryOrders()
  if (AllOrders > MaxOrder){
    let GoodNumber = +AllOrders - +document.getElementById(in_id).value
    document.getElementById(in_id).value = MaxOrder - GoodNumber
    AllOrders = 0
    for (var k in ManagementTable.stock) {
      AllOrders = AllOrders + +document.getElementById("order_num_"+k).value
    }
    CheckEveryOrders()
    document.getElementById("max_order").style.animation = "wrongtext 0.7s ease"
    setTimeout(function(){
      document.getElementById("max_order").style.animation = "none"
    }, 700)
  }
}

function CheckEveryOrders(){
  AllOrders = 0
  AllPrice = 0
  for (var k in ManagementTable.stock) {
    AllOrders = AllOrders + +document.getElementById("order_num_"+k).value
    AllPrice = AllPrice + +ManagementTable.stock[k].basicprice * +document.getElementById("order_num_"+k).value
  }

  if (document.getElementById("salary") != undefined){
    AllPrice = +AllPrice + +document.getElementById("salary").value
  }

  $(".order_price").html(AllPrice.toLocaleString()+MoneyForm)

  $(".max_order").html(AllOrders+"/"+MaxOrder)

  if (AllOrders > 0){
    if (IsAnyOrder == false){
      IsAnyOrder = true
      SwitchDeliveryMode(ChoosedOrderType)
    }
    document.getElementById("order_btn").disabled = false
  }
  else{
    if (IsAnyOrder){
      IsAnyOrder = false
      SwitchDeliveryMode(ChoosedOrderType)
    }
    document.getElementById("order_btn").disabled = true
  }
}

function CreateOrder(){
  let table = []
  let price = 0
  for (var k in ManagementTable.stock) {
    if (document.getElementById("order_num_"+k).value > 0){
      price = price + +ManagementTable.stock[k].basicprice * +document.getElementById("order_num_"+k).value
      table.push([item =  k, amount = document.getElementById("order_num_"+k).value])
    }
  }
  IsAnyOrder = false

  if (ChoosedOrderType == "me"){
    let pay = 0
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"CreateOrder", type:ChoosedOrderType, table, price, pay}))
  }
  else{
    let pay = 0
    if (document.getElementById("salary").value) {
      pay = document.getElementById("salary").value
    }
    $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"CreateOrder", type:ChoosedOrderType, table, price, pay}))
  }
}

function DeleteOrder(id){
  CheckEveryOrders()
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"RemoveOrder", id}))
}

function CreateJobs(){
  $(".jobs_container").html("")
  for (var k in ShopData.orders) {
    if (ShopData.orders[k].started == false){
      $(".jobs_container").append(`
      <div class="job_element">
          <div class="row">
              <div class="col">
                  <div class="value">${ShopData.orders[k].pay+MoneyForm}</div>
              </div>
              <div class="col">
                  <button class="accept px-2" onclick="AcceptOrder('${ShopData.orders[k].orderid}')">Accept</button>
              </div>
          </div>
      </div>
      `)
    }
  }
}

function AcceptOrder(id){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"StartOrder", id}))
}

function BuyShop(){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"BuyShop", id:BuyShopData.id}))
  Close()
}

function SellShop(){
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"SellShop"}))
  Close()
}