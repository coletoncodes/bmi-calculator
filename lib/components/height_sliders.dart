import 'package:flutter/material.dart';

class HeightSliders extends StatelessWidget {
  final int feet;
  final int inches;
  final ValueChanged<int> onFeetChanged;
  final ValueChanged<int> onInchesChanged;

  const HeightSliders({super.key, 
    required this.feet,
    required this.inches,
    required this.onFeetChanged,
    required this.onInchesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text('Feet'),
            Slider(
              value: feet.toDouble(),
              min: 3,
              max: 7, // Restrict feet from 3 to 7 feet
              divisions: 4, // Divide the slider into 4 steps for each foot
              label: feet.toString(),
              onChanged: (double newValue) {
                onFeetChanged(newValue.round());
              },
            ),
          ],
        ),
        const SizedBox(width: 20), // Add spacing between feet and inches sliders
        Column(
          children: [
            const Text('Inches'),
            Slider(
              value: inches.toDouble(),
              min: 0,
              max: 11, // Inches range from 0 to 11
              divisions: 11, // 12 steps, one for each inch
              label: inches.toString(),
              onChanged: (double newValue) {
                onInchesChanged(newValue.round());
              },
            ),
          ],
        ),
      ],
    );
  }
}