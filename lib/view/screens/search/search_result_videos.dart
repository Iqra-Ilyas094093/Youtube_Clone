import 'package:flutter/material.dart';

class SearchResultsVideoPage extends StatefulWidget {
  const SearchResultsVideoPage({super.key});

  @override
  State<SearchResultsVideoPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsVideoPage> {
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView(
        children: const [
          VideoListItem(
            thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAhWWuuXLwPw88Cu0qS4g9Ek1YzPtbJjbJjsBNmaUObnXT3UJhOMAXsN41pPddAwIOHaatdIXKTKx3_eFEUwBIUO9Hiz9KxwJPKjYNhFkxpc9qkqTK09KLG3_hO_ypXFXZfTK5zEtH82M26Kw3J_Q52W8IcYXgrQCY4xADvTJzWYBP1pmGHh-yEGafVRofFDHGTuCg1_AXXGEBF7xQZ0AI9EEFnivaDQ5lJZZbQufIaQru6UCRSP__6VFwMwSDIXQdcoyR5kHHWuqLe',
            title: 'Intro to The Complete UI/UX Design Course',
            channel: 'UI Designer',
            views: '1.2M views',
            timeAgo: '2 months ago',
            duration: '10:45',
          ),
          VideoListItem(
            thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCc7oAgHJUjjAF9KQAEhQ3qk-5_TT6-6byk9BafizUkMadb4QXe7qyezeIVS1C0RdFwvrF-qMl1JOxFUNgRR2rqTGcHoF9A2EyarhBJgAevyU4YsTYVL4Bc5j27sfYVuN6cFGNCTDiCfBP4WwEkslrDUpn7RiMr83t1JuOHZpiDzr9EkMdFGmnZlBpCdBNBizlT8gKLvZcql_GrSQ4EPcdAIOVF5c_1_XXq8s3NmVb_Gqf9_SihBqQEnpKtHE7CB0Yw23-DRN40JTnz',
            title: 'Material Design System Crash Course for Beginners',
            channel: 'Design Pro',
            views: '876K views',
            timeAgo: '1 year ago',
            duration: '25:10',
          ),
          VideoListItem(
            thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAC4HIEMMbmDgl9-cE3LSc8JU6TlXQXjwSOXX36qLnTczaR5ElkWqabfa1R3DtnaHhG5c4zx_AB1RAcL_rybTiFnDdZXoNxqeFt77uUeC7IKX3D6mdCZyAnxEXJSISc_MpeAT5K38rihuFKxvuAQqkkF_Hatqh9Rbv6OqpK7dgVfYeeFJIZTKSpILnrHDYqkiimF53xBWojqQR0bNAHLhM7i25dD9-x5dqc-hee2ozJKXy6hOPIXs1C2rbWqQCEtDJaRBlybyY63nkS',
            title: 'How to create a UI Style Guide in Figma',
            channel: 'Figma Master',
            views: '2.5M views',
            timeAgo: '10 months ago',
            duration: '15:30',
          ),
          VideoListItem(
            thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBW7XArDxbIzjhjJR4ZGiIUanriuuCp7c9Rc27mtTCPGc2JykNt9P4xZd-s63dg4kAYcscO_DtvN4yDFPN48PMMoHPLzYCZXK20LXYvfN0oAan0LehQEzoKBlVEalcYH7JfckT6us8PAAyzkbMV1N9zfBmJ9XLizEdpTzVXnb6MEbDVNlxXfDD2fuMa80GUFj7jqCa1p-X5lLboxLOIAyhQrR9N_sGZC9h_4v_F13IqjAYcrUjGpTEurZZ_PoD6OiJfTdAjachNnEOk',
            title: 'Top 10 UI Design Trends for 2024',
            channel: 'Future UI',
            views: '980K views',
            timeAgo: '4 months ago',
            duration: '18:22',
          ),
          VideoListItem(
            thumbnailUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBnaeZgwl7_auw0O_vLj4Lh8dCRc-Uqdf137t_voW-hAbRV47h3t9aZPQwTjLX1Pe6PHIiSMhi17un3z2WEED98driql463vacbe9K1vm4jjgBdXxKZEGY3efafjzqXqyzKjXu6h4_VE_KunhpbOJv2GqHvZnQraUmu9FvS5Dx_KfFPz32QWA71DoMIJ09iwlK9iM497ixbrp6pSx3Amlj4UN-aL8Lx27_1nKYPU8bQ2DUHbQXp8E5T5bj3CT01pBDAmo8GT54jEPqs',
            title: 'Responsive Design in Webflow: A Complete Guide',
            channel: 'Webflow Pro',
            views: '512K views',
            timeAgo: '1 month ago',
            duration: '45:05',
          ),
        ],
      ),
    );
  }
}

class VideoListItem extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String channel;
  final String views;
  final String timeAgo;
  final String duration;

  const VideoListItem({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.channel,
    required this.views,
    required this.timeAgo,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF030303);
    final secondaryTextColor = isDark ? const Color(0xFFAAAAAA) : const Color(0xFF606060);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Expanded(
            flex: 0,
            child: SizedBox(
              width: 124,
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        thumbnailUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(2),
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
          ),
          const SizedBox(width: 16),

          // Video Info
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '$channel • $views • $timeAgo',
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.4,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Menu Button
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
            color: textColor,
            constraints: const BoxConstraints(
              minWidth: 28,
              minHeight: 28,
            ),
            iconSize: 20,
          ),
        ],
      ),
    );
  }
}