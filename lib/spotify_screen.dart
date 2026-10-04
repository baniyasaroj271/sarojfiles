import 'package:flutter/material.dart';

class SpotifyScreen extends StatelessWidget {
  const SpotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // 1. Artist Avatars Row
              Row(
                children: const [
                  _ArtistItem(
                    name: 'Lana Del Rey',
                    imageUrl:
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300&auto=format&fit=crop&q=80',
                    fallbackColor: Color(0xFF5A4843),
                  ),
                  SizedBox(width: 24),
                  _ArtistItem(
                    name: 'Marvin Gaye',
                    imageUrl:
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&auto=format&fit=crop&q=80',
                    fallbackColor: Color(0xFF3F4A52),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // 2. "Your 2021 in review" Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Wrapped Graphic Box
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4AF37),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Stack(
                      children: [
                        Center(
                          child: Icon(
                            Icons.auto_awesome,
                            color: Color(0xCC000000),
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '#SPOTIFYWRAPPED',
                        style: TextStyle(
                          color: Color(0xFFB3B3B3),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Your 2021 in review',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Your 2021 in Review Cards
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: _WrappedCard(
                      bgColor: Color(0xFFC2DC32),
                      textColor: Color(0xFF132F00),
                      title: 'Your Top Songs',
                      year: '2021',
                      caption: 'Your Top Songs 2021',
                      isPurple: false,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _WrappedCard(
                      bgColor: Color(0xFFB39CD8),
                      textColor: Color(0xFF230D42),
                      title: 'Your Artists',
                      year: 'Revealed',
                      caption: 'Your Artists Revealed',
                      isPurple: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // 3. Editor's picks Section
              const Text(
                "Editor's picks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: _A1Card(
                      caption: 'Ed Sheeran, Big Sean, Juice WRLD, Post Malone',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _FrontLeftCard(
                      caption: 'Mitski, Tame Impala, Glass Animals, Charli XCX',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArtistItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Color fallbackColor;

  const _ArtistItem({
    required this.name,
    required this.imageUrl,
    required this.fallbackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 86,
          height: 86,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: fallbackColor,
          ),
          child: ClipOval(
            child: Image.network(
              imageUrl,
              width: 86,
              height: 86,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: fallbackColor,
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white70,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _WrappedCard extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String title;
  final String year;
  final String caption;
  final bool isPurple;

  const _WrappedCard({
    required this.bgColor,
    required this.textColor,
    required this.title,
    required this.year,
    required this.caption,
    required this.isPurple,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.all(12),
            child: Stack(
              children: [
                // Top Left Spotify Logo
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: textColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.graphic_eq,
                        color: bgColor,
                        size: 9,
                      ),
                    ),
                  ),
                ),
                // Abstract background pattern
                Positioned(
                  top: 10,
                  right: 0,
                  child: Opacity(
                    opacity: 0.15,
                    child: Icon(
                      Icons.grain,
                      size: 80,
                      color: textColor,
                    ),
                  ),
                ),
                // Content Text
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        title,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        year,
                        style: TextStyle(
                          color: textColor,
                          fontSize: isPurple ? 22 : 36,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                          letterSpacing: isPurple ? -0.5 : -1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          caption,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _A1Card extends StatelessWidget {
  final String caption;

  const _A1Card({required this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF222222),
              borderRadius: BorderRadius.circular(4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=400&auto=format&fit=crop&q=80',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF2D2D2D),
                        child: const Icon(Icons.music_note, size: 50, color: Colors.white24),
                      );
                    },
                  ),
                  Container(
                    color: const Color(0x59000000),
                  ),
                  // Spotify logo top left
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        color: Color(0xFFC2DC32),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.graphic_eq, size: 10, color: Colors.black),
                      ),
                    ),
                  ),
                  // Giant Lime '1' on right
                  Positioned(
                    right: 4,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        '1',
                        style: const TextStyle(
                          color: Color(0xFFC2DC32),
                          fontSize: 100,
                          fontWeight: FontWeight.w900,
                          height: 0.9,
                        ),
                      ),
                    ),
                  ),
                  // Giant Lime 'A' on bottom left
                  Positioned(
                    left: 8,
                    bottom: -10,
                    child: Text(
                      'A',
                      style: const TextStyle(
                        color: Color(0xFFC2DC32),
                        fontSize: 85,
                        fontWeight: FontWeight.w900,
                        height: 0.9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          caption,
          style: const TextStyle(
            color: Color(0xFFB3B3B3),
            fontSize: 12,
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _FrontLeftCard extends StatelessWidget {
  final String caption;

  const _FrontLeftCard({required this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF65B889),
              borderRadius: BorderRadius.circular(4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Center image box
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&auto=format&fit=crop&q=80',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFF42805D),
                              child: const Icon(Icons.person, size: 40, color: Colors.white38),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  // Top left Spotify logo
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.graphic_eq, size: 9, color: Color(0xFF65B889)),
                      ),
                    ),
                  ),
                  // Bold "F R O N T" top right
                  const Positioned(
                    top: 6,
                    right: 8,
                    child: Text(
                      'F R O N T',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  // "L E F T ←" bottom right
                  const Positioned(
                    right: 8,
                    bottom: 20,
                    child: Text(
                      'L E F T ←',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          caption,
          style: const TextStyle(
            color: Color(0xFFB3B3B3),
            fontSize: 12,
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
