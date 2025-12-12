import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/view/screens/search/search_result_channel.dart';
import 'package:youtube_clone/view/screens/search/search_result_playlist.dart';
import 'package:youtube_clone/view/screens/search/search_result_shorts.dart';
import 'package:youtube_clone/view/screens/search/search_result_videos.dart';
import 'package:youtube_clone/view_model/search_provider.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  String _selectedFilter = 'All';
  late TabController _tabController;

  final List<String> filters = ['All', 'Videos','Shorts', 'Playlists',];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: filters.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
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
    final provider = Provider.of<SearchProvider>(context);

    return Scaffold(
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
                        controller: searchController,
                        style: TextStyle(color: textColor),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: textSecondaryColor),
                        ),
                        onSubmitted: (value){
                          provider.fetchSearchResults(value,);
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: textSecondaryColor),
                      onPressed: () => searchController.clear(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: searchController.text.isEmpty?SizedBox(): Column(
        children: [

          TabBar(
            controller: _tabController,
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
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          provider.isLoading?Center(child: CircularProgressIndicator()):Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: provider.movies!.items.length,
                  itemBuilder: (context,index){
                    return  _buildVideoCard(
                      thumbnail: provider.movies!.items[index].snippet.thumbnails.medium.url.toString(),
                      duration: '12:45',
                      title: provider.movies!.items[index].snippet.title.toString(),
                      views: '1.2M views • 2 months ago',
                      channel: provider.movies!.items[index].snippet.channelTitle,
                      textColor: textColor,
                      textSecondaryColor: textSecondaryColor,
                    );
                  },
                ),
                ListView.builder(
                  itemCount: provider.movies!.items.length,
                  itemBuilder: (context,index){
                    return  VideoListItem(
                      thumbnailUrl: provider.movies!.items[index].snippet.thumbnails.thumbnailsDefault.url.toString(),
                      title: provider.movies!.items[index].snippet.title.toString(),
                      channel: 'UI Designer',
                      views: '1.2M views',
                      timeAgo: '2 months ago',
                      duration: '10:45',
                    );
                  },
                ),
                YouTubeShortsSearch(),
                PlaylistSearchResultsPage(),
              ],
            ),
          ),
        ],
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
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: _buildMobileVideoCard(
            thumbnail: thumbnail,
            duration: duration,
            title: title,
            views: views,
            channel: channel,
            textColor: textColor,
            textSecondaryColor: textSecondaryColor,
          ),
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
              CircleAvatar(radius: 20,backgroundColor: Colors.grey,child: Icon(Icons.person),),
              SizedBox(width: 15,),
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
          child: _buildMobilePlaylistCard(
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



}