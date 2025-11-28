import 'package:flutter/material.dart';

class ChannelDetailsCommunityScreen extends StatefulWidget {
  const ChannelDetailsCommunityScreen({super.key});

  @override
  State<ChannelDetailsCommunityScreen> createState() => _ChannelDetailsScreenState();
}

class _ChannelDetailsScreenState extends State<ChannelDetailsCommunityScreen> {

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        _buildCommunityPost1(),
        _buildCommunityPost2(),
        _buildCommunityPost3(),
      ]),
    );
  }

  Widget _buildCommunityPost1() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[700]!
              : Colors.grey[300]!,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuBj4K8WabxWOZfx5RaW0uYezj6sJwn3wrSfflhkCdD1Xeoi-Vco0Zw11SP4n9vXTqX0ZzdzqKPH58qPg12ITL_jh1-isih_KohI8K60kXD-RqIMo9MSHw9f9WZ8hEyayg8TAQhxb61Cdcy4l_aeKMBIgw88irTrmFBFTOiMA5jPRpvxA5qhIvPJ58PDdJG7ETScgFI2QqqlP8Nq-d7t71woF6CL8wQCe1gF_Q9-HchGa1051OoVwSkONFVqopxc9-jDpXSl3jcd50H_",
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modern Media',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          '2 days ago',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Post Content
            Text(
              "Just wrapped up filming our most ambitious project yet! We can't wait to share it with you all. What are you most excited to see from us next?",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            // Post Actions
            Row(
              children: [
                _buildActionButton(Icons.thumb_up, '1.2K'),
                const SizedBox(width: 16),
                _buildActionButton(Icons.thumb_down, ''),
                const SizedBox(width: 16),
                _buildActionButton(Icons.comment, '88'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityPost2() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[700]!
              : Colors.grey[300]!,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuBj4K8WabxWOZfx5RaW0uYezj6sJwn3wrSfflhkCdD1Xeoi-Vco0Zw11SP4n9vXTqX0ZzdzqKPH58qPg12ITL_jh1-isih_KohI8K60kXD-RqIMo9MSHw9f9WZ8hEyayg8TAQhxb61Cdcy4l_aeKMBIgw88irTrmFBFTOiMA5jPRpvxA5qhIvPJ58PDdJG7ETScgFI2QqqlP8Nq-d7t71woF6CL8wQCe1gF_Q9-HchGa1051OoVwSkONFVqopxc9-jDpXSl3jcd50H_",
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modern Media',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          '1 week ago',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Post Content
            Text(
              "Quick poll: What type of content should we make more of?",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            // Poll Options
            _buildPollOption('In-depth Tech Reviews', 65),
            const SizedBox(height: 8),
            _buildPollOption('Behind-the-Scenes Vlogs', 25),
            const SizedBox(height: 8),
            _buildPollOption('Tutorials & How-Tos', 10),
            const SizedBox(height: 12),
            Text(
              '21K votes',
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 16),
            // Post Actions
            Row(
              children: [
                _buildActionButton(Icons.thumb_up, '5.8K'),
                const SizedBox(width: 16),
                _buildActionButton(Icons.thumb_down, ''),
                const SizedBox(width: 16),
                _buildActionButton(Icons.comment, '432'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityPost3() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[700]!
              : Colors.grey[300]!,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuBj4K8WabxWOZfx5RaW0uYezj6sJwn3wrSfflhkCdD1Xeoi-Vco0Zw11SP4n9vXTqX0ZzdzqKPH58qPg12ITL_jh1-isih_KohI8K60kXD-RqIMo9MSHw9f9WZ8hEyayg8TAQhxb61Cdcy4l_aeKMBIgw88irTrmFBFTOiMA5jPRpvxA5qhIvPJ58PDdJG7ETScgFI2QqqlP8Nq-d7t71woF6CL8wQCe1gF_Q9-HchGa1051OoVwSkONFVqopxc9-jDpXSl3jcd50H_",
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modern Media',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          '2 weeks ago',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Post Content
            Text(
              "A little sneak peek from our trip to Tokyo. Full video coming soon!",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            // Image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuBTj6SfRDAs98bX3bEpE3NY4rIDzGa7a3DsBpKtR8YDmzWwi9h2P3Qfa6coEosvQOxbfoHVYH_jsXd2cgNgAGtI5l-PWo7oud5cNukP7cfYnGcRQNX9DSlvx-19LxDEGR25ETxw56o2LS07yVm0ubUEwSz5J5oFrvHBfhNhuDWLq1Ka3xPl8sm3yjzWUuHXVDDuuEyMkAl6M4pwTME3ExW4H8q_tuMBhRO7AuVjlBkgd5z8N73OiKdujHJvcMU7IGTfDKdhIgkcipKi",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Post Actions
            Row(
              children: [
                _buildActionButton(Icons.thumb_up, '9.1K'),
                const SizedBox(width: 16),
                _buildActionButton(Icons.thumb_down, ''),
                const SizedBox(width: 16),
                _buildActionButton(Icons.comment, '615'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String count) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
          iconSize: 20,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        if (count.isNotEmpty)
          Text(
            count,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
      ],
    );
  }

  Widget _buildPollOption(String option, int percentage) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[600]!
              : Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Progress bar
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[700]!
                  : Colors.grey[200]!,
            ),
            child: FractionallySizedBox(
              widthFactor: percentage / 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[600]!
                      : Colors.grey[300]!,
                ),
              ),
            ),
          ),
          // Text content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  option,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '$percentage%',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}