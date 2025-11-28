import 'package:flutter/material.dart';

class ChannelDetailsPlaylistScreen extends StatefulWidget {
  const ChannelDetailsPlaylistScreen({super.key});

  @override
  State<ChannelDetailsPlaylistScreen> createState() => _ChannelDetailsScreenState();
}

class _ChannelDetailsScreenState extends State<ChannelDetailsPlaylistScreen> {

  final List<Playlist> playlists = [
    Playlist(
      title: 'Behind the Scenes',
      videoCount: '25 videos',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD_vG3CKCoUsO0iHeA5iDZmDWaBFmth4BQfnbuN6dj7rflND4qjS-d2CEnYhDZxtw1CbEw5DTDIgoUt7zVxuykhb6l7apnNpkvB4ZMjRNLHavyT2rPXzY8YKLtoQhq57aBYzDXrNVwU4LzCQrP04uItgLKy_X9ZKZvNguKIK4IPbtQ6ChWtXqSTkno5RbIyVpMdH7b5n0XhY9JmfQy-v-Eb86DN5rTBTvWmkqb7Zbh3P9gt8vXgrvSLYCv5pUydEMCHnipOmmG6jYpF',
    ),
    Playlist(
      title: 'Tech Reviews',
      videoCount: '15 videos',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBVrbVCOtJ0MAmudQ2N66NLRFI6OvW-EeRBZFxdBNwr26uLE2yp8TgSpMNnfSAGGaIxYeCvyHpGrDo8cY6NZR6cMvSkYh2S7Vxkayn-rgRT8iN01t_hR6FZaPEpq76kkX3qmCWP7fSJvjEbrTFYQ7id5d9W5TRjuzn7O-7f6PATx2rcSuXnn2VEUfEmuNOMDJvazPiPRzC3xTscDqT9xhLnclgOC1RnWmG5Evcq9HF1cdAVIGIXngU7CNvsR1TVCFx8sx47G5ABPu2I',
    ),
    Playlist(
      title: 'Photography Guides',
      videoCount: '10 videos',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBNANWFlcvLvxLjRk33ylFgXHsMCgJJejoVgU3UbHKHEcW8ckX0cJaUBkmjormR2lvUyyMGq-bKncm3zV6PKxjK-0KFU4vwu_WbC8vJOudjIAoFe9y-iJ1dFJi9r6sK-jxf0snzx2mct8cR9ISW1JkBq1oGkBwy8aLT3ubTQ_TW4K02hqKLsmyAgfOib2k9r5OJIJqPL7rD0E59i36oB9pBnrFVbQNM9ystAK-18t9T-4IZkzKbcEYbJ2FpWmP4AF19uHU5pEdvVNyk',
    ),
    Playlist(
      title: 'Travel Vlogs',
      videoCount: '12 videos',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBTj6SfRDAs98bX3bEpE3NY4rIDzGa7a3DsBpKtR8YDmzWwi9h2P3Qfa6coEosvQOxbfoHVYH_jsXd2cgNgAGtI5l-PWo7oud5cNukP7cfYnGcRQNX9DSlvx-19LxDEGR25ETxw56o2LS07yVm0ubUEwSz5J5oFrvHBfhNhuDWLq1Ka3xPl8sm3yjzWUuHXVDDuuEyMkAl6M4pwTME3ExW4H8q_tuMBhRO7AuVjlBkgd5z8N73OiKdujHJvcMU7IGTfDKdhIgkcipKi',
    ),
    Playlist(
      title: 'Design & Creativity',
      videoCount: '32 videos',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDdKRg-LqJpEvnM2PYuqtN1oCICoPwD5oXZWGEHG1DxlEDMPm4WsiDCFKNLW5c-M_SrqJ-MEdbNHjmvYMsNbyZG1rgljJymv97TWnGna0XgLJ_vRjW3n7eKlxRrxycV0mTGKoai9lQ4oO3AdMtEFt_a9Hh503GbImy5_erC2h7b84-EGbBVrFQuSTmj0vwwtnX7Db3VKPr3sUNCrNYiYgzjLtSpkOL8foy5bpZ1QeWEbBLf93lU7UPEMXyfxcuo64YMvKUu5stvQ0SZ',
    ),
    Playlist(
      title: 'Channel Milestones',
      videoCount: '5 videos',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA854qQeXcoirxtjN499u0x8x7Tncz2uo4dk6uLXdtbXROTZ6kdxbm7aLd-4eOVsxbC5n01PBBRGCNbNMEEmTt7y0AsoE6tKL-e-YYuMVAK5GnqApT_vdYHOvPGPZsRMZii_LFL9VO_PCZcU0w2MjiqIfe_xwqg6CzT5wXgOMvQorAXrBDzlmqh-1B-prHmmf0s4v_RHNf4BwjGGvr2uMqucciNtgBeTP3T4fT2mkrjH4fOSxOltEMxDPtCfjX6xJNoS-63-bqvYo1c',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF0F0F0F);
    final textSecondaryColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
    final borderColor = isDark ? const Color(0xFF334155).withOpacity(0.5) : const Color(0xFFE2E8F0);

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final playlist = playlists[index];
            return _PlaylistCard(
              playlist: playlist,
              textColor: textColor,
              textSecondaryColor: textSecondaryColor,
            );
          },
          childCount: playlists.length,
        ),
      ),
    );
  }
}

class Playlist {
  final String title;
  final String videoCount;
  final String thumbnail;

  Playlist({
    required this.title,
    required this.videoCount,
    required this.thumbnail,
  });
}

class _PlaylistCard extends StatelessWidget {
  final Playlist playlist;
  final Color textColor;
  final Color textSecondaryColor;

  const _PlaylistCard({
    required this.playlist,
    required this.textColor,
    required this.textSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thumbnail with overlay
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(playlist.thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Playlist overlay
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.playlist_play,
                    color: Colors.white,
                    size: 36,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    playlist.videoCount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Title
        Text(
          playlist.title,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        // Channel name
        Text(
          'Modern Media',
          style: TextStyle(
            color: textSecondaryColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}