abstract class validate {


  static emailValidation (String? value){

    if (value!.isEmpty ||
        value.contains('@') == false) {
      return 'E-mail Required';
  }}

  static phoneValidation (String? value){
    {
      if (value == null ||
          value.length > 11 ||
          value.contains(RegExp(r'^(01)[0-9]{9}$')) == false ||
          value.isEmpty ) {
        return 'Enter Valid Phone Number';
      }
    }
    }

  static nameValidation (String? value){

    if (value == null || value.isEmpty) {
      return 'Enter name pls';

    }}



}