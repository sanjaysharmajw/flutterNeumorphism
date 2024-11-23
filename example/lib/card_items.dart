import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_ui/flutter_neumorphism_ui.dart';

class CardItems extends StatelessWidget {
  final double width;
  const CardItems({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return FlutterNeumorphisms(
      onTap: () {},
      borderRadius: 12,
      bottomRightShadowBlurRadius: 15,
      bottomRightShadowSpreadRadius: 1,
      borderWidth: 5,
      backgroundColor: Colors.grey.shade300,
      topLeftShadowBlurRadius: 15,
      topLeftShadowSpreadRadius: 1,
      topLeftShadowColor: Colors.white,
      bottomRightShadowColor: Colors.grey.shade500,
      height: 100,
      width: width,
      bottomRightOffset: const Offset(4, 4),
      topLeftOffset: const Offset(-4, -4),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.catching_pokemon, size: 70),
          SizedBox(height: 20),
          Text(
            "Neu morphism",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
