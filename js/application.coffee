---
---

$(document).ready ->

  $("#fullpage").fullpage({
      verticalCentered: true,
      sectionsColor : ['#00BA56', '#0670A9', '#8AB49D', '#8AB49D']
    })

  $("#employer").change ->
    $.fn.fullpage.moveTo(2, 0)

  $("#mode-submit").click ->
    $.fn.fullpage.moveTo(3, 0)

  $("#modeshift").validate({
    onkeyup: true
  })