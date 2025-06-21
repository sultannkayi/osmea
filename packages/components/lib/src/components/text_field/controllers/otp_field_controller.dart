class OTPController {
  /// Validate OTP format
  static String? validateOTP(String? otp, int expectedLength) {
    if (otp == null || otp.isEmpty) {
      return 'OTP is required';
    }
    if (otp.length != expectedLength) {
      return 'OTP must be $expectedLength digits';
    }
    if (!RegExp(r'^\d+$').hasMatch(otp)) {
      return 'OTP must contain only numbers';
    }
    return null;
  }

  /// Format OTP for display
  static String formatOTP(String otp, {String separator = '-'}) {
    if (otp.length <= 4) return otp;
    return otp.split('').join(separator);
  }

  /// Clean OTP string (remove non-digits)
  static String cleanOTP(String input) {
    return input.replaceAll(RegExp(r'[^\d]'), '');
  }
}
