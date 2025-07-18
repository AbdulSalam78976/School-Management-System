import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Drawer button
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),

            // Notification and profile
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  color: Colors.grey[700],
                  onPressed: () {
                    // Handle notification tap
                  },
                ),
                const SizedBox(width: 8),
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
