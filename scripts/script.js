function onValidateEmail() {
    $("body").on('change', '#email', function() {
        var selectedValue = $(this).val();
            $.ajax({
            url: 'components/userDefined.cfc',
            type: 'get',
            dataType: "json",
            data: {
            method: "getUserByEmail",
            userEmail: selectedValue
            },
            success: function (data){
                if(data == 0){
                    document.getElementById("buttonChange").disabled = false;
                }else{
                    document.getElementById("alerts").innerHTML = "The email id already exist,please try again";
                }
            }, 
            error: function (xhr, textStatus, errorThrown){
                console.log(xhr);
            }
        });
    });
}
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
function showErrorMessage() {
    var value = document.getElementById("enteredValue").value;
    if(isNaN(value)){
        event.preventDefault();
        document.getElementById("alert").innerHTML ="Please enter Numeric value";
    }else{
        return;
        document.getElementById("alert").innerHTML ="okay";
    }
}



