import 'package:flutter/material.dart';
import 'package:rainbow_reach/ui/screens/dashboard/user_dashboard_screen.dart';
import 'package:rainbow_reach/ui/screens/login/widgets/social_handles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String selectedSexuality = "Transgender";

  final List<String> sexualities = [
    "Transgender",
    "Male",
    "Female",
    "Non-Binary",
    "Other"
  ];

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dobController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  void submitProfile() {
    final String name = nameController.text.trim();
    final String dob = dobController.text.trim();

    if (name.isEmpty || dob.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please fill in all the required fields.")),
      );
      return;
    }

    // Handle the profile submission logic here
    print("Name: $name");
    print("Date of Birth: $dob");
    print("Sexuality: $selectedSexuality");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Submitted Successfully!")),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const UserDashboardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
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
                              fontSize: 36,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Profile",
                            style: TextStyle(
                              fontFamily: 'RedHatDisplay',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Fill in your personal details",
                            style: TextStyle(
                              fontFamily: 'RedHatDisplay',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 24),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.black,
                            child: const Text(
                              "J",
                              style: TextStyle(
                                fontFamily: 'RedHatDisplay',
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              // Add logic to upload an image
                              print("Upload Image");
                            },
                            child: const Text(
                              "Upload Image",
                              style: TextStyle(
                                fontFamily: 'RedHatDisplay',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Name*",
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Date of Birth*",
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: dobController,
                      readOnly: true,
                      onTap: () => selectDate(context),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.calendar_today),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Select Sexuality*",
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedSexuality,
                      items: sexualities
                          .map((sexuality) => DropdownMenuItem(
                                value: sexuality,
                                child: Text(
                                  sexuality,
                                  style: const TextStyle(
                                    fontFamily: 'RedHatDisplay',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSexuality = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: submitProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontFamily: 'RedHatDisplay',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              // Ensure the Social Handles widget occupies the full width
              const SocialHandles(),
            ],
          ),
        ),
      ),
    );
  }
}
