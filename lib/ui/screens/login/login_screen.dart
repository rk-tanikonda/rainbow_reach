import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rainbow_reach/core/constants.dart';
import 'package:rainbow_reach/ui/screens/login/widgets/social_handles.dart';
import 'package:rainbow_reach/ui/screens/login/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false; // To track the loading state

  Future<bool> sendOTP(String phoneNumber) async {
    const String apiUrl =
        "https://mockapi.io/sendOtp"; // Replace with actual URL later
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"phone": phoneNumber}),
      );

      if (response.statusCode == 200) {
        // Assuming the API returns success status
        final responseBody = jsonDecode(response.body);
        return responseBody["success"] == true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error sending OTP: $e");
      return false;
    }
  }

  void handleNextButton(BuildContext context) async {
    final phoneNumber = phoneController.text.trim();
    if (phoneNumber.isNotEmpty) {
      setState(() {
        isLoading = true; // Start the loader
      });

      final success = await sendOTP(phoneNumber);

      setState(() {
        isLoading = false; // Stop the loader
      });

      if (true) {
        // Navigate to OTP Screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(phoneNumber: phoneNumber),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to send OTP. Try again."),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid phone number."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Set app background color
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 65,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              "Logoipsum",
                              style: TextStyle(
                                fontFamily: 'RedHatDisplay',
                                fontWeight: FontWeight.bold,
                                fontSize: 32, // Increased font size
                              ),
                            ),
                            const SizedBox(height: 24), // Adjusted spacing
                            Text(
                              "Let’s make things more personalized",
                              style: TextStyle(
                                fontFamily: 'RedHatDisplay',
                                fontWeight: FontWeight.w500,
                                fontSize: 20, // Increased font size
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40), // Adjusted spacing
                      const Text(
                        "Phone*",
                        style: TextStyle(
                          fontFamily: 'RedHatDisplay',
                          fontWeight: FontWeight.w500,
                          fontSize: 18, // Increased font size
                        ),
                      ),
                      const SizedBox(height: 12), // Adjusted spacing
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixText: "+91 ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, // Adjusted vertical padding
                            horizontal: 16,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 18, // Adjusted input text font size
                        ),
                      ),
                      const SizedBox(height: 24), // Increased spacing
                      ElevatedButton(
                        onPressed: isLoading
                            ? null // Disable the button while loading
                            : () => handleNextButton(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 18), // Increased button padding
                        ),
                        child: SizedBox(
                          width: double
                              .infinity, // Make the button content occupy full width
                          child: isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      fontFamily: 'RedHatDisplay',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18, // Increased font size
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 56), // Increased spacing
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 35,
              child: const SocialHandles(),
            ),
          ],
        ),
      ),
    );
  }
}
