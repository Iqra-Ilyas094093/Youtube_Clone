import 'package:flutter/material.dart';

class ChannelDetailsAboutPage extends StatefulWidget {
  const ChannelDetailsAboutPage({super.key});

  @override
  State<ChannelDetailsAboutPage> createState() => _ChannelDetailsPageState();
}

class _ChannelDetailsPageState extends State<ChannelDetailsAboutPage> {

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Description Section
            _buildSection(
              title: "Description",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to Modern Media, your go-to source for the latest in technology, innovative design, and boundless creativity. We dive deep into the trends and tools shaping our future, offering in-depth reviews, tutorials, and thought-provoking discussions. Whether you're a professional, a student, or just a curious mind, join our community as we explore what's next.",
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: isDark
                          ? const Color(0xFFcbd5e1)
                          : const Color(0xFF475569),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Links Section
            _buildSection(
              title: "Links",
              content: Column(
                children: [
                  _buildLink(
                    icon: Icons.link,
                    text: "modernmedia.io",
                  ),
                  const SizedBox(height: 12),
                  _buildLink(
                    icon: Icons.thumb_up,
                    text: "Follow on Social Media",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Stats Section
            _buildSection(
              title: "Stats",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatItem(
                    label: "Joined:",
                    value: "Aug 15, 2018",
                    isDark: isDark,
                  ),
                  const SizedBox(height: 8),
                  _buildStatItem(
                    label: "Total views:",
                    value: "1,234,567,890",
                    isDark: isDark,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }

  Widget _buildLink({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF94a3b8)
              : const Color(0xFF64748b),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFFf20d0d),
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem({
    required String label,
    required String value,
    required bool isDark,
  }) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? const Color(0xFFe2e8f0) : const Color(0xFF374151),
            ),
          ),
          TextSpan(
            text: " $value",
            style: TextStyle(
              fontSize: 14,
              color: isDark ? const Color(0xFFcbd5e1) : const Color(0xFF475569),
            ),
          ),
        ],
      ),
    );
  }
}