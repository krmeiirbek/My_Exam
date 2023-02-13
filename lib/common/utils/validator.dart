/// Check email format
bool duIsEmail(String? input) {
  if (input == null || input.isEmpty) return false;
  // Mailbox regular
  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(input);
}

/// Check character length
bool duCheckStringLength(String? input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length >= length;
}
