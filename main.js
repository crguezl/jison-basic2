$(document).ready(function () {
  $("button").click(function () {
    try {
      var result = basic2_lex.parse($("input").val())
      $("#output").html(result);
    } catch (e) {
      $("#output").html(String(e));
    }
  });
});
