import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // Using 'required' for non-nullable fields and VoidCallback for onPress
  const ReusableCard({super.key, required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild; // Nullable since it's optional
  final VoidCallback? onPress; // Nullable since onPress might not always be provided

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // Can be null, so it's fine to pass a nullable callback here
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
