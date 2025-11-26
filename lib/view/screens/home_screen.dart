import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> categories = [
    'All',
    'Music',
    'Gaming',
    'Live',
    'Trending',
    'Podcasts'
  ];

  final List<Map<String, dynamic>> videos = [
    {
      'title': 'Designing the Future of UI/UX',
      'channel': 'TechFlow',
      'views': '1M views',
      'time': '2 days ago',
      'duration': '08:32',
      'thumbnail':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBQlb7CR9DMKHcXp40P8ruu2NlUtWYUb2DOaqmqXve58cCwigN9JbIEewcIMF0RRkFMriwtvlqcwE1fcZSA8WBC4h1-3qXWYIL8PyNvko3Rf39G4ZSaSCuqKm5REJu24TZA2KYPXH6l-N_QCIFB1SxNhz2iD-Ja4nX9IUjRjgjUCFkZuBhaEnJH-F5BtQAJlItIuVmMM4A76SoNzfhatJrEAZsy0AnM66KNV72xhj2q8NYfGJnlTfVMdSSmlBeUioKrngoC3MHWW3GS',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAmc0uJDl-N75ndILTg-Bt49tBx4290X70m-XFgTG9XlBH1ilGUOSoe81QbMTFtCCQWe5QHL2nbuMN-b7Fn-CkHYrwU6vaLKjdJMsaAajdKmoC5wVOuBkfLWMGSSPuM3QxUfCc6WEwJsARSOzKUBtaRvkMDG_b4mHhRPnRp95G-92ROt0wr91YdqyM9gtoFbO4o568QfDdD20U4enExpLZTlwKIsK9bkxSg5vrPYSnwdgNPH0S2xXhzR1Mcigcz84FJEv9cR3MrgXkm',
    },
    {
      'title': 'Ultimate Travel Guide to Japan',
      'channel': 'Wanderlust Travels',
      'views': '2.5M views',
      'time': '1 week ago',
      'duration': '15:45',
      'thumbnail':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBKQXuJ_KrkDOoLSiS-AbWV8SMNR-cAIAiZ-vcZQqIe94sODy9wSMlf39diZRlhix1q79Mz7X06Rg7JrOjvadnva0rt1sZsnwd-eEaFIavw7hBVY03wmsnY3kIQOxpNfJcZiH1cTWzSB6L6m-ZtZCTCLl1O-n2DEyrgr5FigycdjvzmXtpxzaIypXcCwFBq4JHX_k0Sek3PO9yH2CT5sDlzHrp9RR7ouT1WUcHRLOrmzYSmiowT-_CbniHQzVx_KfbS7qnj76Vmp7cg',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDft5vBKX11vT6pkGARzn0hhZ5A8zYT7wqeGY-JvwvjfrPP3ZQwg3Sy_VCjrqdjjmoQomzdJymKJR23oNf1Kgj7uAV28sUed6ySJisu6MkTXHge9JUwO-GX33WzV24PJ3oeixNdcc8jbrl_xVCkQqlC7-9uYTenSeQ5zReCdeT_wpA1YY8wOsWMmYpqCh9e05rwty8uq1e-kt8vbQHNJIyMe3VJald_CC-R7urptN5H7_bj7G7ipfFF0FzzvHJc10dm-PyEJD3hAEjf',
    },
    {
      'title': '10 Minute HIIT Workout - No Equipment',
      'channel': 'FitLife',
      'views': '500K views',
      'time': '3 days ago',
      'duration': '10:15',
      'thumbnail':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAz3lFCEABQEXtn4TS6EO4yYqYseqBWMiElfcq2T2ONuFhypVtBJJqbw14BqIRcAc3frIb98TpnuDwta2wdiyC-J04NLqBXMtTJKAx05MUVBXTezy8K7rwFLrS5GpAp3_KYdMeS9CYMaxs4W6NSqMRQfKHQB8Iap2wpDs1EaJP5p8v2YUr6DMCMTKxWO0gT7MB7n4IyjGE_OwKSMuZSs7D8vCSFm2s85WwJdfLOg-sFhgh3EDA84RJtenM1y9KHtoXmMveVqkfk8D-o',
      'avatar':
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAjCGiOmTsPsOdwlmNIIq3PtNreo2FUMMYoMsv7EqNhIsALGjIdUXKrwz2detPhQe1QTXhf-w2e9P3TFezeV9t2u2aVFegkF0zsaVmmbI-3tiTKd0a_98EECTr611mRpvGgeFWbj8_Sb_0sWbqmpnBji5GCdW6D2nxIrvvzcjeGH2esSc0pc2YaCj5uLoq62iHoKkgIWkQMBjAuUlxa337BWrEmhJH0_Bn4oySUSOxzKsXFnKQ3X9it_N3sxQ88fMXZBOA5aVRoU6bk',
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
            floating: true,
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
                  'YT Clone',
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
                icon: const Icon(Icons.cast),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8, left: 4),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'M',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Categories/Chips
          SliverToBoxAdapter(
            child: SizedBox(
              height: 56,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = index == 0;
                  return Container(
                    margin: const EdgeInsets.only(right: 12, top: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onBackground
                          : Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? Theme.of(context).colorScheme.background
                              : Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Video List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final video = videos[index];
                return VideoCard(video: video);
              },
              childCount: videos.length,
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final Map<String, dynamic> video;

  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          // Thumbnail
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(video['thumbnail']),
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
                    video['duration'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Video Info
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
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
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                  icon: const Icon(Icons.more_vert),
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