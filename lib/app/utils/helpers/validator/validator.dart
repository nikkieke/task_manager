String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return '';
  } else if (value.length < 8) {
    return 'Must be at least 8 characters';
  }
  return null;
}

String? validateName(String? value) {
  const pattern = r"^[.!#$%&'*+<>:;,%@()(/=?^_`{|}~-]";
  final regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return '';
  }
  if (regExp.hasMatch(value)) {
    return 'invalid';
  }
  return null;
}

String? validateEmail(String? value) {
  const pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r'{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]'
      r'{0,253}[a-zA-Z0-9])?)*$';
  final regExp = RegExp(pattern);
  if (value!.length < 6) {
    return '';
  } else if (value.isEmpty) {
    return '';
  } else if (!regExp.hasMatch(value)) {
    return '';
  }
  return null;
}
