import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistSearchResultsPage extends StatefulWidget {
  const PlaylistSearchResultsPage({super.key});

  @override
  State<PlaylistSearchResultsPage> createState() => _PlaylistSearchResultsPageState();
}

class _PlaylistSearchResultsPageState extends State<PlaylistSearchResultsPage> {
  final List<Playlist> playlists = [
    Playlist(
      title: 'Learn UI Design in 30 Days',
      channel: 'DesignPro Channel',
      thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCMgX9tIf8W8xFoG4YQyBfnGRfg4mAKP2nkB1ib9qo28AvrMXxQhJed30mrizz70o_-I-UTF_sweOYwIweswJj2uI1C3h0Pru_MsHdc3gsPjAsXWQoplXpo15YI0EWscqDuPE0tswrLz0GEenizhhRT7RUhB5dJJz69HCIC6sJxMVMLVW-TTPF3owGo-DC5JN2B1mCwrq8_EgYk16OOv_s430jGZeODFyFShC0FGpAftJEdwsca8hnWHhNEjLYoZfWkNtV5pj-2kNMr',
      videoCount: '30 VIDEOS',
    ),
    Playlist(
      title: 'UI/UX Crash Course for Beginners',
      channel: 'AwesomeUX',
      thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAGdr7hfWwstUqoGSlC3iHG5gMvX6ZhDx7YhTCyY35om4Op2_TP7Mehofx3yTmajb8XYuYVOuOu37BgCmUL50G4mKeOZyxQswxXmLZDczEbM1wXyFepn-RB0IEzNTbFj16dM-zY5hUvZkw2xHFQcMOXLbVB1QPXvOBgQKThgwqed2iL0_DeMJunQHzz_CFcuyPWi-fJd89I2HBmdSDO7WFfufnGRb2XRmy8Y2cXr7y95le8bgi2fhlK4DQfTgBw9OVI8ZSh3Jcx1Oow',
      videoCount: '52 VIDEOS',
    ),
    Playlist(
      title: 'Advanced Prototyping Techniques',
      channel: 'Proto Master',
      thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCvs6xrOcAzduuOs0R231_otXWtgb3CamxwxroaEiU7e3cXk1ak2VYdXYEniANqxVoyt4i9-mJp7B9gADTxiqrJLv3ext9XJjG84JMk_xsG4Yn7lxQjVFNrv7htC9QPFsNuPnQuA_q4gri0RI9w9UcKxDrOrsjXRFRWphKHhp1y4hE6B2JkVXBcbTmA8g6XLDn7JwGNgNARVoxLUvoidSSK9L3SiaW_977iqUIQAZfKqleTrvQ0cdLcOvOBPdOtKlBtqBh3opGQ_CyG',
      videoCount: '18 VIDEOS',
    ),
    Playlist(
      title: 'Figma for UI Designers',
      channel: 'Figma Fanatics',
      thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDnfZUPMZ0St9J98R2Np_IQvElQtS4RgZjkg_wFh1_w8i6x5-nYG2kDYpxQlZ_laAiCWM6EVJbPueqOkodlw01jqNyoGmnStR_yOJLujPq3KWxmx13DABvA1TIdVUwDtXjepzoXK6vx-V_T8mRtA8A0haY0I5r77PZz1BclAhzsEBwTtmAspL0r1m1TL01V9f7my2EcsVNG2TI3tzzY3onfcd1M6KMuCVr4wPsOTuqI1MUgQtIlFGmAx5d8Wte1XZ8ie4LnT_BqrLJR',
      videoCount: '25 VIDEOS',
    ),
    Playlist(
      title: 'Daily UI Challenges',
      channel: 'CreativeFlow',
      thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD8hX7OulJYzXAjtH3-Ou3FkGKG4VjZGRtVqow0tT_MCVt9GHPAROfBjZ_RbtkuSBA2nEJ2crSx1JWiLmIJJt0MxynG5LJbWH6IYZ1uyo9dukE_E6D-BjQJK6g5slH9dDJnTuW6uNUgUZsOZLcNLLTHnXI5VbsiEGdFgzbeKEtWHSsKP3k4BIDH7IHLVkx9j_V_UyEAPlkTT33oFvnb0uk9kTSjJHkkvStF_7tb5Mo1_Ou4GArcKNJLlyd9kV-JBSkG7aIXSoMiPGSp',
      videoCount: '100 VIDEOS',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Playlist List
        Expanded(
          child: ListView.builder(
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              return _buildPlaylistItem(playlists[index], isDark);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPlaylistItem(Playlist playlist, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail with overlay
          SizedBox(
            width: 124,
            height: 70,
            child: Stack(
              children: [
                // Thumbnail Image
                Container(
                  width: 124,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(playlist.thumbnailUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Overlay with icon and video count
                Container(
                  width: 124,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.playlist_play,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        playlist.videoCount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Playlist Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  playlist.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : Colors.black,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  playlist.channel,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark
                        ? Colors.white.withOpacity(0.6)
                        : Colors.black.withOpacity(0.6),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // More Options Button
          SizedBox(
            width: 28,
            height: 28,
            child: IconButton(
              onPressed: () {
                _showPlaylistOptions(playlist);
              },
              icon: Icon(
                Icons.more_vert,
                color: isDark ? Colors.white : Colors.black,
                size: 20,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ],
      ),
    );
  }

  void _showPlaylistOptions(Playlist playlist) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.playlist_add),
                title: const Text('Add to queue'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle add to queue
                },
              ),
              ListTile(
                leading: const Icon(Icons.download),
                title: const Text('Download playlist'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle download
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share playlist'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle share
                },
              ),
              ListTile(
                leading: const Icon(Icons.save_alt),
                title: const Text('Save to library'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle save to library
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class Playlist {
  final String title;
  final String channel;
  final String thumbnailUrl;
  final String videoCount;

  Playlist({
    required this.title,
    required this.channel,
    required this.thumbnailUrl,
    required this.videoCount,
  });
}