import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Screen',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: const Color(0xFFF20D0D),
          background: const Color(0xFFF8F5F5),
          surface: Colors.white,
          onBackground: const Color(0xFF0F0F0F),
          onSurface: const Color(0xFF0F0F0F),
        ),
        fontFamily: 'Spline Sans',
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFF20D0D),
          background: Color(0xFF121212),
          surface: Color(0xFF221010),
          onBackground: Color(0xFFF1F1F1),
          onSurface: Color(0xFFF1F1F1),
        ),
        fontFamily: 'Spline Sans',
      ),
      home: const VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? const Color(0xFFF1F1F1) : const Color(0xFF0F0F0F);
    final textSecondaryColor = isDark ? const Color(0xFFAAAAAA) : const Color(0xFF606060);
    final surfaceColor = isDark ? const Color(0xFF221010) : Colors.white;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Video Player
              _buildVideoPlayer(context),
              const SizedBox(height: 16),

              // Video Info Section
              _buildVideoInfo(textColor, textSecondaryColor),
              const SizedBox(height: 16),

              // Channel Info
              _buildChannelInfo(textColor, textSecondaryColor, surfaceColor),
              const SizedBox(height: 16),

              // Action Chips
              _buildActionChips(textColor, surfaceColor),
              const SizedBox(height: 16),

              // Comments Section
              _buildCommentsSection(textColor, textSecondaryColor, surfaceColor),
              const SizedBox(height: 16),

              // Suggested Videos
              _buildSuggestedVideos(textColor, textSecondaryColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.ober-surfaces.com/cache/images/product/34173cb38f07f89ddbebc2ac9128303f-1235-oberflex_purepapercolor_skin_grey010_detail.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Progress Bar
                  Stack(
                    children: [
                      Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Container(
                        height: 4,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF20D0D),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.3 - 8,
                        top: -6,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Time Labels
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0:37',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '2:23',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoInfo(Color textColor, Color textSecondaryColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How to Design Great User Interfaces',
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '1.2M views • 2 weeks ago',
            style: TextStyle(
              color: textSecondaryColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelInfo(Color textColor, Color textSecondaryColor, Color surfaceColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAv8hnZ5rCOW-kVIxtNaAzf0FqP4EBwh4oA0-GYeJ6VBC780eFCJ2HNbGNCawmVIWw6Wg4IgY9czo0QSUJxaYx0XmJxEp-Lq6m3Io67HG3e5wraySE1d4pfFH1CVm2EF39s2pZTpcZ60K-z27nLoJu7cFuTJryzdVrjad9hHvSr_t4wTjGdhGS3j5owZJdDrl2itOpFhGePw4CWcLLobq34l6eYoew_yA7tkWpXKrp36Kh9Cger0JZFyQGdcQr1D6z6BXbecS_zwJlJ',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Design Masters',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '1.5M subscribers',
                  style: TextStyle(
                    color: textSecondaryColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: textColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text(
                'Subscribe',
                style: TextStyle(
                  color: surfaceColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionChips(Color textColor, Color surfaceColor) {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                const Icon(Icons.thumb_up, size: 18, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  '18k',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  width: 1,
                  height: 20,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.grey.withOpacity(0.2),
                ),
                const Icon(Icons.thumb_down, size: 18, color: Colors.grey),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildActionChip('Share', Icons.share, textColor, surfaceColor),
          const SizedBox(width: 8),
          _buildActionChip('Download', Icons.download, textColor, surfaceColor),
          const SizedBox(width: 8),
          _buildActionChip('Save', Icons.playlist_add, textColor, surfaceColor),
        ],
      ),
    );
  }

  Widget _buildActionChip(String text, IconData icon, Color textColor, Color surfaceColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: textColor),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsSection(Color textColor, Color textSecondaryColor, Color surfaceColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Comments ',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: '4.2k',
                        style: TextStyle(
                          color: textSecondaryColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.unfold_more, color: textSecondaryColor, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuC99783ti_wMiDARMZHdudQR1kBBVDGml-SCRck6gttceLQ563GDYA608BNU5_nzPBCG3TSIT02JbSgRHsOMfu2yfVMhmauxG3QWL5FSHBeY1ziZ32t2ZydISuS9oAZkiYEbEtAH30n-lB1G2qz_6wrgwm8elyMsJfGKXcPc44pcTqfUKX4_Z31NG4K9AK1ltr9JvAt8Ob0fSfVD2pf0Z1f1l0Ndc0ouBQgcd-2gXaFvBdAeVzCMckbso_70byVCC2f8h0TC4ykL0BH',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "This is exactly what I was looking for! The tips on whitespace are game-changing. Can't wait to apply these to my projects.",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestedVideos(Color textColor, Color textSecondaryColor) {
    final videos = [
      {
        'title': 'Mastering Color Theory in UI Design',
        'channel': 'Pixel Perfect',
        'views': '890k views',
        'duration': '12:45',
        'thumbnail': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBUmY7aFJ5Sia857HBl95VyQFqZImw2RID0vABRJRcf-dK0RX65UVOUpQaWILUKAYZ24YqTGX70k4m0Ak6AoJZRzx4s_NUl6COPObByeWPqkMNED2x_8LT-NFqfzPSpyRNvjwaL8-ciGSI7nXaHlVQtk8j7xPKnOOXbVDzKnJuU9wKwTGgDJ5-oNHxSv1ukzvI53VvVxZwZatfenYNEW4UzUiGkv8el97QsOye1YO8qgv49Wrdgqie2fWcVw3C1rp6kCMbhxJrWYgYU',
      },
      {
        'title': 'The Ultimate Guide to Typography for Web',
        'channel': 'Font Founders',
        'views': '2.1M views',
        'duration': '21:17',
        'thumbnail': 'https://lh3.googleusercontent.com/aida-public/AB6AXuC9iO64YaJ-YxKjJ0j_m_-KoemwzAd_6A3FNli4QpZC1hMkft7yB8i4LKmPd0mJosn4eg7EGcZwgiqH_oDcbVC4H4OVgumMqnpoTNTPq9KyHvdbYGQg1a7UMOIzfnV09HR7qgluFVL7QOL-vkyhNhWaWuyTSoSThCqC1tevhSC6kYqsjO7d_IiqG-u_mIeWZqYwZrx05ML5vLi-CK5-ILvzcCnafLsV_Paj-CrS0MftXQwTTUi5n1IC5FghjZyrjAZ6PMbgTlfScRj1',
      },
      {
        'title': '5 Responsive Design Tricks You Need to Know',
        'channel': 'Design Masters',
        'views': '450k views',
        'duration': '09:30',
        'thumbnail': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBYDWCYHvjWaVpt0q2o-rtMBgsXVWbVyriPBg_TgVOqaaEjYGEXDLTqenOeTggJUUt2H4a_cdB5aP4Hdc77DdzfPzpnrOL2MnqDfM4vW9F9hXVcQLGjNVVnOzZz7E2XlQyR1tU0Z2HOD7pvdp6Hs08PJoVyDaCLXMHgrTIVB0GhF5AXShAoQVRB0CprOlj6ybbwiTEnzJNDIN2t2jyZF776dHrTP1q1gXZ8rF7cIU40Irsbwz6U3DTM7_zhx-9dfqwIfX9ujkQ3644A',
      },
    ];

    return Column(
      children: videos.map((video) => _buildVideoCard(video, textColor, textSecondaryColor)).toList(),
    );
  }

  Widget _buildVideoCard(Map<String, String> video, Color textColor, Color textSecondaryColor) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(video['thumbnail']!),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  video['duration']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video['title']!,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${video['channel']!} • ${video['views']!}',
                  style: TextStyle(
                    color: textSecondaryColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}