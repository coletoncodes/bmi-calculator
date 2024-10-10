import 'package:flutter/material.dart';

class HeightSliders extends StatelessWidget {
  final int feet;
  final int inches;
  final ValueChanged<int> onFeetChanged;
  final ValueChanged<int> onInchesChanged;

  const HeightSliders({
    super.key,
    required this.feet,
    required this.inches,
    required this.onFeetChanged,
    required this.onInchesChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Flexible allows resizing based on available space
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
          ),
        ),
        // Spacing between sliders, adjust based on screen width if needed
        SizedBox(width: screenWidth * 0.05), // 5% of the screen width
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
          ),
        ),
      ],
    );
  }
}