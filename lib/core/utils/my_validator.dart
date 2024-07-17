class MyValidators {
  static String? displayNamevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display Name Cannot Be Empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display Name Must Be Between 3 And 20 Characters';
    }

    return null; 
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter An Email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please Enter A Valid Email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter A Password';
    }
    if (value.length < 6) {
      return 'Password Must Be At Least 6 Characters Long';
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (passwordValidator(value) != null) {
      return passwordValidator(value);
    }
    if (value != password) {
      return 'Passwords Do Not Match';
    }
    return null;
  }
}
