import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_ui/flutter_neumorphism_ui.dart';

class Items extends StatelessWidget {
  final double width;
  const Items({super.key, required this.width});

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
      child:  const Row(
        children: [
          Icon(Icons.opacity_rounded,size: 30),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Drop",style: TextStyle(fontSize: 20)),
              Text("Neu morphism",style: TextStyle(fontSize: 18),),
            ],
          )
        ],
      ),
    );
  }
}
