$(function() {
  let methods = {
    email: function (value, element) {
      return this.optional(element) || /^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/.test(value);
    },
    password: function (value, element) {
      return this.optional(element) || /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}$/i.test(value);
    },
    zipcode: function (value, element) {
      return this.optional(element) || /^\d{3}-?\d{4}$/.test(value);
    },
    price: function (value, element) {
      return this.optional(element) || 	/^[3-9][0-9]{2}|[1-9][0-9]{3,6}$/.test(value);
    },
    number: function (value, element) {
      return this.optional(element) || /^\d+$/.test(value);
    },
    cvc: function (value, element) {
      return this.optional(element) || /^\d{3,4}$/.test(value);
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
        equalTo: 'input[name="user[password]"]'
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
        equalTo: "パスワードが一致しません"
      },
    },
    errorClass: "devise-invalid",
    errorElement: "p",
    valudClass: "valid",
  });
  $("#user_name", "#user_email", "#user_password").blur(function() {
    $(this).valid();
  });

  $("#new_address").validate ({
    rules: {
      "address[zipcode]": {
        required: true,
        zipcode: true,
      },
      "address[area]": {
        required: true,
      },
      "address[city]": {
        required: true,
      },
      "address[street]": {
        required: true,
      },
    },
    messages: {
      "address[zipcode]": {
        zipcode: "フォーマットが違います"
      }
    },
    errorClass: "devise-invalid",
    errorElement: "p",
    valudClass: "valid",
  });
  $("#address_zipcode", "#address_area", "#address_city", "#address_street").blur(function() {
    $(this).valid();
  });

  $("#items-form").validate ({
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
      "item[shippingcharges]": {
        required: true,
      },
      "item[leadtime]": {
        required: true,
      },
      "item[delivery_id]": {
        required: true,
      },
      "item[price]": {
        required: true,
        price: true,
      },
    },
    messages: {
      "item[price]": {
        price: "¥300以上で出品してください"
      }
    },
    errorClass: "invalid",
    errorElement: "p",
    valudClass: "valid",

  });
  $("#item_title",
    "#item_text",
    "#parent_category",
    "#child_category",
    "#grandchild_category",
    "#item_condition",
    "#item_leadtime",
    "#item_delivery_id",
    "#item_price"
  ).blur(function() {
    $(this).valid();
  });

  $("#charge-form").validate ({
    rules: {
      "number": {
        required: true,
        number: true
      },
      "exp_month": {
        required: true,
      },
      "exp_year": {
        required: true,
      },
      "cvc": {
        required: true,
        cvc: true,
      },
    },
    messages: {
      "number": {
        number: "半角数字で入力してください"
      },
      "cvc": {
        cvc: "3~4桁の数字を入力してください"
      },
    },
    errorClass: "invalid",
    errorElement: "p",
    valudClass: "valid",
    errorPlacement: function(error, element){
      error.insertAfter(element)
      element.css("border", "1.5px solid red");
    }
  });
  $("#card_number", "#exp_month", "#exp_year", "#cvc").blur(function() {
    $(this).valid();
  });

  $("#edit_item_1").validate ({
    rules: {
      "item[reservation_email]": {
        required: true,
        email: true,
      },
    },
    errorClass: "invalid",
    errorElement: "div",
    valudClass: "valid",
  });

  $("#new_comment").validate ({
    rules: {
      "comment[text]": {
        required: true,
      },
    },
    errorClass: "invalid",
    errorElement: "p",
    valudClass: "valid",
    errorPlacement: function(error, element){
      error.insertAfter(element.next(".submit"));
      element.css("border", "1.5px solid red")
    }
  });
});
