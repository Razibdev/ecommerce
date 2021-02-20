/*price range*/

 $('#sl2').slider();

	var RGBChange = function() {
	  $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	};	
		
/*scroll to top*/

$(document).ready(function(){
	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 300, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 300, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
	});
});

// jQuery.validator.setDefaults({
//     debug: true,
//     success: "valid"
// });

$(function () {

    $.validator.addMethod("alphabetsnspace", function(value, element) {
        return this.optional(element) || /^[a-zA-Z ]*$/.test(value);
    });

  $('#registerForm').validate({

      rules: {
          name:{
              required:true,
              minlength:2,
              alphabetsnspace: true,
          },
          password:{
              required:true,
              minlength: 8
          },
          email:{
              required:true,
              email:true,
              remote: "/check-email"

          }
      },
      messages:{
          "name":{
            required:"Please enter your name",
              minlength: "Your Name must be atleast 2 characters long",
            alphabetsnspace: "Your Name must contain letters only",

          },
          "password":{
              required:"Please provide your password",
              minlength: "You must atleast 8 character need",

          },
          "email":{
              required:"Please Enter your email",
              email:"Please enter valid Email",
              remote: "Email already exists"
          }
      },
      submitHandler: function(form) {
          form.submit();
      }
  });

    $('#accountForm').validate({

        rules: {
            name:{
                required:true,
                minlength:2,
                alphabetsnspace: true,
            },
            address:{
                required:true,
                minlength: 10
            },
            city:{
                required:true,
                minlength: 3
            },
            state:{
                required:true,
                minlength: 3
            },
            pincode:{
                required:true,
                minlength: 4
            },
            mobile:{
                required:true,
                minlength: 11
            }
        },
        messages:{
            "name":{
                required:"Please enter your name",
                minlength: "Your Name must be atleast 2 characters long",
                alphabetsnspace: "Your Name must contain letters only",

            },
            "address":{
                required:"Please provide your address",

                minlength: "You address must atleast 6 character need",

            },
            "city":{
                required:"Please provide your city",
                minlength: "You city must atleast 3 character need",

            },
            "state":{
                required:"Please provide your state",
                minlength: "You state must atleast 3 character need",

            },
            "pincode":{
                required:"Please provide your pincode",
                minlength: "You pincode must atleast 4 character need",

            },
            "mobile":{
                required:"Please provide your mobile",
                minlength: "You mobile must atleast 11 character need",

            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

    $('#loginForm').validate({

        rules: {
            email:{
                required:true,
                email:true
            },
            password:{
                required:true
            }

        },
        messages:{

            "password":{
                required:"Please provide your password"
            },
            "email":{
                required:"Please Enter your email",
                email:"Please enter valid Email"
            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });


    $('#passwordForm').validate({

        rules: {
            current_pwd:{
                required:true,
                minlength:6,
                maxlength:20
            },
            new_pwd:{
                required:true,
                minlength:6,
                maxlength:20
            },
            confirm_pwd:{
                required:true,
                minlength:6,
                maxlength:20,
                equalTo: '#new_pwd'
            }

        },
        messages:{

            "current_pwd":{
                required:"Please provide your current password",
                minlength: "Your current password must be atleast 6 characters long",
                maxlength: "Your current password must be less than 20 characters long"

            },
            "new_pwd":{
                required:"Please Enter your new password",
                minlength: "Your new password must be atleast 6 characters long",
                maxlength: "Your new password must be less than 20 characters long"
            },
            "confirm_pwd":{
                required:"Please Enter your confirm password",
                minlength: "Your confirm password must be atleast 6 characters long",
                maxlength: "Your confirm password must be less than 20 characters long"
            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

    //check Current User Password
    $('#current_pwd').keyup(function () {
        var current_pwd = $(this).val();
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
           type:'post',
           url:'/check-user-pwd',
            data:{current_pwd: current_pwd},
            success:function (resp) {
                if(resp == "false"){
                    $('#chePwd').html('<font color="red">Current Password is Incorrect</font>');
                }else if(resp == "true"){
                    $('#chePwd').html('<font color="green">Current Password is Correct</font>');
                }
            },
            error:function () {
                alert('Error');
            }
        });
    });

    $('#myPassword').passtrength({
        minChars: 4,
        passwordToggle: true,
        tooltip: true,
        eyeImg :"front/images/eye.svg"
    });

    // Copy Billing address to shipping address
    $('#bill2ship').on('click', function () {
       if(this.checked){
           $('#shipping_name').val($('#billing_name').val());
           $('#shipping_address').val($('#billing_address').val());
           $('#shipping_city').val($('#billing_city').val());
           $('#shipping_state').val($('#billing_state').val());
           $('#shipping_country').val($('#billing_country').val());
           $('#shipping_pincode').val($('#billing_pincode').val());
           $('#shipping_mobile').val($('#billing_mobile').val());
       }else{
           $('#shipping_name').val('');
           $('#shipping_address').val('');
           $('#shipping_city').val('');
           $('#shipping_state').val('');
           $('#shipping_country').val('');
           $('#shipping_pincode').val('');
           $('#shipping_mobile').val('');
       }
    });


});



function  selectPaymentMethod() {
    if($('#Paypal').is(':checked') || $('#COD').is(':checked')){

    }else{
        alert('Please Select Payment Method');
        return false;

    }
}


function checkPincode() {
    let pincode = $('#chkPincode').val();

    if(pincode == ""){
        alert("Please enter Pincode");return false;
    }
    $.ajax({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        type:'post',
        data:{pincode:pincode},
        url:'/check-pincode',
        success:function (resp) {
            if(resp > 0){
                $('#pincodeResult').html("<font color='green'>This product is available for the delivery </font>");

            }else{
                $('#pincodeResult').html("<font color='red'>This product is not available for the delivery</font>");

            }
        },error:function () {
            alert('Error');
        }
    });

}
