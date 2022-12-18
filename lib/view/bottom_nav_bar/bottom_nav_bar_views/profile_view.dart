import 'package:flutter/material.dart';
import 'package:santra_flutter_task/utils/constants/colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().appBackgroundcolor,
      body: const Center(
        child: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
