# Flutter Neumorphisms
- ![Pub Publisher](https://img.shields.io/pub/publisher/flutter_neumorphism_ui)
- ![Pub Points](https://img.shields.io/pub/points/flutter_neumorphism_ui)
- ![Pub Popularity](https://img.shields.io/pub/popularity/flutter_neumorphism_ui)
- ![Pub Version](https://img.shields.io/pub/v/flutter_neumorphism_ui)
- ![Pub Likes](https://img.shields.io/pub/likes/flutter_neumorphism_ui)

#### Flutter Neumorphism is a UI design trend that mimics real-world physical elements with soft, subtle shadows and highlights. It is needed because:

#### Aesthetic Appeal: Creates a modern, sleek, and visually pleasing interface that feels tactile and engaging.

#### User Experience: Mimics physical surfaces, making the UI more intuitive and familiar.

#### Customization: Offers creative control for unique and distinct app designs.

#### Stand Out: Helps apps stand out by adopting trendy, futuristic design elements.

#### Neumorphism strikes a balance between flat and skeuomorphic design, making it an effective choice for apps aiming for minimalism with depth.

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