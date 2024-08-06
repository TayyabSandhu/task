class CustomValidator {
  // Validate if a given text is a valid email address
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegExp.hasMatch(email)) {
      return 'Invalid email address';
    }
    return null;
  }



  // Validate if a given text has at least a specified minimum length
  static String? validateMinLength(String? text, int minLength) {
    if (text == null || text.isEmpty) {
      return 'This field is required';
    }
    if (text.length < minLength) {
      return 'Must be at least $minLength characters';
    }
    return null; // Return null if the text is valid
  }

  // Validate if a given text has at least a specified minimum length
  static String? validateStringMatch(String? textOne, String? textTwo) {
    if (textOne == null || textOne.isEmpty) {
      return 'This field is required';
    }
    if (textTwo != textOne) {
      return "Password didn't match";
    }
    return null;
  }
}
