function validate(){
	document.getElementById('nameError').textContent = '';
    document.getElementById('passwordError').textContent = '';
    document.getElementById('emailError').textContent = '';
    document.getElementById('phoneError').textContent = '';
        
    var userNamePattern = /^[a-zA-Z ]+$/
    var emailPattern = /[a-z0-9_]+@[a-z]+.[a-z]{2,}$/
    var phonePattern = /^[6-9]{1}[0-9]{9}$/
    // var passwordPattern = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+\-={};':"|,.<>/?]).{8,}$/
    
    var userValidate = document.getElementById("login-fname").value
    var emailValidate = document.getElementById("email").value
    var phoneValidate = document.getElementById("phone").value
    var passwordValidate = document.getElementById("login-pass").value
    
    // for username 
    if(userValidate==""){
        document.getElementById("nameError").innerHTML="Please Enter Name"
        return false
    }

    if(userValidate.match(userNamePattern))
    true
    else{
        document.getElementById("nameError").innerHTML="Invalid Name"
        return false
    }

    if(userValidate.length < 3){
        document.getElementById("nameError").innerHTML="Name must contain minimum 3 charcters"
        return false
    }

    if(userValidate.length > 24){
        document.getElementById("nameError").innerHTML="Name conatins maximum 24 charcters"
        return false
    }
    
    //for password 
    if(passwordValidate==""){
        document.getElementById("passwordError").innerHTML="please enter password"
        return false
    }

    // if(passwordValidate.match(passwordPattern))
    // true
    // else{
    //     document.getElementById("passwordError").innerHTML="password must conatin uppercase letters, lowercase letters, special charcters and numbers"
    //     return false
    // }

    if(passwordValidate.length < 8){
        document.getElementById("passwordError").innerHTML="password contain more than 8 charcters"
        return false
    }

    // for email 
    if(emailValidate==""){
        document.getElementById("emailError").innerHTML="please enter email address"
        return false
    }

    if(emailValidate.match(emailPattern))
    true
    else{
        document.getElementById("emailError").innerHTML="Invaild email address"
        return false
    }

    // for phone number
    if(phoneValidate==""){
        document.getElementById("phoneError").innerHTML="please enter phone number"
        return false
    }

    if(phoneValidate.match(phonePattern))
    true
    else{
        document.getElementById("phoneError").innerHTML="Invaild phone number"
        return false
    }

}