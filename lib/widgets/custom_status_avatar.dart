import 'package:chatrat/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
