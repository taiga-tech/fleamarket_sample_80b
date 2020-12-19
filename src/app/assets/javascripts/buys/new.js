$(function() {
  var scrollPos;//topからのスクロール位置
  $('.btn').click(function() {
    scrollPos = $(window).scrollTop();//topからのスクロール位置を格納
    $('.content').fadeIn();//モーダルをフェードイン
    $('body').addClass('fixed').css({ top: -scrollPos });//背景固定
    return false;//<a>を無効化
  });
  $('.modal__close').click(function() {
    $('.content').fadeOut();//モーダルをフェードアウト
    $('body').removeClass('fixed').css({ top: 0 });//背景固定を解除
    $(window).scrollTop(scrollPos);//元の位置までスクロール
    return false;//<a>を無効化
  });

  $('.credCash').click(function() {
    $('.btn').text('クレジットカード');
  });
  $('.convCash').click(function() {
    $('.btn').text('コンビニ払い');
  });
  $('.cashCash').click(function() {
    $('.btn').text('代引き');
  });
  $('.atmCash').click(function() {
    $('.btn').text('ATM払い');
  });

  $('.credCash2').click(function() {
    $('.btn').text('クレジットカード');
  });

});



