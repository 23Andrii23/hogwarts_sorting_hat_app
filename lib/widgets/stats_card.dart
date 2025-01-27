import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final int count;
  final String title;

  const StatsCard({
    required this.count,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
      ),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          Text(title),
        ],
      ),
    );
  }
}
