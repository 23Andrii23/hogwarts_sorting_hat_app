import 'package:flutter/material.dart';

class HouseCard extends StatelessWidget {
  final String house;
  final String imagePath;
  final VoidCallback? onTap;
  final bool isDisabled;

  const HouseCard({
    required this.house,
    required this.imagePath,
    required this.onTap,
    this.isDisabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isDisabled ? Colors.grey : Colors.black,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 32,
              height: 32,
              // color: isDisabled ? Colors.grey : null,
            ),
            Text(
              house,
              style: TextStyle(
                fontSize: 16,
                color: isDisabled ? Colors.grey : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
