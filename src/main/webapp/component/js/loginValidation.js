function validate(){
	document.getElementById('emailError').textContent = '';
    document.getElementById('passwordError').textContent = '';
        
    var userValidate = document.getElementById("email").value
    var passwordValidate = document.getElementById("login-pass").value
    
    // for username 
    if(userValidate==""){
        document.getElementById("emailError").innerHTML="please enter Email"
        return false
    }
    
    //for password 
    if(passwordValidate==""){
        document.getElementById("passwordError").innerHTML="please enter Password"
        return false
    }
    
}