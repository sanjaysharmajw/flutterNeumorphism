# Flutter Neumorphisms
- ![Pub Publisher](https://img.shields.io/pub/publisher/flutter_neumorphism_ui)
- ![Pub Points](https://img.shields.io/pub/points/flutter_neumorphism_ui)
- ![Pub Popularity](https://img.shields.io/pub/popularity/flutter_neumorphism_ui)
- ![Pub Version](https://img.shields.io/pub/v/flutter_neumorphism_ui)
- ![Pub Likes](https://img.shields.io/pub/likes/flutter_neumorphism_ui)

##### The given code is a Flutter widget implementing a neumorphic design effect. Here's a brief explanation:

**`FlutterNeumorphisms`**: A custom widget designed for neumorphism, providing a soft, embossed or debossed effect using shadows.

**Customization**:
- **Shadows**:
    - `topLeftShadowColor`, `bottomRightShadowColor`: Define the colors for light and dark shadows, creating the illusion of depth.
    - `topLeftShadowBlurRadius`, `bottomRightShadowBlurRadius`: Control the softness of shadows.
    - `topLeftShadowSpreadRadius`, `bottomRightShadowSpreadRadius`: Define how far the shadows spread.
    - `topLeftOffset`, `bottomRightOffset`: Specify the shadow directions.
- **`backgroundColor`**: The background color of the widget.
- **`borderRadius`**: The widget's rounded corner radius.
- **`borderWidth`**: The thickness of the border around the widget.

**Dimensions**:
- `height` and `width`: Define the size of the neumorphic container.

4. **`onTap`**: A callback function triggered when the widget is tapped.

5. **Child Content**:
    - A **`Row`** layout is used, containing:
        - An **icon** (`Icons.opacity_rounded`).
        - A **spacer** (`SizedBox`) for spacing.
        - A **`Column`** with two text widgets displaying "Drop" and "Neu morphism."

This widget combines visual appeal with functionality by enabling a neumorphic design and supporting tap interactions.

```dart
FlutterNeumorphisms(
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
```