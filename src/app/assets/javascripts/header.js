$(function() {

  // ライブラリー「jQuery ui」
  jQuery( function() {
    jQuery( "#pareUl" ).menu();
  });

  // 「カテゴリー」色変更
    //マウスオーバーしたときの色を指定
  $(".cateBtn").on("mouseover",function(){
    $(".cateBtn").css({
        color: "#FF8C00"
    });
  });

    //マウスアウトしたときに元の色に戻る
  $(".cateBtn").on("mouseout",function(){
    $(".cateBtn").css({
        color: ""
    });
  });

  // 一覧色変更
  $(".parent, .child, .grandchild").hover(function() {

    // カーソルが当たった時の処理
    $(this).css("color", "#FF8C00");

  }, function() {

    // カーソルが離れた時の処理
    $(this).css("color", "");

  });


  // 親カテゴリー処理
  // $('.cateBtn').click(function() {

  //   // カテゴリー表示
  //   $(this).next('.pareUl').slideDown('fast');
  // });



  // マウスカーソルがカテゴリー上/カテゴリー外
  // $('.cateBtn, .pareUl').hover(function() {
  //   // over_flg = true;
  //   $(".cateBtn").next(".pareUl").slideDown("fast");
  // }, function() {
  //   // over_flg = false;
  //   $("body").click(function() {
  //     $(".cateBtn").next(".pareUl").slideUp("fast");
  //   });
  // });

  $(".cateBtn, .pareUl").mouseover(function() {
    $(this).next(".pareUl").slideDown("fast");
  })
  $(".pareUl").mouseleave(function() {
    $(".cateBtn").next(".pareUl").slideUp("fast");
  })



  // // カテゴリー領域外をクリックしたらカテゴリーを閉じる
  // $('body').click(function() {
  //   if (over_flg == false) {
  //     // $('.cateBtn').removeClass('selected');
  //     $('.pareUl').slideUp('fast');
  //   }
  // });

});
