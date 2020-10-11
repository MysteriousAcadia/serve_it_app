
String validateMobile(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (value==null || value.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String validateEmail(String value) {
String patttern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
RegExp regExp = new RegExp(patttern);
if (value.length == 0) {
      return 'Please enter email address';
}
else if (!regExp.hasMatch(value)) {
      return 'Please enter valid email address';
}
return null;
}

String validatePassword(String value) {
String patttern = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
RegExp regExp = new RegExp(patttern);
if (value.length == 0) {
      return 'Please enter a password';
}
else if (!regExp.hasMatch(value)) {
      return 'Password must contain atleast 8 characters, 1 letter and 1 digit';
}
return null;
}

String validateName(String value) {
if (value ==null || value.length == 0) {
      return 'Please enter name';
}
return null;
}
