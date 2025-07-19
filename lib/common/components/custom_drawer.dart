import 'package:flutter/material.dart';
import 'package:school_app/common/models/drawer_model.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String? userProfileImage;
  final List<DrawerModel> items;
  final VoidCallback? onLogout;

  const CustomDrawer({
    super.key,
    required this.userName,
    this.userProfileImage,
    required this.items,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header with profile picture and name
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
              child: Row(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: userProfileImage != null
                        ? AssetImage(userProfileImage!)
                        : null,
                    backgroundColor: userProfileImage == null
                        ? AppPalette.primaryColor
                        : null,
                    child: userProfileImage == null
                        ? Text(
                            userName.isNotEmpty
                                ? userName[0].toUpperCase()
                                : 'U',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 15),
                  // User Name
                  Expanded(
                    child: Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: item.isActive
                          ? AppPalette.secondaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(
                        item.icon,
                        color: item.isActive
                            ? Colors.white
                            : AppPalette.textColor,
                        size: 24,
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: item.isActive
                              ? Colors.white
                              : AppPalette.textColor,
                          fontSize: 16,
                        ),
                      ),
                      onTap: item.onTap,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Logout Button at bottom
            Container(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: AppPalette.errorColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onTap: onLogout,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
