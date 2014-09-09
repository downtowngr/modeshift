---
---

window.navigator.standalone = true

submitToGoogle = ->
  url  = "https://script.google.com/macros/s/AKfycbyX1bKsGXzeUkNO-1Ma2WlqtmBT2WM4-4XpqG0RuMKhSN03408/exec"

  form = $("#modeshift").serialize()
  $.cookie("modeshift", form)

  $.ajax({
    type: "POST",
    url: url,
    data: form,
    success: (data, status) ->
      $.fn.fullpage.moveTo(6, 0)
  })

window.submitToGoogle = submitToGoogle

$(document).ready ->
  $("#fullpage").fullpage({
      verticalCentered: true,
      sectionsColor : ['#89A639', '#8AB269', '#8BBF98', '#8CCBC8', '#8DD7F7', '#8DD7F7'],
      loopHorizontal: false
    })

  if savedForm = $.cookie("modeshift")
    $("#modeshift").deserialize(savedForm)
    $(".first-name").text($("[name=first_name]").val())
    $("input:radio:checked.mode-radio").removeAttr("checked")
    $.fn.fullpage.moveTo(4, 0)

  $("#destination").change ->
    if (this.value == "other")
      $("#destination-address").slideDown()
    else
      if ($("#destination-address").is(":visible"))
        $("#destination-address").slideUp ->
          $("[name=dest_name]").val("")
          $("[name=dest_address]").val("")
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
    $.fn.fullpage.moveTo(5, 0)
    submitToGoogle()

  $("[name=first_name]").keyup ->
    $(".first-name").text(this.value)

  $("#reset-form").click ->
    $.removeCookie("modeshift")
    $("#modeshift").get(0).reset()
    $.fn.fullpage.moveTo(1, 0)
    $(".first-name").val("")