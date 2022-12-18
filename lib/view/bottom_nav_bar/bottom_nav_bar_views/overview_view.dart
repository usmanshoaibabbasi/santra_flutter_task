import 'package:flutter/material.dart';
import 'package:santra_flutter_task/utils/constants/colors.dart';

class OverViewView extends StatelessWidget {
  const OverViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().appBackgroundcolor,
      body: const Center(
        child: Text(
          'OverView',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
