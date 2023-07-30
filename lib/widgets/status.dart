import 'package:chatrat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomStatus extends StatelessWidget {
  const CustomStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 110,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 20,
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: CustomAddStatus(),
            );
          }
          return const CustomAvatar();
        },
      ),
    );
  }
}
