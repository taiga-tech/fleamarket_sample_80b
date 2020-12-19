$(function() {
  $(".signup").click(function() {
    $('#Signup_modal').fadeIn(200);
  });

  $(".login").click(function() {
    $("#Login_modal").fadeIn(200);
  });

  $(".Link__close").click(function() {
    $("#Signup_modal, #Login_modal").fadeOut(200);
  });
});
