


// $(function(){
// $("document").ready(function(){
$("document").ready(function() {
    $(".theTarget").skippr({
 // スライドショーの変化（"fade" or "slide"）
  transition : 'fade',
  // 変化にかかる時間（ミリ秒）
  speed : 1000,
  // easingの種類
  easing : 'easeOutQuart',
  // ナビゲーションの形（"block" or "bubble"）
  navType : 'block',
  // 子要素の種類（"div" or "img"）
  childrenElementType : 'div',
  // ナビゲーション矢印の表示（trueで表示）
  arrows : true,
  // スライドショーの自動再生（falseで自動再生なし）
  autoPlay : true,
  // 自動再生時のスライド切替間隔（ミリ秒）
  autoPlayDuration : 2000,
  // キーボードの矢印キーによるスライド送りの設定（trueで有効）
  keyboardOnAlways : true,
  // 1枚目のスライド表示時に戻る矢印を表示するかどうか [false]:矢印を隠さない [true]:矢印を隠す
  hidePrevious : false});
});
// オプションを指定してSkipprの実行


// ここから下を動かすと、退会時にもスライドを入れようとするが故にログアウトできなくなる。

// // 画面が読み込まれた時、is-slideを外し、アニメーションさせる
// $(window).on('load', function(){
//  $('body').removeClass('is-slide');
// });

// $(function() {
//  // ハッシュリンク(#)と別ウィンドウでページを開く場合は実行しない

//  $('a:not([href^="#"]):not([target])').on('click', function(e){
//    e.preventDefault();         // ページ遷移を一旦キャンセル
//    url = $(this).attr('href'); // 遷移先のURLを取得

//    if (url !== '') {
//      $('body').addClass('is-slide-in'); // 画面遷移前のアニメーション is-slide-in

//      setTimeout(function () {
//        window.location = url;  // 0.7秒後に取得したURLに遷移
//      }, 50);
//    }
//    return false;
//  });

// });