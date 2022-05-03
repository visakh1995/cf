function onValidate() {
    var position = document.getElementById("position").value;
    var yes = document.getElementById("yes").value;
    var no = document.getElementById("no").value;
    var startDate = document.getElementById("startDate").value;
    var firstName = document.getElementById("firstName").value;
    var lastName = document.getElementById("lastName").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    var cbox = document.forms["myForm"]["checks"];

    if(position == ""){
        document.getElementById("alert").innerHTML ="Please select the position you are looking for";
        return false;
    }
    if(cbox[0].checked == false &&cbox[1].checked == false) {
        document.getElementById("alert").innerHTML ="Please Select checkbox";
        return false;
    }
    if(startDate == "") {
        document.getElementById("alert").innerHTML ="Please Select the start date";
        return false;
    }
    if(firstName == "" ||  lastName == "" || email == "" || phone =="" ) {
        document.getElementById("alert").innerHTML ="Please fill all fields in contact information";
        return false;
    }
    if(!isNaN(firstName) || !isNaN(lastName) ) {
        document.getElementById("alert").innerHTML ="Name field cant allow numbers";
        return false;
    }
    var phoneNum = phone.replace(/[^\d]/g, '');
        if(phoneNum.length > 6 && phoneNum.length < 11) { 
        return true;
    }else{
        document.getElementById("alert").innerHTML ="please provide valid phone number";
    return false;
    }      
}
