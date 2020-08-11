$(function() {
  Payjp.setPublicKey('pk_test_31d4180a73af244259d7daf0');
  $("#charge_form").on('click', function(e) {
    // 「追加する」のクリックイベントが行われた時に動作を一時停止
    e.preventDefault();
    var year = $("#exp_year").val()
    var month = $("#exp_month").val()
    exp_year = String(year);
    exp_month = String(month);
    // カード登録に入力された情報をハッシュで格納
    let card = {
      number: $("#number").val(),
      cvc: $("#cvc").val(),
      exp_month: exp_month,
      exp_year: exp_year
    };

    // PAY.JPのサーバーと通信し、カード情報を送信することで認証を行い、カードトークンをresponse.idで受け取る。
    Payjp.createToken(card, function(status, response){
      // サーバーとのやり取りが200=正常に行えた場合(?)
      if (status === 200) {
        $("#all-form").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        );
        // all-formはform_withのidであり、createアクションにparamsを送信する
        $('#all-form').submit();
      } else {
        alert("カード情報が正しくありません。");
      }
    });
  });
});