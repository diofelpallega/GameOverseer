var siteloc = "http://localhost/GameOverseer";
var scriptloc = "/scripts/";
  
  
$('form#register').validate({
	   success: function(label) {
		label.text("ok!").addClass("success"); 
	    },
 	   validClass: "success",
	   rules: {
                firstname: "required",  
				lastname: "required",
				
                username: {
                    required: true,
                    minlength: 6
                },
                password1: {
                    required: true,
                    minlength: 5
                },
                password2: {
                    required: true,
		            minlength: 5,
                    equalTo: "#password1"
                },
                inputEmail: {
                    required: true,
                    email: true
                },
                agree: "required",
                phone: {
                    required: true,
                    digits: true,
                    minlength: 11,
                    maxlength: 11
                },
				address: "required"
				
            },
            messages: {
                firstname: "Enter your firstname",
                lastname: "Enter your lastname",
                username: {
                    required:    "Please Enter username",
                    minlength: "Enter at least 6 characters"
                },
                password1: {
                    required:    "Please confirm your password",
                    minlength: "Your password must be at least 5 characters long"
                },
                password2: {
                    required:   "Please provide a password",
					minlength: "Your password must be at least 5 characters long",
                    equalTo:    "Please enter the same password as above"
                },
                email: "Please enter a valid email address",
                agree: "Please accept our policy",
                phone: {
                    required:     "Please enter phone number",
                    digits:         "Please enter only digits",
                    minlength:  "Please specify a valid phone number    ex. '09309134970' ",
                    maxlength: "Please specify a valid phone number   ex. '09309134970' "
                }
			 
            }
        });
		
		
		   $("button.signup").click(
		   
		   function () {
		   
           $.ajax({ 
				url: siteloc + scriptloc + "insertUser.py",
			data: 
				{
				
					username:$("#username").val(),
					password:$("#password1").val(),
					firstname:$("#firstname").val(),
					lastname:$("#lastname").val(),
					email:$("#email").val(),
					contactno:$("#contactno").val(),
					address:$("#address").val(),
				} ,
					dataType: 'json',
					success: function (res) {
					console.log("haaahaa");
					return res;
				 
				 }
				});
	        } );

		
		 
		