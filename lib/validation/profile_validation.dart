String? validateName(String name) {
  if(name.length > 30) {
    return 'Name is longer than 30 characters';
  }
  
  if(name.isEmpty) {
    return 'Name cannot be empty';
  }
  
  return null;
}