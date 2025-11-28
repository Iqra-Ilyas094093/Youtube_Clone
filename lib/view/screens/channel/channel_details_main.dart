import 'package:flutter/material.dart';
import 'package:youtube_clone/view/screens/channel/channel_details_about.dart';
import 'package:youtube_clone/view/screens/channel/channel_details_community.dart';
import 'package:youtube_clone/view/screens/channel/channel_details_playlist.dart';

class ChannelDetailsScreen extends StatefulWidget {
  const ChannelDetailsScreen({super.key});

  @override
  State<ChannelDetailsScreen> createState() => _ChannelDetailsScreenState();
}

class _ChannelDetailsScreenState extends State<ChannelDetailsScreen> {
  int _selectedTab = 0; // Videos tab is selected

  final List<Video> videos = [
    Video(
      title: 'Our Most Ambitious Project Yet',
      views: '1.2M views • 2 days ago',
      duration: '12:45',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDdKRg-LqJpEvnM2PYuqtN1oCICoPwD5oXZWGEHG1DxlEDMPm4WsiDCFKNLW5c-M_SrqJ-MEdbNHjmvYMsNbyZG1rgljJymv97TWnGna0XgLJ_vRjW3n7eKlxRrxycV0mTGKoai9lQ4oO3AdMtEFt_a9Hh503GbImy5_erC2h7b84-EGbBVrFQuSTmj0vwwtnX7Db3VKPr3sUNCrNYiYgzjLtSpkOL8foy5bpZ1QeWEbBLf93lU7UPEMXyfxcuo64YMvKUu5stvQ0SZ',
    ),
    Video(
      title: 'How We Reached 1 Million Subscribers',
      views: '5M views • 1 year ago',
      duration: '25:10',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA854qQeXcoirxtjN499u0x8x7Tncz2uo4dk6uLXdtbXROTZ6kdxbm7aLd-4eOVsxbC5n01PBBRGCNbNMEEmTt7y0AsoE6tKL-e-YYuMVAK5GnqApT_vdYHOvPGPZsRMZii_LFL9VO_PCZcU0w2MjiqIfe_xwqg6CzT5wXgOMvQorAXrBDzlmqh-1B-prHmmf0s4v_RHNf4BwjGGvr2uMqucciNtgBeTP3T4fT2mkrjH4fOSxOltEMxDPtCfjX6xJNoS-63-bqvYo1c',
    ),
    Video(
      title: 'A Day in the Life: Behind the Scenes',
      views: '780K views • 1 week ago',
      duration: '18:32',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD_vG3CKCoUsO0iHeA5iDZmDWaBFmth4BQfnbuN6dj7rflND4qjS-d2CEnYhDZxtw1CbEw5DTDIgoUt7zVxuykhb6l7apnNpkvB4ZMjRNLHavyT2rPXzY8YKLtoQhq57aBYzDXrNVwU4LzCQrP04uItgLKy_X9ZKZvNguKIK4IPbtQ6ChWtXqSTkno5RbIyVpMdH7b5n0XhY9JmfQy-v-Eb86DN5rTBTvWmkqb7Zbh3P9gt8vXgrvSLYCv5pUydEMCHnipOmmG6jYpF',
    ),
    Video(
      title: 'Ultimate Guide to Landscape Photography',
      views: '2.1M views • 6 months ago',
      duration: '22:05',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBNANWFlcvLvxLjRk33ylFgXHsMCgJJejoVgU3UbHKHEcW8ckX0cJaUBkmjormR2lvUyyMGq-bKncm3zV6PKxjK-0KFU4vwu_WbC8vJOudjIAoFe9y-iJ1dFJi9r6sK-jxf0snzx2mct8cR9ISW1JkBq1oGkBwy8aLT3ubTQ_TW4K02hqKLsmyAgfOib2k9r5OJIJqPL7rD0E59i36oB9pBnrFVbQNM9ystAK-18t9T-4IZkzKbcEYbJ2FpWmP4AF19uHU5pEdvVNyk',
    ),
    Video(
      title: 'Exploring the Hidden Gems of Tokyo',
      views: '950K views • 2 weeks ago',
      duration: '15:59',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBTj6SfRDAs98bX3bEpE3NY4rIDzGa7a3DsBpKtR8YDmzWwi9h2P3Qfa6coEosvQOxbfoHVYH_jsXd2cgNgAGtI5l-PWo7oud5cNukP7cfYnGcRQNX9DSlvx-19LxDEGR25ETxw56o2LS07yVm0ubUEwSz5J5oFrvHBfhNhuDWLq1Ka3xPl8sm3yjzWUuHXVDDuuEyMkAl6M4pwTME3ExW4H8q_tuMBhRO7AuVjlBkgd5z8N73OiKdujHJvcMU7IGTfDKdhIgkcipKi',
    ),
    Video(
      title: 'The Best Tech of The Year: Unboxing',
      views: '3.4M views • 4 months ago',
      duration: '31:18',
      thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBVrbVCOtJ0MAmudQ2N66NLRFI6OvW-EeRBZFxdBNwr26uLE2yp8TgSpMNnfSAGGaIxYeCvyHpGrDo8cY6NZR6cMvSkYh2S7Vxkayn-rgRT8iN01t_hR6FZaPEpq76kkX3qmCWP7fSJvjEbrTFYQ7id5d9W5TRjuzn7O-7f6PATx2rcSuXnn2VEUfEmuNOMDJvazPiPRzC3xTscDqT9xhLnclgOC1RnWmG5Evcq9HF1cdAVIGIXngU7CNvsR1TVCFx8sx47G5ABPu2I',
    ),
  ];
  final List<Widget> tabWidget = [
    ChannelDetailsPlaylistScreen(),
    ChannelDetailsPlaylistScreen(),
    ChannelDetailsCommunityScreen(),
    ChannelDetailsAboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF0F0F0F);
    final textSecondaryColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
    final borderColor = isDark ? const Color(0xFF334155).withOpacity(0.5) : const Color(0xFFE2E8F0);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF181818) : const Color(0xFFF8F5F5),
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            pinned: true,
            floating: false,
            backgroundColor: isDark
                ? const Color(0xFF181818).withOpacity(0.8)
                : const Color(0xFFF8F5F5).withOpacity(0.8),
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
              color: textColor,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
                color: textColor,
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
                color: textColor,
              ),
            ],
          ),

          // Channel Banner and Info
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Channel Banner
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuBhJeMGFZmSjXb1ljoKKvruQbDBQADniWYZ428e0Vgnec3AOqFLMy7tZ2udm6YKnik0T-tYND7lzcmtAeIJT5sp6UkOT7iJ7TN8Lft76y_SY1zQFrrMeMO1NJo9Eye6mssssr5eMb0UAIvc3u5T9o26JsuIYZCKlpU2hJHcEesQyv38oCRMcxNiJwJwx47ZlG0I5y6wJ44ZRs6lmGf77zxnFykFdS7oTj6qUpCI_8hQQKOxT_ITljuo5NJ2CR011e5Xt85M6sHMSWZa',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                // Channel Info
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Channel Avatar
                      Container(
                        width: 96,
                        height: 96,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDark ? const Color(0xFF181818) : const Color(0xFFF8F5F5),
                            width: 4,
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuBj4K8WabxWOZfx5RaW0uYezj6sJwn3wrSfflhkCdD1Xeoi-Vco0Zw11SP4n9vXTqX0ZzdzqKPH58qPg12ITL_jh1-isih_KohI8K60kXD-RqIMo9MSHw9f9WZ8hEyayg8TAQhxb61Cdcy4l_aeKMBIgw88irTrmFBFTOiMA5jPRpvxA5qhIvPJ58PDdJG7ETScgFI2QqqlP8Nq-d7t71woF6CL8wQCe1gF_Q9-HchGa1051OoVwSkONFVqopxc9-jDpXSl3jcd50H_',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Modern Media',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '@modernmedia • 1.2M subscribers • 725 videos',
                              style: TextStyle(
                                color: textSecondaryColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Exploring the future of tech, design, and creativity. Join us!',
                    style: TextStyle(
                      color: textSecondaryColor,
                      fontSize: 14,
                    ),
                    softWrap: true,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF20D0D),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Subscribe',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Tabs Section
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyTabDelegate(
              child: Container(
                color: isDark
                    ? const Color(0xFF181818).withOpacity(0.95)
                    : const Color(0xFFF8F5F5).withOpacity(0.95),
                child: Column(
                  children: [
                    const Divider(height: 1),
                    Row(
                      children: [
                        _buildTab('Videos', 0, textColor, textSecondaryColor),
                        _buildTab('Playlists', 1, textColor, textSecondaryColor),
                        _buildTab('Community', 2, textColor, textSecondaryColor),
                        _buildTab('About', 3, textColor, textSecondaryColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPersistentHeader(delegate:Container()),
          SliverToBoxAdapter(child: tabWidget[_selectedTab],),
          // Videos Grid
          // SliverPadding(
          //   padding: const EdgeInsets.all(16),
          //   sliver: SliverGrid(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 12,
          //       mainAxisSpacing: 16,
          //       childAspectRatio: 0.75,
          //     ),
          //     delegate: SliverChildBuilderDelegate(
          //           (context, index) {
          //         final video = videos[index];
          //         return _VideoCard(
          //           video: video,
          //           textColor: textColor,
          //           textSecondaryColor: textSecondaryColor,
          //         );
          //       },
          //       childCount: videos.length,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget videoTab(Color textColor,Color textSecondaryColor){
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final video = videos[index];
            return _VideoCard(
              video: video,
              textColor: textColor,
              textSecondaryColor: textSecondaryColor,
            );
          },
          childCount: videos.length,
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index, Color textColor, Color textSecondaryColor) {
    final isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? const Color(0xFFF20D0D) : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? const Color(0xFFF20D0D) : textSecondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StickyTabDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyTabDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 49;

  @override
  double get minExtent => 49;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class Video {
  final String title;
  final String views;
  final String duration;
  final String thumbnail;

  Video({
    required this.title,
    required this.views,
    required this.duration,
    required this.thumbnail,
  });
}

class _VideoCard extends StatelessWidget {
  final Video video;
  final Color textColor;
  final Color textSecondaryColor;

  const _VideoCard({
    required this.video,
    required this.textColor,
    required this.textSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thumbnail with duration
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(video.thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Duration badge
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  video.duration,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Video info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                video.title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                video.views,
                style: TextStyle(
                  color: textSecondaryColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}