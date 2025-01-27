import 'dart:async';

class OTPService {
  static Future<bool> validateOTP(String enteredOtp) async {
    await Future.delayed(const Duration(seconds: 2));
    return enteredOtp == "7773"; // Mock correct OTP
  }
}
