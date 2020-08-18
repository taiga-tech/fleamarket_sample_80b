$(function() {
  let methods = {
    email: function(value, element) {
      return this.optional(element) || /^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/.test(value);
    },
    password: function (value, element) {
      return this.optional(element) || /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}$/i.test(value);
    },

  }

  $.each(methods, function(key) {
    $.validator.addMethod(key, this);
  });

  $("#new_user").validate({
    rules: {
      "user[name]": {
        required: true
      },
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        password: true,
      },
      "user[password_confirmation]": {
        required: true,
        password: true
      },
    },
    messages: {
      "user[name]": {
        required: "ユーザーネームを入力してください"
      },
      "user[email]": {
        required: "メールアドレスを入力してください",
      },
      "user[password]": {
        required: "パスワードを入力してください",
        password: "英字と数字を含むパスワードを入力してください",
      },
      "user[password_confirmation]": {
        required: "確認用パスワードを入力してください",
        password: "パスワードが一致しません"
      },
    },
    errorPlacement: function(error, element) {
      if(element.attr("name") == "") {
        error.insertAfter(".text-input");
      } else {
        error.insertAfter(element);
      }
    },
    errorClass: "invalid",
    errorElement: "p",
    valudClass: "valid",
  });
  $("#user_name", "#user_email", "#user_password").blur(function() {
    $(this).valid();
  })

  $("#items-form").validate({
    rules: {
      "item[images_attributes]": {
        required: true
      },
      "item[title]": {
        required: true,
      },
      "item[text]": {
        required: true,
      },
      "item[category_id]": {
        required: true,
      },
      "item[condition]": {
        required: true,
      },
      "item[leadtime]": {
        required: true
      },
      "item[delivery_id]": {
        required: true,
      },
      "item[price]": {
        required: true,
      },
    },
    errorClass: "invalid",
    errorElement: "p",
    valudClass: "valid",
  });
});
