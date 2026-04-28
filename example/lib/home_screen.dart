import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_ui/flutter_neumorphism_ui.dart';

const _bg = Color(0xFFE8EDF2);
const _light = Colors.white;
const _dark = Color(0xFFB8C0CC);
const _accent = Color(0xFF6C63FF);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> _deviceOn = [true, false, true, false];
  double _brightness = 0.6;
  double _temperature = 23.0;

  static const _devices = [
    {'icon': Icons.lightbulb_rounded, 'name': 'Lights', 'room': 'Living Room'},
    {'icon': Icons.ac_unit_rounded, 'name': 'AC', 'room': 'Bedroom'},
    {'icon': Icons.speaker_rounded, 'name': 'Speaker', 'room': 'Kitchen'},
    {'icon': Icons.security_rounded, 'name': 'Security', 'room': 'Main Door'},
  ];

  static const _deviceColors = [
    Color(0xFF6C63FF),
    Color(0xFF43C6AC),
    Color(0xFFFF6B6B),
    Color(0xFFFFD93D),
  ];

  static const _scenes = [
    {'icon': '🌅', 'label': 'Morning'},
    {'icon': '🌆', 'label': 'Evening'},
    {'icon': '🌙', 'label': 'Night'},
    {'icon': '🎬', 'label': 'Movie'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 28),
            _buildTemperatureCard(),
            const SizedBox(height: 28),
            _buildLabel('My Devices'),
            const SizedBox(height: 16),
            _buildDevicesGrid(),
            const SizedBox(height: 28),
            _buildLabel('Brightness'),
            const SizedBox(height: 16),
            _buildBrightnessCard(),
            const SizedBox(height: 28),
            _buildLabel('Scenes'),
            const SizedBox(height: 16),
            _buildScenes(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning ☀️',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
            const SizedBox(height: 4),
            const Text('Smart Home',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748))),
          ],
        ),
        const FlutterNeumorphism(
          style: NeumorphismStyle(
              color: _bg,
              shape: BoxShape.circle,
              depth: 6,
              lightShadow: _light,
              darkShadow: _dark),
          width: 52,
          height: 52,
          padding: EdgeInsets.zero,
          child: Icon(Icons.notifications_outlined, color: _accent),
        ),
      ],
    );
  }

  Widget _buildTemperatureCard() {
    return FlutterNeumorphism(
      style: const NeumorphismStyle(
          color: _bg,
          borderRadius: 24,
          depth: 8,
          lightShadow: _light,
          darkShadow: _dark),
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Living Room',
                    style: TextStyle(color: Color(0xFF9EAFC2), fontSize: 13)),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${_temperature.round()}',
                        style: const TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D3748))),
                    const Text('°C',
                        style: TextStyle(
                            fontSize: 24,
                            color: _accent,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.water_drop_outlined,
                        size: 14, color: Color(0xFF9EAFC2)),
                    const SizedBox(width: 4),
                    Text('65% Humidity',
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              FlutterNeumorphism(
                style: const NeumorphismStyle(
                    color: _bg,
                    shape: BoxShape.circle,
                    depth: 5,
                    lightShadow: _light,
                    darkShadow: _dark),
                width: 44,
                height: 44,
                padding: EdgeInsets.zero,
                onTap: () => setState(() => _temperature =
                    (_temperature + 0.5).clamp(16.0, 35.0)),
                child: const Icon(Icons.add, color: _accent),
              ),
              const SizedBox(height: 14),
              Text(_temperature.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 12, color: Color(0xFF9EAFC2))),
              const SizedBox(height: 14),
              FlutterNeumorphism(
                style: const NeumorphismStyle(
                    color: _bg,
                    shape: BoxShape.circle,
                    depth: 5,
                    lightShadow: _light,
                    darkShadow: _dark),
                width: 44,
                height: 44,
                padding: EdgeInsets.zero,
                onTap: () => setState(() => _temperature =
                    (_temperature - 0.5).clamp(16.0, 35.0)),
                child: const Icon(Icons.remove, color: _accent),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(text,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3748)));
  }

  Widget _buildDevicesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.1),
      itemCount: _devices.length,
      itemBuilder: (_, i) => _buildDeviceTile(i),
    );
  }

  Widget _buildDeviceTile(int i) {
    final isOn = _deviceOn[i];
    final color = _deviceColors[i];
    return FlutterNeumorphism(
      style: NeumorphismStyle(
          color: _bg,
          borderRadius: 20,
          depth: isOn ? 3 : 8,
          type: isOn ? NeumorphismType.pressed : NeumorphismType.flat,
          lightShadow: _light,
          darkShadow: _dark),
      padding: const EdgeInsets.all(20),
      onTap: () => setState(() => _deviceOn[i] = !_deviceOn[i]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isOn ? color.withValues(alpha: 0.15) : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _devices[i]['icon'] as IconData,
              color: isOn ? color : const Color(0xFF9EAFC2),
              size: 22,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_devices[i]['name'] as String,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isOn
                          ? const Color(0xFF2D3748)
                          : const Color(0xFF9EAFC2),
                      fontSize: 14)),
              Text(isOn ? 'On' : 'Off',
                  style: TextStyle(
                      color: isOn ? color : const Color(0xFF9EAFC2),
                      fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBrightnessCard() {
    return FlutterNeumorphism(
      style: const NeumorphismStyle(
          color: _bg,
          borderRadius: 20,
          depth: 8,
          lightShadow: _light,
          darkShadow: _dark),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.brightness_low_rounded, color: Color(0xFF9EAFC2)),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbColor: _accent,
                activeTrackColor: _accent,
                inactiveTrackColor: const Color(0xFFD0D8E4),
                overlayColor: _accent.withValues(alpha: 0.1),
                trackHeight: 4,
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 8),
              ),
              child: Slider(
                value: _brightness,
                onChanged: (v) => setState(() => _brightness = v),
              ),
            ),
          ),
          const Icon(Icons.brightness_high_rounded, color: _accent),
        ],
      ),
    );
  }

  Widget _buildScenes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _scenes
          .map(
            (s) => FlutterNeumorphism(
              style: const NeumorphismStyle(
                  color: _bg,
                  borderRadius: 16,
                  depth: 6,
                  lightShadow: _light,
                  darkShadow: _dark),
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              onTap: () {},
              child: Column(
                children: [
                  Text(s['icon']!, style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 6),
                  Text(s['label']!,
                      style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF9EAFC2),
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
