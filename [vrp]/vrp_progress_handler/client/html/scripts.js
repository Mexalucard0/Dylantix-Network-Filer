$(document).ready(function () {
  $(".container").hide();
  window.addEventListener('message', function (event) {
    var item = event.data;
    if (item.show == true) {
      open(item);
    }
    if (item.title) {
      document.getElementById("title").innerHTML = item.title;
    }
  });
});

function open(item) {
  $(".container").fadeIn();
  move(item);
}
function close(item) {
  $(".container").fadeOut();
  $.post('http://vrp_progress_handler/close', JSON.stringify({
    type: item.type,
    event: item.event,
    args: item.args
  }));
}
function move(item) {
  var elem = document.getElementById("myBar");
  var width = 0;
  var id = setInterval(frame, item.time/100);
  function frame() {
    if (width >= 100) {
      clearInterval(id);
      close(item);
    } else {
      width++;
      elem.style.width = width + '%';
    }
  }
}