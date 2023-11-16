
# Flutter Neumorphisms

Flutter Neumorphisms UI/UX

## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  flutter_neumorphism_ui: ^0.0.6
```
1. Import the package and use it in your Flutter App.
```dart
import 'package:flutter_neumorphism_ui/flutter_neumorphism_ui_base.dart';
```

<table>
<tr>
<td>

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
height: size.width * 0.5,
width: size.width * 0.5,
padding: const EdgeInsets.all(50),
bottomRightOffset: const Offset(4, 4),
topLeftOffset: const Offset(-4, -4),
child: const Center(child: Text("Hello World")),
)
```

## Example
```dart

import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_ui/flutter_neumorphism_ui_base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
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
                      width: size.width,
                      bottomRightOffset: const Offset(4, 4),
                      topLeftOffset: const Offset(-4, -4),
                      child: const Row(
                        children: [
                          Icon(Icons.no_food),
                          SizedBox(width: 20),
                          Text("Food",style: TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
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
                      width: size.width,
                      bottomRightOffset: const Offset(4, 4),
                      topLeftOffset: const Offset(-4, -4),
                      child: const Row(
                        children: [
                          Icon(Icons.no_food),
                          SizedBox(width: 20),
                          Text("Food",style: TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )

        ),
      )
    );
  }
}
```
<img src="https://github.com/sanjaysharmajw/flutterNeumorphism/blob/main/Screenshot_1700136901.png?raw=true" alt="How example looks" width="250" height="540">


</td>
</tr>
</table>