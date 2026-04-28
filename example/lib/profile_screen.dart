import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_ui/flutter_neumorphism_ui.dart';

const _bg = Color(0xFFE8EDF2);
const _light = Colors.white;
const _dark = Color(0xFFB8C0CC);
const _accent = Color(0xFF6C63FF);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _stats = [
    {'value': '24', 'label': 'Projects'},
    {'value': '142', 'label': 'Packages'},
    {'value': '8.9K', 'label': 'Likes'},
  ];

  static const _menuItems = [
    {
      'icon': Icons.person_outline_rounded,
      'label': 'Edit Profile',
      'color': Color(0xFF6C63FF),
    },
    {
      'icon': Icons.notifications_outlined,
      'label': 'Notifications',
      'color': Color(0xFFFF6B6B),
    },
    {
      'icon': Icons.lock_outline_rounded,
      'label': 'Privacy',
      'color': Color(0xFF43C6AC),
    },
    {
      'icon': Icons.palette_outlined,
      'label': 'Appearance',
      'color': Color(0xFFFFD93D),
    },
    {
      'icon': Icons.help_outline_rounded,
      'label': 'Help & Support',
      'color': Color(0xFF9EAFC2),
    },
    {
      'icon': Icons.logout_rounded,
      'label': 'Sign Out',
      'color': Color(0xFFFF6B6B),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildAvatar(),
            const SizedBox(height: 16),
            const Text('Sanjay Sharma',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748))),
            const SizedBox(height: 4),
            const Text('Flutter Developer',
                style: TextStyle(fontSize: 14, color: Color(0xFF9EAFC2))),
            const SizedBox(height: 28),
            _buildStats(),
            const SizedBox(height: 32),
            _buildMenu(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return FlutterNeumorphism(
      style: const NeumorphismStyle(
          color: _bg,
          shape: BoxShape.circle,
          depth: 10,
          lightShadow: _light,
          darkShadow: _dark),
      width: 110,
      height: 110,
      padding: const EdgeInsets.all(6),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF667EEA), Color(0xFF764BA2)]),
        ),
        child: const Center(
          child: Text('SS',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _stats
          .map(
            (s) => FlutterNeumorphism(
              style: const NeumorphismStyle(
                  color: _bg,
                  borderRadius: 18,
                  depth: 8,
                  lightShadow: _light,
                  darkShadow: _dark),
              width: 100,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                children: [
                  Text(s['value']!,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: _accent)),
                  const SizedBox(height: 4),
                  Text(s['label']!,
                      style: const TextStyle(
                          fontSize: 11, color: Color(0xFF9EAFC2))),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildMenu() {
    return Column(
      children: _menuItems.map((item) {
        final color = item['color'] as Color;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: FlutterNeumorphism(
            style: const NeumorphismStyle(
                color: _bg,
                borderRadius: 16,
                depth: 6,
                lightShadow: _light,
                darkShadow: _dark),
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            onTap: () {},
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(item['icon'] as IconData,
                      color: color, size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(item['label'] as String,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2D3748))),
                ),
                const Icon(Icons.chevron_right_rounded,
                    color: Color(0xFF9EAFC2)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
