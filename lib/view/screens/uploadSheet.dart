import 'package:flutter/material.dart';
class Uploadsheet extends StatefulWidget {
  const Uploadsheet({super.key});

  @override
  State<Uploadsheet> createState() => _UploadsheetState();
}

class _UploadsheetState extends State<Uploadsheet> {
  bool _showCreateModal = false;

  void _showModal() {
    setState(() {
      _showCreateModal = true;
    });
  }

  void _hideModal() {
    setState(() {
      _showCreateModal = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          // Create Modal
          if (_showCreateModal) _buildCreateModal(),
        ],
      ),

      // Floating Action Button to trigger modal
      floatingActionButton: FloatingActionButton(
        onPressed: _showModal,
        backgroundColor: const Color(0xFFF20D0D),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }


  Widget _buildCreateModal() {
    return Stack(
      children: [
        // Backdrop
        GestureDetector(
          onTap: _hideModal,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),
        ),

        // Bottom Sheet
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
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
          ),
        ),
      ],
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
            color: Theme.of(context).brightness == Brightness.dark
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
            onPressed: _hideModal,
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).brightness == Brightness.dark
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
      {
        'icon': Icons.movie,
        'title': 'Create a Short',
        'onTap': () {
          _hideModal();
          // Handle create short
        },
      },
      {
        'icon': Icons.upload,
        'title': 'Upload a video',
        'onTap': () {
          _hideModal();
          // Handle upload video
        },
      },
      {
        'icon': Icons.sensors,
        'title': 'Go live',
        'onTap': () {
          _hideModal();
          // Handle go live
        },
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      child: Column(
        children: createOptions.map((option) => _buildListItem(option)).toList(),
      ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> option) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: option['onTap'],
        splashColor: Theme.of(context).brightness == Brightness.dark
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
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[700]
                      : Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  option['icon'],
                  color: Theme.of(context).brightness == Brightness.dark
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
}