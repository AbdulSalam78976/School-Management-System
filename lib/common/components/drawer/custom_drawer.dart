import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DrawerControllerCustom>();
    return Obx(
      () => SafeArea(
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white, // Brighter start
                  Color(0xFFE0E0E0),
                ],
              ),
            ),
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
                        backgroundColor:
                            controller.userProfileImage.value.isEmpty
                            ? AppPalette.primaryColor
                            : null,
                        backgroundImage:
                            controller.userProfileImage.value.isNotEmpty
                            ? AssetImage(controller.userProfileImage.value)
                            : null,
                        child: controller.userProfileImage.value.isEmpty
                            ? Text(
                                controller.userName.value.isNotEmpty
                                    ? controller.userName.value[0].toUpperCase()
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
                          controller.userName.value,
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
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      final item = controller.items[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
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
                          onTap: () {
                            controller.setActiveIndex(index);
                            item.onTap();
                          },
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Logout Button at bottom
                Container(
                  padding: const EdgeInsets.all(16),
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
                      onTap: controller.logout,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
