// validators.dart
class Validators {
  Validators._();

 
  static String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  }

  final emailRegex =
      RegExp(r'^[\w\.-]+@([\w-]+\.)+[a-zA-Z]{2,}$');

  if (!emailRegex.hasMatch(value.trim())) {
    return 'Invalid email address';
  }

  return null;
}

   static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }

    // Split by one or more spaces and filter out empty strings
    final words = value.trim().split(RegExp(r'\s+'));

    if (words.length < 2) {
      return 'Please enter your full name (at least 2 words)';
    }

    return null;
  }

  static String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Must contain at least one uppercase letter';
  }

  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Must contain at least one number';
  }

  return null;
}

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-s./0-9]*$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    return null;
  }

  static String? validateMinLength(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < minLength) {
      return 'Must be at least $minLength characters';
    }
    return null;
  }
}
