import 'package:flutter/material.dart';
import 'package:rainbow_reach/ui/screens/login/widgets/social_handles.dart';
import 'package:rainbow_reach/ui/screens/profile/profile_screen.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;

  const OTPScreen({super.key, required this.phoneNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
      List.generate(4, (_) => FocusNode()); // To manage input focus
  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    for (var controller in _otpControllers) {
      controller.addListener(_updateButtonState);
    }
  }

  void _updateButtonState() {
    setState(() {
      isButtonActive = _otpControllers.every((controller) =>
          controller.text.isNotEmpty); // Check if all inputs are filled
    });
  }

  void _onOtpFieldChanged(String value, int index) {
    if (value.isNotEmpty && index < _otpControllers.length - 1) {
      _focusNodes[index + 1].requestFocus(); // Move to the next input field
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus(); // Move back to the previous field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // White background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo and Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "Logoipsum",
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 36, // Adjust font size
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Enter OTP",
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // OTP Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "We have sent a one-time password on your entered number",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "+91 ${widget.phoneNumber}",
                            style: const TextStyle(
                              fontFamily: 'RedHatDisplay',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Change Number",
                          style: TextStyle(
                            fontFamily: 'RedHatDisplay',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Enter OTP*",
                style: TextStyle(
                  fontFamily: 'RedHatDisplay',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 60,
                    height: 60,
                    child: TextField(
                      controller: _otpControllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: const TextStyle(
                        fontFamily: 'RedHatDisplay',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: const InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => _onOtpFieldChanged(value, index),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: isButtonActive
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonActive
                      ? Colors.black
                      : const Color(0xFFF7F7F7), // Change button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Center(
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  const Text(
                    "Didn’t received the OTP?",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Resend OTP logic
                    },
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Code is valid for 10 minutes",
                    style: TextStyle(
                      fontFamily: 'RedHatDisplay',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Footer Social Handles
            Container(
              color: const Color(0xFFF7F7F7),
              width: double.infinity,
              child: const SocialHandles(),
            ),
          ],
        ),
      ),
    );
  }
}
