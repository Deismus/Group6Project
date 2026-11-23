String? validateName(String name) {
  if(name.length > 30) {
    return 'Name is longer than 30 characters';
  }
  
  if(name.isEmpty) {
    return 'Name cannot be empty';
  }
  
  return null;
}

String? validatePassword(String password) {
  if (password.isEmpty) {
    return 'Password cannot be empty';
  }

  if (password.length < 8) {
    return 'Password must be at least 8 characters';
  }

  if (password.length > 30) {
    return 'Password is longer than 30 characters';
  }

  final specialCount = RegExp(r'[^A-Za-z0-9\s]').allMatches(password).length;
  if (specialCount < 3) {
    return 'Password must contain at least 3 special characters';
  }

  return null;
}