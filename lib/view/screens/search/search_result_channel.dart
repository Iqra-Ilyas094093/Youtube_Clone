import 'package:flutter/material.dart';

class SearchResultsChannelPage extends StatefulWidget {
  const SearchResultsChannelPage({super.key});

  @override
  State<SearchResultsChannelPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsChannelPage> {

  final List<Channel> channels = [
    Channel(
      name: 'DesignCourse',
      subscribers: '950K subscribers',
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuABTbXD-6WOlbC50v-JzvXUbNQiW9Ff4VZqrfn8U5kqaP_4LnuxiLDJSgBfJCGWtU5RYuaUlvH0YidWNSmeIgu3sgV_Cgqd61d1cPUh7sHBnilkRaH7ZvOWmO39a0HoA2_G78f2xmffMeI9STHqK9H-oyQQIvR5ZimgL6ke5iiXJqHwVD8wkRpWOmOrVCnzJkpE_8VnRLYoAhh8yMw8Nls7U7Bj2FY8ueVZi38zwpu6ruYMV4s0ndOsorihVsC8y8Hiz_DXSZUleYEE',
      isSubscribed: false,
    ),
    Channel(
      name: 'Figma',
      subscribers: '1.5M subscribers',
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDagMUIL1wfpYTN07Cck75BCtGLM4wa8jcLofVoQjOjezUMI9KkJYPicdOMmL7P7MCrVV4fmNiFFxtU6H5qC0rw8K1nVU9x5Eq-PcuviFFD7xSUXwdm5fnBOQJFwz5DxIOy2mKKCXRiObtO2d3HcX-_A00mNC-4UXLXN_mmSKtegqF-YchPtNNKpRXP2bJ7pA2Ox-L6mvJnU2Q1sy7KAOFljDZuFhKcN8wyZw3upxSoze1Hc0VoxPW5q5putw4JvRdFjcC7whzck0Xg',
      isSubscribed: true,
    ),
    Channel(
      name: 'Mizko',
      subscribers: '345K subscribers',
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD8aQRp8510ifevkSVX7puXPFwR_fbEvGRt5u1Dhpr5jncB0TsssMHZzWCr9l78UugItMr-q20mqP7eWis_EpGJUwkrUS1PAJXRzsj2K55de9kc2o62QSYpUOyp7VPbcBT0hmZEEfgxOrin4nU7rlB3JSKvqdiGxuNaI8WYI0DLLitrV3kyoZ8iKafoJ-5EuEEH5rflzrNF8zehhzd6WdyEMy-GbRHRRuHN2IowR5donfmJG39oMnpiPiUDwiiLuGn7XG6NgisKhzN-',
      isSubscribed: false,
    ),
    Channel(
      name: 'Adobe Creative Cloud',
      subscribers: '876K subscribers',
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBkWi_MJT7Ns0PlS0r0Q-OvuWNV-tt_dmwSXL4wd0Ac3Z6pI71EZoibhLBEBKWBBCjCynEkZ2kVlzFZabYbHQqdv4fI6qa7VHYsVCtQQ1wVRRo6ySfJtssHjnB5iMJO85Eqn9w7NxAXkap8rIrZ75s-lMzSdeVzJ4LiBjmyANhQ2tIXlilDRIup7S4OzOkcxyhgoJCqw-rZadiI-2IT-6r86vOGyPgpcxaYuJ6FWnMNnZWsOSemUeXcw3VejXUzF3_L5oBquogztjUb',
      isSubscribed: true,
    ),
    Channel(
      name: 'Sketch',
      subscribers: '210K subscribers',
      avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD6BtIA99080U2TYnkC_eZcySvTQIDQPzm5dWvZt_WrBAQ6QWM31JN6kcq4JTt6d-AIPjd52ZiP-zNnDHTxg9GfAa1P2P4txkWHg8CGiHNkRsEiAkzels8X-GVTHk9Juf7CQUUvCLH8iJKmB-lDaW9t4ez9B9g_UhR-6AvesNKiJ_HZ6PngtiATz-fe9v3b1XFJMe6vIDRpLsF79cu3r91-yiH_WVrwWlWPdcwW8dhaV0diDys4zq_3rbWxTzrmsyVhvpsiQgk1MxXp',
      isSubscribed: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [

        // Channel List
        Expanded(
          child: ListView.builder(
            itemCount: channels.length,
            itemBuilder: (context, index) {
              return _buildChannelItem(channels[index], isDark);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildChannelItem(Channel channel, bool isDark) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Channel Avatar
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(channel.avatarUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Channel Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  channel.name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : const Color(0xFF292524),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  channel.subscribers,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? const Color(0xFFa8a29e) : const Color(0xFF78716c),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Subscribe Button
          SizedBox(
            width: 94,
            height: 36,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  channel.isSubscribed = !channel.isSubscribed;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: channel.isSubscribed
                    ? (isDark ? Colors.white.withOpacity(0.1) : const Color(0xFFe7e5e4))
                    : const Color(0xFFf20d0d),
                foregroundColor: channel.isSubscribed
                    ? (isDark ? Colors.white : const Color(0xFF292524))
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                elevation: 0,
              ),
              child: Text(
                channel.isSubscribed ? "Subscribed" : "Subscribe",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Channel {
  String name;
  String subscribers;
  String avatarUrl;
  bool isSubscribed;

  Channel({
    required this.name,
    required this.subscribers,
    required this.avatarUrl,
    required this.isSubscribed,
  });
}