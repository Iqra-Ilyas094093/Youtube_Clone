import 'package:flutter/material.dart';
import 'package:youtube_clone/view/screens/home_screen.dart';
import 'package:youtube_clone/view/screens/library_screen.dart';
import 'package:youtube_clone/view/screens/screens.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<Widget> screens = [
    HomeScreen(),
    ShortsScreen(),
    SubscriptionsScreen(),
    LibraryPage(),
  ];
  int _currentIndex = 0;
  int _navbar =0;

  void _showModelSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle
              _buildHandle(),

              // Header
              _buildHeader(),

              // List Items
              _buildListItems(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHandle() {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Center(
        child: Container(
          width: 36,
          height: 4,
          decoration: BoxDecoration(
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[600]
                    : Colors.grey[300],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Create',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[700]!.withOpacity(0.5)
                      : Colors.grey[200]!.withOpacity(0.5),
              shape: const CircleBorder(),
            ),
            icon: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItems() {
    final List<Map<String, dynamic>> createOptions = [
      {'icon': Icons.movie, 'title': 'Create a Short'},
      {'icon': Icons.upload, 'title': 'Upload a video'},
      {'icon': Icons.sensors, 'title': 'Go live'},
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      child: Column(
        children:
            createOptions.map((option) => _buildListItem(option)).toList(),
      ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> option) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.white.withOpacity(0.05)
                : Colors.grey[100],
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[700]
                          : Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  option['icon'],
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[100]
                          : Colors.grey[800],
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  option['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navbar,
        onTap: (index) {
          if (index == 2) {
            _showModelSheet(context);
            return;
          } else {
            setState(() {
              _navbar=index;
              _currentIndex = index > 2 ? index - 1 : index;
            });
          }
        },

        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
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
