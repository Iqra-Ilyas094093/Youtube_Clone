import 'package:flutter/material.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {

  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> shorts = [
    {
      'videoUrl':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCqd88DL1N5417WPZObjgxeNjPOgodkXKhjk-l4RhR1yT_BhB18LsUaJ6JomZJQlRbEIPwAULqVOIhRS6sxmwN8pGaV34MSEYHgIsjgXB3RhjJ3wGE_jqaOdFS090hZGYe4bmL0P9D6uGZM8XT_yCDPEHX9RmU4G1pRiPvz_2GXyXgEI8kplS6J2XZzLOxh5-rU6RP7dwZuY6IuLx2Ll5EEFrK1U7M6TCu2ZSCrXhEZ1c9k7HkAWqMHzDTXBS79LXxCNDz1TGmHNFPT',
      'username': '@creative_user',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuA9cfmaJzqOJTKQanOi00xXZAI9SaqdUo0kWKLXjYm-tmMbAXGhY1A09RiSz0_Vr48Jj49YJ32Nrn0pEjwBVKJ7_d57Z2ieVb-NX-8w46EJ52wl494AUBZzHeHhX6bVP6YZ-vMEwHWwiSiuS24JBnwDu3yt9dSFLYjAmrmj1mDbOvXwexdflyDp37D07j2KbqjTdx-iHk-FJHxk7fQoVVATLa6z0MEsb6gnkSJQpwE_OFR6BTynxWBKN7QWNRNcahGo_VKXDa29hk2k',
      'caption': 'This is the video caption, enjoying the city lights tonight! #city #dance #nightlife',
      'audio': 'Original Audio - @creative_user',
      'likes': '1.2M',
      'comments': '8,432',
    },
    // Add more shorts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full-screen video background
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: shorts.length,
            itemBuilder: (context, index) {
              final short = shorts[index];
              return _ShortVideoCard(short: short);
            },
          ),

        ],
      ),
    );
  }
}

class _ShortVideoCard extends StatefulWidget {
  final Map<String, dynamic> short;

  const _ShortVideoCard({required this.short});

  @override
  State<_ShortVideoCard> createState() => _ShortVideoCardState();
}

class _ShortVideoCardState extends State<_ShortVideoCard> {
  bool _showPlayButton = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle video tap (play/pause)
      },
      child: Stack(
        children: [
          // Video Background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.short['videoUrl']),
                fit: BoxFit.cover,
              ),
            ),
            child: MouseRegion(
              onEnter: (_) => setState(() => _showPlayButton = true),
              onExit: (_) => setState(() => _showPlayButton = false),
              child: AnimatedOpacity(
                opacity: _showPlayButton ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Center(
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Gradient Overlays
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Content Overlay
          Positioned(
            bottom: 80, // Above bottom navigation
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Left side - Video info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User info and subscribe button
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              NetworkImage(widget.short['avatar']),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              widget.short['username'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              height: 32,
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF20D0D),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'Subscribe',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Caption
                        Text(
                          widget.short['caption'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        // Audio info
                        Row(
                          children: [
                            const Icon(
                              Icons.music_note,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.short['audio'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Right side - Interaction buttons
                  const SizedBox(width: 16),
                  _buildInteractionSidebar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionSidebar() {
    return Column(
      children: [
        _buildInteractionButton(
          icon: Icons.thumb_up,
          count: widget.short['likes'],
          label: '',
        ),
        const SizedBox(height: 16),
        _buildInteractionButton(
          icon: Icons.thumb_down,
          count: 'Dislike',
          label: '',
        ),
        const SizedBox(height: 16),
        _buildInteractionButton(
          icon: Icons.comment,
          count: widget.short['comments'],
          label: '',
        ),
        const SizedBox(height: 16),
        _buildInteractionButton(
          icon: Icons.share,
          count: 'Share',
          label: '',
        ),
        const SizedBox(height: 16),
        _buildInteractionButton(
          icon: Icons.more_horiz,
          count: '',
          label: '',
        ),
      ],
    );
  }

  Widget _buildInteractionButton({
    required IconData icon,
    required String count,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (label.isNotEmpty)
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}