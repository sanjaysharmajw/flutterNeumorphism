import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_ui/flutter_neumorphism_ui.dart';

const _bg = Color(0xFFE8EDF2);
const _light = Colors.white;
const _dark = Color(0xFFB8C0CC);
const _accent = Color(0xFF6C63FF);

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  bool _isPlaying = false;
  double _progress = 0.35;
  double _volume = 0.7;
  bool _isFav = false;
  int _trackIndex = 0;

  static const _tracks = [
    {
      'title': 'Blinding Lights',
      'artist': 'The Weeknd',
      'duration': '3:22',
      'g1': Color(0xFF667EEA),
      'g2': Color(0xFF764BA2),
    },
    {
      'title': 'As It Was',
      'artist': 'Harry Styles',
      'duration': '2:37',
      'g1': Color(0xFFFC5C7D),
      'g2': Color(0xFF6A3093),
    },
    {
      'title': 'Stay',
      'artist': 'The Kid LAROI',
      'duration': '2:21',
      'g1': Color(0xFF43C6AC),
      'g2': Color(0xFF191654),
    },
  ];

  Map<String, dynamic> get _track => _tracks[_trackIndex];

  String get _elapsed {
    final parts = (_track['duration'] as String).split(':');
    final total = int.parse(parts[0]) * 60 + int.parse(parts[1]);
    final sec = (total * _progress).round();
    return '${sec ~/ 60}:${(sec % 60).toString().padLeft(2, '0')}';
  }

  void _prev() => setState(() {
        _trackIndex = (_trackIndex - 1 + _tracks.length) % _tracks.length;
        _progress = 0;
        _isFav = false;
      });

  void _next() => setState(() {
        _trackIndex = (_trackIndex + 1) % _tracks.length;
        _progress = 0;
        _isFav = false;
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const SizedBox(height: 24),
            _buildHeader(),
            const SizedBox(height: 36),
            _buildAlbumArt(),
            const SizedBox(height: 32),
            _buildTrackInfo(),
            const SizedBox(height: 24),
            _buildProgress(),
            const SizedBox(height: 32),
            _buildControls(),
            const SizedBox(height: 32),
            _buildVolume(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlutterNeumorphism(
          style: NeumorphismStyle(
              color: _bg,
              shape: BoxShape.circle,
              depth: 5,
              lightShadow: _light,
              darkShadow: _dark),
          width: 44,
          height: 44,
          padding: EdgeInsets.zero,
          child: Icon(Icons.keyboard_arrow_down_rounded,
              color: Color(0xFF9EAFC2)),
        ),
        Column(
          children: [
            Text('Now Playing',
                style: TextStyle(fontSize: 12, color: Color(0xFF9EAFC2))),
            SizedBox(height: 2),
            Text('My Playlist',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748))),
          ],
        ),
        FlutterNeumorphism(
          style: NeumorphismStyle(
              color: _bg,
              shape: BoxShape.circle,
              depth: 5,
              lightShadow: _light,
              darkShadow: _dark),
          width: 44,
          height: 44,
          padding: EdgeInsets.zero,
          child: Icon(Icons.more_vert_rounded,
              color: Color(0xFF9EAFC2)),
        ),
      ],
    );
  }

  Widget _buildAlbumArt() {
    final g1 = _track['g1'] as Color;
    final g2 = _track['g2'] as Color;
    return FlutterNeumorphism(
      style: const NeumorphismStyle(
          color: _bg,
          shape: BoxShape.circle,
          depth: 14,
          lightShadow: _light,
          darkShadow: _dark),
      width: 230,
      height: 230,
      padding: const EdgeInsets.all(18),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [g1, g2]),
        ),
        child: const Center(
          child: Icon(Icons.music_note_rounded,
              size: 80, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTrackInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_track['title'] as String,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748))),
            const SizedBox(height: 4),
            Text(_track['artist'] as String,
                style: const TextStyle(
                    fontSize: 14, color: Color(0xFF9EAFC2))),
          ],
        ),
        FlutterNeumorphism(
          style: NeumorphismStyle(
              color: _bg,
              shape: BoxShape.circle,
              depth: _isFav ? 2 : 6,
              type:
                  _isFav ? NeumorphismType.pressed : NeumorphismType.flat,
              lightShadow: _light,
              darkShadow: _dark),
          width: 48,
          height: 48,
          padding: EdgeInsets.zero,
          onTap: () => setState(() => _isFav = !_isFav),
          child: Icon(
            _isFav
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: _isFav ? Colors.redAccent : const Color(0xFF9EAFC2),
          ),
        ),
      ],
    );
  }

  Widget _buildProgress() {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbColor: _accent,
            activeTrackColor: _accent,
            inactiveTrackColor: const Color(0xFFD0D8E4),
            overlayColor: _accent.withValues(alpha: 0.12),
            trackHeight: 4,
            thumbShape:
                const RoundSliderThumbShape(enabledThumbRadius: 7),
          ),
          child: Slider(
            value: _progress,
            onChanged: (v) => setState(() => _progress = v),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_elapsed,
                  style: const TextStyle(
                      color: Color(0xFF9EAFC2), fontSize: 12)),
              Text(_track['duration'] as String,
                  style: const TextStyle(
                      color: Color(0xFF9EAFC2), fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlutterNeumorphism(
          style: const NeumorphismStyle(
              color: _bg,
              shape: BoxShape.circle,
              depth: 6,
              lightShadow: _light,
              darkShadow: _dark),
          width: 54,
          height: 54,
          padding: EdgeInsets.zero,
          onTap: _prev,
          child: const Icon(Icons.skip_previous_rounded,
              color: Color(0xFF9EAFC2), size: 28),
        ),
        const SizedBox(width: 20),
        FlutterNeumorphism(
          style: NeumorphismStyle(
              color: _bg,
              shape: BoxShape.circle,
              depth: _isPlaying ? 4 : 10,
              type: _isPlaying
                  ? NeumorphismType.pressed
                  : NeumorphismType.flat,
              lightShadow: _light,
              darkShadow: _dark),
          width: 74,
          height: 74,
          padding: EdgeInsets.zero,
          onTap: () => setState(() => _isPlaying = !_isPlaying),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF8B80FF), _accent],
              ),
            ),
            child: Center(
              child: Icon(
                _isPlaying
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                color: Colors.white,
                size: 38,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        FlutterNeumorphism(
          style: const NeumorphismStyle(
              color: _bg,
              shape: BoxShape.circle,
              depth: 6,
              lightShadow: _light,
              darkShadow: _dark),
          width: 54,
          height: 54,
          padding: EdgeInsets.zero,
          onTap: _next,
          child: const Icon(Icons.skip_next_rounded,
              color: Color(0xFF9EAFC2), size: 28),
        ),
      ],
    );
  }

  Widget _buildVolume() {
    return Row(
      children: [
        const Icon(Icons.volume_down_rounded, color: Color(0xFF9EAFC2)),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: _accent,
              activeTrackColor: _accent,
              inactiveTrackColor: const Color(0xFFD0D8E4),
              overlayColor: _accent.withValues(alpha: 0.12),
              trackHeight: 3,
              thumbShape:
                  const RoundSliderThumbShape(enabledThumbRadius: 6),
            ),
            child: Slider(
              value: _volume,
              onChanged: (v) => setState(() => _volume = v),
            ),
          ),
        ),
        const Icon(Icons.volume_up_rounded, color: _accent),
      ],
    );
  }
}
