import 'package:flutter/material.dart';

class SubscriptionsScreen extends StatefulWidget {
  const SubscriptionsScreen({super.key});

  @override
  State<SubscriptionsScreen> createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
  int _currentIndex = 1; // Subscriptions is selected

  final List<Map<String, dynamic>> channels = [
    {
      'name': 'All',
      'avatar': '',
      'hasLive': false,
      'isSelected': true,
    },
    {
      'name': 'MKBHD',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuA7jho0sJOUA7iQeiYsisJeN8ZMAieb6jE4zmtwr0CNOjnJqWBjROXExleAVxII9q_TmV7ECHvHQomtr0VlZgEEsRANaEGXDxn_Dq0WhsmS0LoNJQZfGs5JbxyAwN9f7nUZkiWg8CnqTn7ut3EsOqjMY49cX_fl0xWZmjUSNqRpYI48CmlBtTVEkTwznkKQplNQq6QIiHWebiSInjloN5fK3PhxI6LnqCFrnF7QYv3nLBqWD0QlUIBcjSe5ipTAE3q1jNwZBEbm4JAO',
      'hasLive': true,
      'isSelected': false,
    },
    {
      'name': 'G. Ramsay',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAzQC9uB0xrqsPefg5Lqx-Rq3oWdGp2BiUfpnMEJqa1vAUv-4yTszkzAzlwoTGlfXab9ONUdCmY-RghGroWuHjWc1ENUCrVroSCAvcC7vSn1Q3tZOKBY8G_BvtB0C221ICbmaF2w2E9ozhxy4MaI6TFDKGJzW-01irdzq9y9t70joTikX7BeDReFk725nArjdX7Jqpjjx88aXLhcyrOcGXr5MMtG4Cq2kGwQeVEDZiIR_isWOJ5kvGsFW4uVSa-4KE3RgTl6LCwsdrQ',
      'hasLive': false,
      'isSelected': false,
    },
    {
      'name': 'Tasty',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAqC_DKisAFyz-I0vEsu8AAfyKyqH9UIf19N4-CmVTvFPqdFa0wYvsaqEPiT7Xr3_hI5T0srRhRqzdP6pPbCyWAUM8lQZ_9ra7gyMkShYsA5WBeGHF27e4NB-FogwuSX83ln_qb9EYQIIyi8BSKN-aSwmHIjGLsRScbms3o3jGjuB1MVeWC5Pb0TsifNU65-LBRDtIP00xxevJMzfL7Wtrke8vdeNQrXOlXdW39bbeNXKcziiyBNGXGI4rXimcgQoq0l0aHZMvVCbEn',
      'hasLive': true,
      'isSelected': false,
    },
    {
      'name': 'Nat Geo',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCPpiooIa1b3mHXbKaVtjIXLLD2jltckdyAh9q0GTj1vv1eub5B2SEwTWgJkQO4jPsN24l0ez1P-oX3sce1UAhobUErmoS1H27UReh0QnowqNUZey30NcvOMhDZA366As-0gHI6V-pGs15feh-QMzTQVsVZMrEa6IGPMvZ-YT5Ue_twx87q0TBYnuwdN2p6dgWbvTsclWnvEyp9OM07V6g0PwUWKnDnG4Z3wjJN7XS34aaYhMZeRlxJ3FPJwDTTLoNwOMS6bM0IxYKI',
      'hasLive': false,
      'isSelected': false,
    },
    {
      'name': 'MrBeast',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAdlMS-47IzQqdWUDdOHeTclwRZniUEqUb6LROHXEzU12XdT2ucfDNllUfQ236oHYVBM4Fxx7F-hkX5Y9FkPqOEx_eAiS5gD7-VXguqrSV-dJYivjvm-zJ8ZFsVdbAtG2vOo-s0T7jIbRSFjjCUKA2wt8wd9QicNWBlTyjYQEurpEkfWMz4fUxSoNNsJPutqXVBIsb0qZiOnLXRkLl0-1NIioFL_CjPTmVGr4QJPHWER_rG0goRBdKr2e7ByMTNDY0o_2YGvbdBx8zF',
      'hasLive': false,
      'isSelected': false,
    },
    {
      'name': 'Dude Perfect',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDoA706kg2GIwRuYBDpjLLq-egahU81kBJSqW3FXhybSOSNE0V8MITLA60n9Gssd55yTJiAGsOFDWcvMx168FXQmDPcpiQzyfHL3USwZimzeZdibjkBchXzxQEAo6DCoClUOFLBoQ2M9pTRcv2beCLetcdv-yOF7F_k-ypCd_wvphSVDPaXu2fohicIzeSIK_A-KPVFwbuoos2_RwkUZZLJ2MkQWyRT7HCa-tkUKl8ipHMVgIE4MW3udJ98_coVctQoIyQaHKuP8LnC',
      'hasLive': false,
      'isSelected': false,
    },
  ];

  final List<Map<String, dynamic>> videos = [
    {
      'section': 'Today',
      'title': 'Our Most Ambitious Project Yet: The Ultimate Smartphone Review',
      'channel': 'MKBHD',
      'views': '1.2M views',
      'time': '2 hours ago',
      'duration': '14:32',
      'thumbnail':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBL0IEfs4FXkSorGyghTLdFvvrTMxhvdBv-G7g16dpXcZyWOj4lBfuJaLJ39-cvu9STL-3rShVI4MTNCsKm6p0eBiN6Hu_Daf1HXC7zNM-NJC4AMq8CuIyYPuTw57x5T_omMYqqbTZq3aS1cl_v8tuSRE5sA_Z8ufI535uZNy8t06_7zMXQGx2OEB2ezj2CdzI2j1nJlsbkU_KZC747XEJAX0vu-vgUkmEtBDl9HTHxKGdGQZIyl9bnocDohvG3ms78s16nq6ogBvlL',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuB_BtmRV68WzUD3p1zciSxBgMOIldKugTfPjEyu3xIc7VRDkyPuNNVEGqQzzit0v_V7nRALB3QKaecfms23hyTNJ-MypSdCNv5pgoBSCDoMr6iRfRvVL-pb2sy0TpcqyTHiaDBjw34nejJYj3t6vPJFdLBXjU5Gw3bNpEwH0suLkoBIf9QhvDkncyn4QUZxOgpvrdujO1KzvyxycvKB2_xwxfaRez9brSqTscmBLcFXRvDp1Mwx7ktR_YgO_9nC6Po8KOxbLYQ3FKhK',
      'isLive': false,
    },
    {
      'section': 'Today',
      'title': 'The Ultimate Guide to Sourdough for Beginners',
      'channel': 'Tasty',
      'views': '850K views',
      'time': '5 hours ago',
      'duration': '22:15',
      'thumbnail':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDdedImaObZIvJzYzW-FhqNYruhr61Lmoi4FnxLGvX8NOYGHnB9D4lDTSASR9t-Rs4ck9rJg7wG8SuxcLZVTgzLDsyH9vGVEuvZRaHct_UEpx3j39HhUwjJRZFiyqelmUzpkwTvmh0kDuxdplwpZ2LI5Wi9ziOETXgXkckYqKCbhiLKQk0SA6I15LT59g-K61f0bU2zZSRwD9c7SDS7l9Ltb8i4mDOXApBG31rmiAM4Xk4M8rlq6nCCrpwrzSuBl2SjT_ZuCfqZhquw',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCeRYs-DPzSGK2H6KuEFeZ8htGBE90gb5HOU0FbX6acnxHRPaLLyXexvjozaolm0Lw3NFtlHAivfiiLVxVaXEerQl0f1Mx4U1U-cSZyqau89wopyzIgwHqHp6qMXNcrTH9jBwu3MwygyVNrnA5Z1WyanyIPwVaFPhpnURYavmsv1s8bZJo3xtNTiD4fvefbYHDKm00gB8vAv6Es_6FtFcbXUhvhfdmGf4lgVkvv4egjuKnn2WYS6knuxfj6EJCvowtUWxxfI3ebSn57',
      'isLive': false,
    },
    {
      'section': 'Yesterday',
      'title': 'World\'s Longest Surf Ride (World Record)',
      'channel': 'Dude Perfect',
      'views': '5.1M views',
      'time': '1 day ago',
      'duration': '08:41',
      'thumbnail':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuClKuUCasgfBiHZzIbNwEUIn05SFnXT8L9NmtHxUNYGjrPeyk-qMvvsDv6aMvXAR6B6KjzbsLyHRy0hoFCT11rj8uVcM624P0qNTzYSmfKku9vcX68tKQNkeqJI_INGJxC2vs5tlWpoTbkxA225CqLLd80uJgRK3YbGxgaIlCTGCmncuGcVK5Ez2-M_ZRUVBK0tv9pkliXEy9_8mFJOlLcxLKif4t_wQoRrm9mG3kwmj5n1M1J-Wfj6Vz1mVwM1EK1m0NOeMH4KsQfw',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAqZ9bKjer90CpRvQOUawt5BFqfeTgddK3zWSVy2m16R-7lb5OHKZTR14-rFscgp-UORDjl82RYYBNsiW18vgxVP-OXepG0VxVvu18pkdgkLyHIJpmzcMqwV867uoONtOFssSRXQCDCbLxI4PpQvFpA1BTaNVpGY21qW-gGeTYy6l74Do_n73fYpfg7_px1Z6phsDl2eV7GEfxWnJs7ovL4te8oI9b3szpeZ61p9fs0rxAWWGhLipaZghKoYVxLzk6TlYpJ70nBiwmJ',
      'isLive': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.background,
            elevation: 0,
            title: Row(
              children: [
                Icon(
                  Icons.play_circle,
                  color: Theme.of(context).colorScheme.primary,
                  size: 32,
                ),
                const SizedBox(width: 8),
                Text(
                  'Subscriptions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8, left: 4),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[800]
                      : Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ],
          ),

          // Horizontal Channel Scroller
          SliverToBoxAdapter(
            child: SizedBox(
              height:115,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: channels.length,
                itemBuilder: (context, index) {
                  final channel = channels[index];
                  return _buildChannelItem(channel);
                },
              ),
            ),
          ),

          // Video List
          _buildVideoList(),
        ],
      ),

    );
  }

  Widget _buildChannelItem(Map<String, dynamic> channel) {
    final isSelected = channel['isSelected'];

    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Stack(
            children: [
              // Channel Avatar
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: channel['avatar'].isEmpty
                      ? (Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[800]
                      : Colors.grey[200])
                      : null,
                  image: channel['avatar'].isNotEmpty
                      ? DecorationImage(
                    image: NetworkImage(channel['avatar']),
                    fit: BoxFit.cover,
                  )
                      : null,
                  border: isSelected
                      ? Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  )
                      : null,
                ),
                child: channel['avatar'].isEmpty
                    ? Icon(
                  Icons.apps,
                  color: Theme.of(context).colorScheme.onBackground,
                  size: 28,
                )
                    : null,
              ),
              // Live Indicator
              if (channel['hasLive'])
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 64,
            child: Text(
              channel['name'],
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                color: isSelected
                    ? Theme.of(context).colorScheme.onBackground
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoList() {
    String currentSection = '';

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final video = videos[index];
          final bool showSection = currentSection != video['section'];
          currentSection = video['section'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header
              if (showSection)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    video['section'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              // Video Card
              _buildVideoCard(video),
            ],
          );
        },
        childCount: videos.length,
      ),
    );
  }

  Widget _buildVideoCard(Map<String, dynamic> video) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          // Thumbnail
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(video['thumbnail']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Duration Badge
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    video['duration'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              // Live Badge
              if (video['isLive'])
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'LIVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // Video Info
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Channel Avatar
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(video['avatar']),
                ),
                const SizedBox(width: 12),
                // Video Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${video['channel']} • ${video['views']} • ${video['time']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                // More button
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}