---
---


submitToGoogle = ->
  url  = "https://script.google.com/macros/s/AKfycbyX1bKsGXzeUkNO-1Ma2WlqtmBT2WM4-4XpqG0RuMKhSN03408/exec"
  form = $("#modeshift").serialize()

  $.ajax({
    type: "POST",
    url: url,
    data: form,
    success: (data, status) ->
      console.log(data)
      console.log(status)
      $.fn.fullpage.moveTo(5, 0)
  })

window.submitToGoogle = submitToGoogle

$(document).ready ->

  $("#fullpage").fullpage({
      verticalCentered: true,
      sectionsColor : ['#89A639', '#8AB269', '#8BBF98', '#8CCBC8', '#8DD7F7'],
      css3: true,
      loopHorizontal: false
    })

  $("#destination").change ->
    if (this.value == "other")
      $("#destination-address").slideDown()
    else
      if ($("#destination-address").is(":visible"))
        $("#destination-address").slideUp ->
          # TODO: Clear alternate address fields
          $.fn.fullpage.moveTo(2, 0)
      else
        $.fn.fullpage.moveTo(2, 0)

  $("#destination-address-submit").click ->
    $.fn.fullpage.moveTo(2, 0)

  $(".yes-no label").click ->
    if ($.inArray("friday", this.classList) == 1)
      $.fn.fullpage.moveTo(3, 0)
    else
      $.fn.fullpage.moveSlideRight()

  $("#mode-submit").click ->
    $.fn.fullpage.moveTo(4, 0)

  $(".mode-radio").change ->
    submitToGoogle()

  $("[name=first_name]").keyup ->
    $(".first-name").text(this.value)