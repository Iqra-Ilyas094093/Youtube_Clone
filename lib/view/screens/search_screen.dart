import 'package:flutter/material.dart';
import 'package:youtube_clone/view/screens/search/search_result_channel.dart';
import 'package:youtube_clone/view/screens/search/search_result_playlist.dart';
import 'package:youtube_clone/view/screens/search/search_result_shorts.dart';
import 'package:youtube_clone/view/screens/search/search_result_videos.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController(text: 'UI design tutorials');
  String _selectedFilter = 'All';
  late TabController _tabController;

  final List<String> filters = ['All', 'Videos', 'Channels', 'Shorts', 'Playlists', 'Sort by'];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: filters.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedFilter = filters[_tabController.index];
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF0F0F0F);
    final textSecondaryColor = isDark ? const Color(0xFFAAAAAA) : const Color(0xFF606060);
    final chipColor = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);
    final searchBackground = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);
    final searchBorder = isDark ? const Color(0xFF475569) : const Color(0xFFCBD5E1);

    return DefaultTabController(
      length: filters.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDark
              ? const Color(0xFF221010).withOpacity(0.8)
              : const Color(0xFFF8F5F5).withOpacity(0.8),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: textColor,
              ),
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: searchBackground,
                    border: Border.all(color: searchBorder),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      Icon(Icons.search, color: textSecondaryColor),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: TextStyle(color: textColor),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: textSecondaryColor),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: textSecondaryColor),
                        onPressed: () => _searchController.clear(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: const Color(0xFFF20D0D),
            tabs: filters.map((filter) {
              final isSelected = _selectedFilter == filter;
              return Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFF20D0D) : chipColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        filter,
                        style: TextStyle(
                          color: isSelected ? Colors.white : textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (filter == 'Sort by')
                        Icon(Icons.arrow_drop_down,
                            color: isSelected ? Colors.white : textColor, size: 20),
                    ],
                  ),
                ),
              );
            }).toList(),
            onTap: (index) {
              setState(() {
                _selectedFilter = filters[index];
              });
            },
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: _buildAllUI(textColor, textSecondaryColor),
              ),
            ),
            SearchResultsVideoPage(),
            SearchResultsChannelPage(),
            YouTubeShortsSearch(),
            PlaylistSearchResultsPage(),
            SingleChildScrollView(
              child: Column(
                children: _buildAllUI(textColor, textSecondaryColor),
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget _buildVideoCard({
    required String thumbnail,
    required String duration,
    required String title,
    required String views,
    required String channel,
    required Color textColor,
    required Color textSecondaryColor,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLargeScreen = constraints.maxWidth > 600;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: isLargeScreen
              ? _buildDesktopVideoCard(
            thumbnail: thumbnail,
            duration: duration,
            title: title,
            views: views,
            channel: channel,
            textColor: textColor,
            textSecondaryColor: textSecondaryColor,
          )
              : _buildMobileVideoCard(
            thumbnail: thumbnail,
            duration: duration,
            title: title,
            views: views,
            channel: channel,
            textColor: textColor,
            textSecondaryColor: textSecondaryColor,
          ),
        );
      },
    );
  }

  Widget _buildMobileVideoCard({
    required String thumbnail,
    required String duration,
    required String title,
    required String views,
    required String channel,
    required Color textColor,
    required Color textSecondaryColor,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  duration,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      views,
                      style: TextStyle(
                        color: textSecondaryColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      channel,
                      style: TextStyle(
                        color: textSecondaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_vert, color: textSecondaryColor),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopVideoCard({
    required String thumbnail,
    required String duration,
    required String title,
    required String views,
    required String channel,
    required Color textColor,
    required Color textSecondaryColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 192,
          height: 108,
          margin: const EdgeInsets.only(right: 16),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    duration,
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
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                views,
                style: TextStyle(
                  color: textSecondaryColor,
                  fontSize: 14,
                ),
              ),
              Text(
                channel,
                style: TextStyle(
                  color: textSecondaryColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: textSecondaryColor),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildChannelCard({
    required String avatar,
    required String name,
    required String stats,
    required Color textColor,
    required Color textSecondaryColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(avatar),
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
                  name,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  stats,
                  style: TextStyle(
                    color: textSecondaryColor,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF20D0D),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
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
    );
  }

  Widget _buildPlaylistCard({
    required String thumbnail,
    required String title,
    required String channel,
    required String updated,
    required String videoCount,
    required Color textColor,
    required Color textSecondaryColor,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLargeScreen = constraints.maxWidth > 600;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: isLargeScreen
              ? _buildDesktopPlaylistCard(
            thumbnail: thumbnail,
            title: title,
            channel: channel,
            updated: updated,
            videoCount: videoCount,
            textColor: textColor,
            textSecondaryColor: textSecondaryColor,
          )
              : _buildMobilePlaylistCard(
            thumbnail: thumbnail,
            title: title,
            channel: channel,
            updated: updated,
            videoCount: videoCount,
            textColor: textColor,
            textSecondaryColor: textSecondaryColor,
          ),
        );
      },
    );
  }

  Widget _buildMobilePlaylistCard({
    required String thumbnail,
    required String title,
    required String channel,
    required String updated,
    required String videoCount,
    required Color textColor,
    required Color textSecondaryColor,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Playlist overlay
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.playlist_play, color: Colors.white, size: 48),
                  const SizedBox(height: 8),
                  Text(
                    videoCount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      channel,
                      style: TextStyle(
                        color: textSecondaryColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      updated,
                      style: TextStyle(
                        color: textSecondaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_vert, color: textSecondaryColor),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopPlaylistCard({
    required String thumbnail,
    required String title,
    required String channel,
    required String updated,
    required String videoCount,
    required Color textColor,
    required Color textSecondaryColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 192,
          height: 108,
          margin: const EdgeInsets.only(right: 16),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Playlist overlay
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.playlist_play, color: Colors.white, size: 32),
                    const SizedBox(height: 4),
                    Text(
                      videoCount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                channel,
                style: TextStyle(
                  color: textSecondaryColor,
                  fontSize: 14,
                ),
              ),
              Text(
                updated,
                style: TextStyle(
                  color: textSecondaryColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: textSecondaryColor),
          onPressed: () {},
        ),
      ],
    );
  }
  List<Widget> _buildAllUI(Color textColor, Color textSecondaryColor) {
    return [
      // Your full current UI for "All" tab
      _buildVideoCard(
        thumbnail: 'https://lh3...',
        duration: '12:45',
        title: 'Ultimate Guide to Component-Based Design Systems',
        views: '1.2M views • 2 months ago',
        channel: 'DesignPro Channel',
        textColor: textColor,
        textSecondaryColor: textSecondaryColor,
      ),

      const SizedBox(height: 8),

      _buildChannelCard(
        avatar: 'https://lh3...',
        name: 'DesignPro Channel',
        stats: '150K subscribers • 42 videos',
        textColor: textColor,
        textSecondaryColor: textSecondaryColor,
      ),

      const SizedBox(height: 8),

      _buildPlaylistCard(
        thumbnail: 'https://lh3...',
        title: 'Complete Course on Design Systems',
        channel: 'DesignPro Channel',
        updated: 'Updated 3 weeks ago',
        videoCount: '25 videos',
        textColor: textColor,
        textSecondaryColor: textSecondaryColor,
      ),

      const SizedBox(height: 8),

      _buildVideoCard(
        thumbnail: 'https://lh3...',
        duration: '25:10',
        title: 'Figma for Beginners: A Complete Tutorial',
        views: '890K views • 1 year ago',
        channel: 'Figma Masters',
        textColor: textColor,
        textSecondaryColor: textSecondaryColor,
      ),

      const SizedBox(height: 32),

      Center(
        child: Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(bottom: 32),
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF20D0D)),
          ),
        ),
      ),
    ];
  }


}