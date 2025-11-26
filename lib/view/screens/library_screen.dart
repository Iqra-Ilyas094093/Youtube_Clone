import 'package:flutter/material.dart';
import 'package:path/path.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF221010) : const Color(0xFFF8F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            _buildTopAppBar(context),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile Header
                    _buildProfileHeader(context),

                    // Quick Access Chips
                    _buildQuickAccessChips(),

                    // Recently Watched Section
                    _buildRecentlyWatched(context),

                    // Playlists Section
                    _buildPlaylistsSection(context),

                    const SizedBox(height: 80), // Space for bottom navigation
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildTopAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16).copyWith(bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
      ),
      child: Row(
        children: [
          // Profile Picture
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              "https://lh3.googleusercontent.com/aida-public/AB6AXuDdEoexc9y7hi4ejLkGhoNfDiYfLLg-8Iq3EiYI6H4Ruuf3jHgJf0-6QRi0f-8L_yobIBbsLFskC5BFw-HfVr9SwBf0KTeBms6bRiiBUkEEqOsOGW-07TKDss3oUgbDuewb9UqkNqV2UL_FoZYqauqdDHQz7BqZVj58hS476NtMNhPhI079bY5wmA-VMGaRJc9VQqYz-iyIy1Th5f-NJDTtpZCqwNfcBX7V0FphKOgdzSy8_qNA9_Q1BZLni3famNurlKKDNyo6wXyf",
            ),
          ),
          const SizedBox(width: 8),

          // Title
          Expanded(
            child: Text(
              'Library',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),

          // Search Button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuA4psB-LXN8jfXw1Als4T8RaDP53JwL0Ns2I_PMP_DFk1u6IYeleTkFH5PymXx0P1WbWtAhApNyc4PHbMf9EtmM7r7_2viYUOhSuDHJY0kYu84GTaKQ600KPCCIY70qcPUKikwAsj92KbvnwKcOOSOlsmJok50zM-z6KZCtYUq2IwmotwQPGGe97qrf2bbHckBDIR1JTYuwuyAPLIv0pjvD9UlQwz9FYNirV2YWe5fLZGAHITicYMz9CMZQhfpw2nA2QP35eCZQMgmC",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cody Fisher',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '@codyfisher',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonal(
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.manage_accounts),
                  SizedBox(width: 8),
                  Text('Manage Account'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessChips() {
    final chips = [
      {'icon': Icons.history, 'label': 'History'},
      {'icon': Icons.download, 'label': 'Downloads'},
      {'icon': Icons.thumb_up, 'label': 'Liked'},
      {'icon': Icons.smart_display, 'label': 'Your videos'},
    ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: chips.length,
        itemBuilder: (context, index) {
          final chip = chips[index];
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Row(
                children: [
                  Icon(chip['icon'] as IconData, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    chip['label'] as String,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentlyWatched(context) {
    final videos = [
      {
        'thumbnail': "https://lh3.googleusercontent.com/aida-public/AB6AXuDLcJLFhGRyPZakqChfPPl2bynfsyCgVT9y479LmG1He4N4Ok7Y_Dn3LTMnAOrjcOU50XFshhcAMzGqgPvf0mGKHu4xxTeM1APYOeMR7NOsadoPs2g16b1ZwDQKCa4DAev5QI2KR5Eq3DXjSKxc9v5Mfi4CUWXSQdJABbp-IXvEmuCD4yLVpHMe1x34y-7jcz0MDLZ6UMPKv5YTlopzdSBBbqix8VQZ7irTMo1phIkVpPNTZQa8vHs_v8gdRaW5m-Kh0mvPZIHrOlTF",
        'title': 'The Ultimate UI Design Tutorial',
        'channel': 'DesignCode'
      },
      {
        'thumbnail': "https://lh3.googleusercontent.com/aida-public/AB6AXuAWE9_2VESWoKQ8mlDBfB1CTp1sOtRAGejrZrPnm_IZeLfdQTMELqHRPXJZ_hqjth12ghjsOYLFzYNeZtIvnNiVGvG0iSAnJKxf54SgsmKA8Z0sCuhxn4aLfenl-8iiyRVxgjsyII-H2j_SaU9KeuQif3N-nkCMwaz1Aot_iE39l2cBBdYAAB656WMHYftNleoG8ernI4U_j2yMUpIRMZMD6Jc-csVSvl5W8uQa0qzsXn8LqWFS7m0WEyU2hZPCxqbHAsS2rBbIO5hp",
        'title': 'How to build a great app',
        'channel': 'TechLead'
      },
      {
        'thumbnail': "https://lh3.googleusercontent.com/aida-public/AB6AXuA2HKPK5E4FTATbL3fRrUmDeYiYVqw6bPkiBkcdWvbRzrv9tWc43H177ngo2sh068Ql-H7qC49fUOo1HWy67udvOxzeZvZt9z1ZsJhoxZHSDb2Yd0cq51TgqDRsBj7dhtmhwlPDvZgTUWPlB_Nwbpajze4bKkEDNgyzQ4zQCoGIdqmh4wx-pNipH_Dc0-1o8BBP2oaR2VtTiHcUuPzdMHl_03sXzyR2gE1S2YcgHzEMFRgyZ6CMK4ytII0Nt1J3O2_zaD7F1q3kvAS7",
        'title': 'Figma Advanced Tips',
        'channel': 'UX Tools'
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recently Watched',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View all',
                  style: TextStyle(
                    color: Color(0xFFF20D0D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return Container(
                width: 200,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          video['thumbnail'] as String,
                          width: double.infinity,
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
                    const SizedBox(height: 8),
                    Text(
                      video['title'] as String,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      video['channel'] as String,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPlaylistsSection(context) {
    final playlists = [
      {
        'thumbnail': "https://lh3.googleusercontent.com/aida-public/AB6AXuDiV8Z2_lQB1nO3RRAZIL7djXmQX4QbnAUmM20CfOYN4y1RY7fR40wiT47l2ZN9mv4zI56QPN97tbE6vWdrVffJvFRhDu6TXnPLRyQS7GZ_lgNIxo8W4CWZoxWrL0MUMaw6B-zckN_pezWaKkeD3FQ_AVGt3ga8IrmCrftHQfN8skn-8FYI4p2GwATMVcC20i5sEybVL0aJ2zuROpFGJOwJa3cjUdJcS2o5hBdbJlROx_Jayhz-hPLoAHXYbyyMM24g0KH-tGlLMvcr",
        'title': 'Watch Later',
        'count': '18 videos',
        'icon': Icons.playlist_play,
      },
      {
        'thumbnail': "https://lh3.googleusercontent.com/aida-public/AB6AXuD5HbR10Vkjjj4fLsZX3_gu2PrJXHpMzrsK2WHmmpfwueyKa-SjBGehuNJJAvpHz59bSSOW8RdarnMilXdoNKkd0XkemzKPmHvb_dKBgYufyBs_HExvrk3ABRZsxQ-aftQYbhmASbpjuBY-tURmOp5H-OjAhjrFVezcUsUPsaa4tex3ht55D5H6BNKSBcHNX-VBdMi178PymnSBWlkkT1CPBspDf-lMrPFvso78p_srMqj4x7_Z6yoV-fMtj68PoMBK1JGc5WYBKAcb",
        'title': 'Liked Videos',
        'count': '234 videos',
        'icon': Icons.thumb_up,
      },
      {
        'thumbnail': "https://lh3.googleusercontent.com/aida-public/AB6AXuBWTRpS8NtSHuSy4ekoaNiLGknsgV0ejdybNvIlwZU6YOiycsbwF9bdSpK_Znpl0KxbleyLRHiACS7jPkxxry93gMQuV_mPe_0MyBIQVVIlWD6QlDo4Rv4aCBAE4_98VvLunSc2m4J75YfkCp2Fqm3Fyjb58hYouwRzX_UxVsNKFq2C9xv0zrSTo0fHdtU0tNwgCImCSEpOyblH3oP4ErODwr69Hdzs6PFd0BOBwr0i1_ojW_S4kjEAhIasu7APyOYvUZknABtfzBBB",
        'title': 'UI/UX Inspirations',
        'count': '52 videos',
        'icon': Icons.playlist_play,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Playlists',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      color: Color(0xFFF20D0D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ...playlists.map((playlist) => _buildPlaylistItem(playlist,context)).toList(),
        ],
      ),
    );
  }

  Widget _buildPlaylistItem(Map<String, dynamic> playlist,context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      playlist['thumbnail'] as String,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Icon(
                    playlist['icon'] as IconData,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playlist['title'] as String,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  playlist['count'] as String,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
          ),
        ),
        color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', false),
              _buildNavItem(Icons.explore, 'Explore', false),
              _buildNavItem(Icons.subscriptions, 'Subs', false),
              _buildNavItem(Icons.video_library, 'Library', true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFFF20D0D) : null,
          fill: isActive ? 1.0 : 0.0,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? const Color(0xFFF20D0D) : null,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}