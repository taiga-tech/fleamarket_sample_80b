$(function(){
  function buildHTML(comment){
    var html = `<div class="Message">
    <h1>${comment.text}</h1>
    <div class="MessageInfo">
    <div class="MessageInfo__userName">
    ${comment.user_name}
    </div>
    </div>  
    </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log
      var html = buildHTML(data);
      $('.MessageBox').append(html);
      $('.form-area').val('');
      $('.submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});
