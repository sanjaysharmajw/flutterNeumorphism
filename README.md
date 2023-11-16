
# Fancy Containers

Money converter

## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  flutter_neumorphism_ui: ^0.0.2
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:flutter_neumorphism_ui/flutter_neumorphism_ui_base.dart';
```

<table>
<tr>
<td>

```dart
child: FlutterNeumorphisms(
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


</td>
</tr>
</table>