import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int _currentIndex = 3; // Library tab is selected

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF221010) : const Color(0xFFf8f5f5),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // Profile Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile Picture
                            CircleAvatar(
                              radius: 48,
                              backgroundImage: NetworkImage(
                                "https://lh3.googleusercontent.com/aida-public/AB6AXuA4psB-LXN8jfXw1Als4T8RaDP53JwL0Ns2I_PMP_DFk1u6IYeleTkFH5PymXx0P1WbWtAhApNyc4PHbMf9EtmM7r7_2viYUOhSuDHJY0kYu84GTaKQ600KPCCIY70qcPUKikwAsj92KbvnwKcOOSOlsmJok50zM-z6KZCtYUq2IwmotwQPGGe97qrf2bbHckBDIR1JTYuwuyAPLIv0pjvD9UlQwz9FYNirV2YWe5fLZGAHITicYMz9CMZQhfpw2nA2QP35eCZQMgmC",
                              ),
                            ),
                            const SizedBox(width: 16),
                            // User Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cody Fisher",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.015,
                                      color: isDark ? Colors.white : const Color(0xFF0f172a),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "@codyfisher",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: isDark
                                          ? const Color(0xFFa3a3a3)
                                          : const Color(0xFF64748b),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Manage Account Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDark
                                  ? const Color(0xFF27272a)
                                  : const Color(0xFFe2e8f0),
                              foregroundColor: isDark ? Colors.white : const Color(0xFF0f172a),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.settings, size: 20),
                                const SizedBox(width: 8),
                                const Text(
                                  "Manage Account",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.015,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Quick Access Chips
                SliverToBoxAdapter(
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildChip(
                          icon: Icons.history,
                          text: "History",
                          isDark: isDark,
                        ),
                        const SizedBox(width: 12),
                        _buildChip(
                          icon: Icons.download,
                          text: "Downloads",
                          isDark: isDark,
                        ),
                        const SizedBox(width: 12),
                        _buildChip(
                          icon: Icons.thumb_up,
                          text: "Liked",
                          isDark: isDark,
                        ),
                        const SizedBox(width: 12),
                        _buildChip(
                          icon: Icons.smart_display,
                          text: "Your videos",
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ),
                ),

                // Recently Watched Section
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recently Watched",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.015,
                                color: isDark ? Colors.white : const Color(0xFF0f172a),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "View all",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFf20d0d),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            _buildVideoCard(
                              imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDLcJLFhGRyPZakqChfPPl2bynfsyCgVT9y479LmG1He4N4Ok7Y_Dn3LTMnAOrjcOU50XFshhcAMzGqgPvf0mGKHu4xxTeM1APYOeMR7NOsadoPs2g16b1ZwDQKCa4DAev5QI2KR5Eq3DXjSKxc9v5Mfi4CUWXSQdJABbp-IXvEmuCD4yLVpHMe1x34y-7jcz0MDLZ6UMPKv5YTlopzdSBBbqix8VQZ7irTMo1phIkVpPNTZQa8vHs_v8gdRaW5m-Kh0mvPZIHrOlTF",
                              title: "The Ultimate UI Design Tutorial",
                              channel: "DesignCode",
                              isDark: isDark,
                            ),
                            const SizedBox(width: 12),
                            _buildVideoCard(
                              imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAWE9_2VESWoKQ8mlDBfB1CTp1sOtRAGejrZrPnm_IZeLfdQTMELqHRPXJZ_hqjth12ghjsOYLFzYNeZtIvnNiVGvG0iSAnJKxf54SgsmKA8Z0sCuhxn4aLfenl-8iiyRVxgjsyII-H2j_SaU9KeuQif3N-nkCMwaz1Aot_iE39l2cBBdYAAB656WMHYftNleoG8ernI4U_j2yMUpIRMZMD6Jc-csVSvl5W8uQa0qzsXn8LqWFS7m0WEyU2hZPCxqbHAsS2rBbIO5hp",
                              title: "How to build a great app",
                              channel: "TechLead",
                              isDark: isDark,
                            ),
                            const SizedBox(width: 12),
                            _buildVideoCard(
                              imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuA2HKPK5E4FTATbL3fRrUmDeYiYVqw6bPkiBkcdWvbRzrv9tWc43H177ngo2sh068Ql-H7qC49fUOo1HWy67udvOxzeZvZt9z1ZsJhoxZHSDb2Yd0cq51TgqDRsBj7dhtmhwlPDvZgTUWPlB_Nwbpajze4bKkEDNgyzQ4zQCoGIdqmh4wx-pNipH_Dc0-1o8BBP2oaR2VtTiHcUuPzdMHl_03sXzyR2gE1S2YcgHzEMFRgyZ6CMK4ytII0Nt1J3O2_zaD7F1q3kvAS7",
                              title: "Figma Advanced Tips",
                              channel: "UX Tools",
                              isDark: isDark,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Playlists Section
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Playlists",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.015,
                                color: isDark ? Colors.white : const Color(0xFF0f172a),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "View all",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFf20d0d),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            _buildPlaylistItem(
                              imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDiV8Z2_lQB1nO3RRAZIL7djXmQX4QbnAUmM20CfOYN4y1RY7fR40wiT47l2ZN9mv4zI56QPN97tbE6vWdrVffJvFRhDu6TXnPLRyQS7GZ_lgNIxo8W4CWZoxWrL0MUMaw6B-zckN_pezWaKkeD3FQ_AVGt3ga8IrmCrftHQfN8skn-8FYI4p2GwATMVcC20i5sEybVL0aJ2zuROpFGJOwJa3cjUdJcS2o5hBdbJlROx_Jayhz-hPLoAHXYbyyMM24g0KH-tGlLMvcr",
                              title: "Watch Later",
                              videoCount: "18 videos",
                              icon: Icons.playlist_play,
                              isDark: isDark,
                            ),
                            const SizedBox(height: 16),
                            _buildPlaylistItem(
                              imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuD5HbR10Vkjjj4fLsZX3_gu2PrJXHpMzrsK2WHmmpfwueyKa-SjBGehuNJJAvpHz59bSSOW8RdarnMilXdoNKkd0XkemzKPmHvb_dKBgYufyBs_HExvrk3ABRZsxQ-aftQYbhmASbpjuBY-tURmOp5H-OjAhjrFVezcUsUPsaa4tex3ht55D5H6BNKSBcHNX-VBdMi178PymnSBWlkkT1CPBspDf-lMrPFvso78p_srMqj4x7_Z6yoV-fMtj68PoMBK1JGc5WYBKAcb",
                              title: "Liked Videos",
                              videoCount: "234 videos",
                              icon: Icons.thumb_up,
                              isDark: isDark,
                            ),
                            const SizedBox(height: 16),
                            _buildPlaylistItem(
                              imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBWTRpS8NtSHuSy4ekoaNiLGknsgV0ejdybNvIlwZU6YOiycsbwF9bdSpK_Znpl0KxbleyLRHiACS7jPkxxry93gMQuV_mPe_0MyBIQVVIlWD6QlDo4Rv4aCBAE4_98VvLunSc2m4J75YfkCp2Fqm3Fyjb58hYouwRzX_UxVsNKFq2C9xv0zrSTo0fHdtU0tNwgCImCSEpOyblH3oP4ErODwr69Hdzs6PFd0BOBwr0i1_ojW_S4kjEAhIasu7APyOYvUZknABtfzBBB",
                              title: "UI/UX Inspirations",
                              videoCount: "52 videos",
                              icon: Icons.playlist_play,
                              isDark: isDark,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20), // Space for bottom navigation
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildChip({
    required IconData icon,
    required String text,
    required bool isDark,
  }) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF27272a) : const Color(0xFFe2e8f0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: isDark ? const Color(0xFFd4d4d4) : const Color(0xFF374151),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white : const Color(0xFF0f172a),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoCard({
    required String imageUrl,
    required String title,
    required String channel,
    required bool isDark,
  }) {
    return SizedBox(
      width: 208,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 117,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white : const Color(0xFF0f172a),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            channel,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? const Color(0xFFa3a3a3) : const Color(0xFF64748b),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaylistItem({
    required String imageUrl,
    required String title,
    required String videoCount,
    required IconData icon,
    required bool isDark,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 128,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Icon(
                  icon,
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
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : const Color(0xFF0f172a),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                videoCount,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? const Color(0xFFa3a3a3) : const Color(0xFF64748b),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}