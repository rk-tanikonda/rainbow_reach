import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rainbow_reach/core/constants.dart';

class SocialHandles extends StatelessWidget {
  const SocialHandles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F7F7), // Light gray background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(
            "Our Social Handles",
            style: AppTextStyles.subtitle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  FontAwesomeIcons.instagram,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  FontAwesomeIcons.facebook,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  FontAwesomeIcons.linkedin,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  FontAwesomeIcons.twitter,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  FontAwesomeIcons.youtube,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "Contact Us",
            style: AppTextStyles.subtitle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                "contact@pleqsus.org",
                style: AppTextStyles.body.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                "+91 9999999999",
                style: AppTextStyles.body.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
