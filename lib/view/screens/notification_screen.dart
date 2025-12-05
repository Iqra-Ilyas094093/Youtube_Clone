import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            _buildAppBar(context),
            // Notifications Feed
            Expanded(
              child: _buildNotificationsFeed(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Back Button
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 48,
              height: 48,
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
          // Title
          Expanded(
            child: Text(
              'Notifications',
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.0,
                letterSpacing: -0.015,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Settings Button
          Container(
            width: 48,
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsFeed(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section: Today
          _buildSectionHeader(context, 'Today'),
          _buildTodayNotifications(context),

          // Section: This Week
          _buildSectionHeader(context, 'This Week'),
          _buildThisWeekNotifications(context),

          // Section: Earlier
          _buildSectionHeader(context, 'Earlier'),
          _buildEarlierNotifications(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          height: 1.0,
          letterSpacing: -0.015,
        ),
      ),
    );
  }

  Widget _buildTodayNotifications(BuildContext context) {
    return Column(
      children: [
        // New Upload Notification
        _buildVideoNotification(
          context: context,
          isHighlighted: true,
          thumbnailUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDTcK7th4tCnjUXhim7KndvZEn0C-FBJVVcPjlonZwktY0OOXWHLrfqePYxIh7D1Cd9_2udqaZk52NaywgDy1vb_U9CA2QTePkXalU5n2ByrTj4COE1VHuEVyzD_vLP3-SPDz1MoiQdbc5fbYeyyQW5J5l3_qIFzFG52guHWQl29XK26NHnsDVNbMdrEEo26h_93TJUtktHMv-L-Eo-9LVlHs-HhDVEMZYZUqN98K2ZjJWDQnUXJ6c9aVy0y6LURDFDxMBvqwbrb6j4",
          title: "TechGuru uploaded: The Future of Foldables is Here!",
          time: "1 hour ago",
          hasPlayIcon: true,
          hasUnreadDot: true,
        ),

        // Comment Reply Notification
        _buildProfileNotification(
          context: context,
          profileUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBoxkR57koM6qKNJk1J392NtagwFRnUun7gfGDfFEnm1DG2KHxv2qpcnzEFFiJae_9te2-2tcdifF7j7wQNMiZ-YG8qxgGAGNe5R_dPLOGJv5RtPUy8z133s7BKoLws6ARhUfKJvQ6jcDj1OMJIMU9BNddhFjYIRshRsmA6BeukzFDbL_A4WcvZlKNYL_xXLolj7OAfB_bLNkKjjfL9BRrj0McsUsmM_Zt_XjIH5h0G1xNMtTmhisTJ0t2GfxlmBcuispe1akENRtmh",
          title: "Sarah Chen replied: \"Completely agree, the hinge mechanism looks so much better.\"",
          time: "3 hours ago",
          icon: Icons.chat,
          hasMoreOptions: true,
        ),

        // Like Notification
        _buildProfileNotification(
          context: context,
          profileUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCNzHkwrlmcrJrY-crvdtOIKc25cnCyZbkKkm3iOHGD1KVvjkUyFNgkE8uzZ7PajzIUB_93PAd1i6-DatqfrKsVQJaMuks0jGNI7XqyJE-0boJhhQTkzccTPRrNSF2PF1xbG2To5Dk9EpRCq48MkLJjb1-C7N02tkBXzfimRQFND2zIKxSsEHvZ6fuumCK5F6wShH7GWs6VNnod8kvs-E9cXsIQEUBhwDTeZN2u3Pd0kW0m_U5cVy3U5jtoMZwvJSyg0lwyA6H2aalm",
          title: "Alex Johnson and 5 others liked your comment: \"Can't wait to see the battery test!\"",
          time: "5 hours ago",
          icon: Icons.favorite,
          hasMoreOptions: true,
        ),
      ],
    );
  }

  Widget _buildThisWeekNotifications(BuildContext context) {
    return Column(
      children: [
        // New Upload Notification
        _buildVideoNotification(
          context: context,
          isHighlighted: false,
          thumbnailUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuD6_PilaxhzQL0zlvvi95up3KLpjgod4fVWqjyTT-qfA95jmLRYYsG6RwbulGJ9jLDV_SGuNWIzzy7gFcWsRpLExVj9KpLtx_wFs6qGanOJbY-Pf4n-Nyjg5lwhh4mMllhit6C7OuNU6_KZ5AFyqCM-eU6hZIgeuJXozMj3x-2bj_5fTqIpeBX9mbjDygUWXRi-BNj6CJrha5ODjspLpl2mx261MzjjzbyWz5vvYsw7_-DMr1jbnI-vCI-EF8I7ngW49ptQSfoB00rs",
          title: "Wanderlust Matt uploaded: My Most EPIC Trip Yet - 10 Days in Patagonia",
          time: "2 days ago",
          hasPlayIcon: false,
          hasMoreOptions: true,
        ),

        // Mention Notification
        _buildProfileNotification(
          context: context,
          profileUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDuV66ltgJyqUrnY5UqgS7SAZralevObDRCp0YfQ16AJ5YeivRtdKR8E90hLkdwDa9Bfh1CgLPKQMHSxtW1PrULSYQ0upxjh_liWiIoNK8P1CL_YV3VMt6CYrxyjY3CW6iJSfcODIyigLPAYvVOh923eIkje2I8kTz7mDWitCURPXnQ92wzE2-qh2zm5zWNT-ICWuMkj2-Ppa1Soz0D7uG_MWXK7NK06IBK7TZr28a2-PTphFXk0gb2xPj-FlUg_hGixJ7voLI3DbnY",
          title: "You were mentioned in a comment on 15-Minute Meals: Quick & Easy Pasta",
          time: "4 days ago",
          icon: Icons.alternate_email,
          hasMoreOptions: true,
        ),
      ],
    );
  }

  Widget _buildEarlierNotifications(BuildContext context) {
    return Column(
      children: [
        // New Comment Notification
        _buildProfileNotification(
          context: context,
          profileUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCavcyxI5LdXAGlB7412X4N2OQh2hrYfHYvF6dcpQkKF0u8m6PpVFPTLymQcx3Mv-35KFyD8oVY0fe8H17HcvdccBkVKCwalhgIzGMyWfoTKmcsFc-A1vSCb9oKi79YDD4NJ5fPCgFTncaleQ4Mzeim51-lyxcWj_c_KLRjUBli1UHZlxYc4eHO_ubuEt_8XY3zHP10WU9uYJbBqqhpRypGSEZmpcmpbRbMZU0lCIdYDV7UVDNCfxWK7oRa27ZaA2dvWFyOElhLi8f-",
          title: "David Lee commented: \"Awesome video, this was super helpful for my own project!\"",
          time: "2 weeks ago",
          hasMoreOptions: true,
        ),
      ],
    );
  }

  Widget _buildVideoNotification({
    required BuildContext context,
    required bool isHighlighted,
    required String thumbnailUrl,
    required String title,
    required String time,
    bool hasPlayIcon = false,
    bool hasUnreadDot = false,
    bool hasMoreOptions = false,
  }) {
    return Container(
      color: isHighlighted
          ? Color(0xFFf20d0d).withOpacity(0.1)
          : Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 112,
                      height: 63,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(thumbnailUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (hasPlayIcon)
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Color(0xFFf20d0d),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        time,
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey[400]
                              : Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Right side indicator
          if (hasUnreadDot)
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Color(0xFF065FD4),
                shape: BoxShape.circle,
              ),
            )
          else if (hasMoreOptions)
            Icon(
              Icons.more_vert,
              color: Colors.grey[500],
            ),
        ],
      ),
    );
  }

  Widget _buildProfileNotification({
    required BuildContext context,
    required String profileUrl,
    required String title,
    required String time,
    IconData? icon,
    bool hasMoreOptions = false,
  }) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      constraints: BoxConstraints(minHeight: 72),
      child: Row(
        children: [
          // Profile Picture
          Stack(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(profileUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (icon != null)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color(0xFFf20d0d),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[400]
                        : Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          // More options
          if (hasMoreOptions)
            Icon(
              Icons.more_vert,
              color: Colors.grey[500],
            ),
        ],
      ),
    );
  }
}