---
---

$(document).ready ->

  $("#fullpage").fullpage({
      verticalCentered: true,
      sectionsColor : ['#89A639', '#8AB269', '#8BBF98', '#8CCBC8', '#8DD7F7']
    })

  $("#employer").change ->
    $.fn.fullpage.moveTo(2, 0)

  $("#destination-address-submit").click ->
    $.fn.fullpage.moveTo(2, 0)

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

  $("#mode-submit").click ->
    $.fn.fullpage.moveTo(3, 0)

  $("[name=first-name]").keyup ->
    $(".first-name").text(this.value)