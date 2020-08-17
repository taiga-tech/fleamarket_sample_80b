$(function(){
  function buildHTML(comment){
    var html = `<table border="1" flame="box" rules="none" width="50%">
    <tbody><tr>
    <th>${comment.user_name}</th>
    <td>
      <td__text>
    ${comment.text}
      </td__text>
    </td>
    </tr>
    </tbody>
    </table>`
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
    .done(function(data){ 
      console.log
      var html = buildHTML(data);
      $('.card-comment').append(html);
      $('.form-area').val('');
      $('.submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});
