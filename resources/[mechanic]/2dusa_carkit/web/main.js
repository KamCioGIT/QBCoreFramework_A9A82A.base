let sound = document.querySelector("#wrenchS");
let tl = gsap.timeline({ defaults: { ease: "power1.out" } });

// Lastik Sökme

let vida = document.querySelectorAll(".vida-1");
let tyre = document.getElementById("tyre-1");
let vidacount = 0;

vida.forEach((vida) => {
  vida.addEventListener("click", () => {
    vidacount++;
    sound.play();
    gsap.to(vida, {
      pointerEvents: "none",
      rotate: 360,
      scale: 1.3,
      duration: 1,
    });
    gsap.to(vida, { opacity: 0, duration: 0.5, delay: 1 });
    if (vidacount === 6) {
      gsap.to(tyre, { cursor: "pointer", pointerEvents: "all" });
    }
  });
});

tyre.addEventListener("click", () => {
  gsap.to(tyre, { y: 600, duration: 1 });
  gsap.to(".tyre-cont", { opacity: 0, delay: 2 });
  gsap.to(".tyre-cont", { display: "none" });
  post("handleStatus", { status: "placetyre" });
});

// Lastik Takma

let vida2 = document.querySelectorAll(".vida-2");

gsap.set("#tyre-2", { y: 600 });

gsap.set(vida2, { rotate: 360, scale: 1.3, opacity: 0, pointerEvents: "none" });

// Mert Burayı Ui açtığın kodun olduğu yere koy
// Ui Açtırırken display: block değil display: flex yap
document.addEventListener("DOMContentLoaded", function () {
  window.addEventListener("message", function (event) {
    var item = event.data;
    switch (item.action) {
      case "tyre":
        vidacount = 0;
        gsap.to(".tyre-cont", { opacity: 1, delay: 2 });
        gsap.to(".tyre-cont", { display: "flex" });
        gsap.to("#tyre-2", { y: 0, duration: 1, delay: 1.5 });
        gsap.to(tyre, { cursor: "none", pointerEvents: "none" });
        gsap.to(tyre, { y: 0, duration: 1 });
        gsap.set(vida2, { pointerEvents: "all", delay: 2.5 });
        gsap.to(vida, { opacity: 1, duration: 0.5, delay: 1 });
        vida.forEach((vida) => {
            gsap.to(vida, { pointerEvents: 'all', rotate: 0, delay: 1 });
        });
        break;
      case "tyre2":
        vidacount2 = 0;
        gsap.to(".new-tyre-cont", { opacity: 1, delay: 2 });
        gsap.to(".new-tyre-cont", { display: "flex" });
        gsap.to("#tyre-2", { y: 0, duration: 1, delay: 1.5 });
        gsap.set(vida2, { opacity: 0 });
        vida2.forEach((vida2) => {
            gsap.to(vida2, { pointerEvents: 'all', rotate: 360, delay: 1 });
        });
        break;
      case "clean":
        $(".clean-cont").css("display", "flex");
        gsap.to(".clean-cont", { opacity: 1 });
        StartErase();
        break;
    }
  });
});
// --------------------------------------------

let vidacount2 = 0;

vida2.forEach((vida2) => {
  vida2.addEventListener("click", () => {
    vidacount2++;
    sound.play();
    gsap.to(vida2, { pointerEvents: "none", opacity: 1, duration: 0.3 });
    gsap.to(vida2, { rotate: 0, scale: 1, duration: 1, delay: 0.3 });
    if (vidacount2 === 6) {
        gsap.to(tyre, { y: 600, duration: 1 });
        gsap.to(".new-tyre-cont", { opacity: 0, delay: 2 });
        gsap.to(".new-tyre-cont", { display: 'none' });
        post("handleStatus", { status: "tyredone" });
        // await, post
        // post('handleStatus', { status: 'tyredone' })
    }
  });
});

// Cam Silme
let cursor = document.querySelector(".cursor-bez");

document.addEventListener("mousemove", function (e) {
  var xx = e.clientX - 30;
  var yy = e.clientY - 30;
  cursor.style.left = xx + "px";
  cursor.style.top = yy + "px";
});

function StartErase() {
  $(".clear-dirt").html(
    '<img id="dirty-image" src="' +
      "assets/img/dirt.png" +
      '" height="100%" width="100%">'
  );
  setTimeout(() => {
    $("#dirty-image").eraser({
      size: 150,
      completeRatio: 0.85,
      completeFunction: function () {
        tl.to(".clean-cont", { opacity: 0 }).to(".clean-cont", {
          display: "none",
        });
        post("handleStatus", { status: "cleandone" });
      },
    });
  }, 2000);
}

function post(event, data) {
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "https://dusa_carkit/" + event);
  xhr.setRequestHeader("Content-Type", "application/json");
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
    }
  };
  xhr.send(JSON.stringify({ data }));
}
