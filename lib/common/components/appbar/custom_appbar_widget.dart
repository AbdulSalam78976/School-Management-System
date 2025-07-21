import 'package:flutter/material.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    final AppBarController controller = Get.put(AppBarController());
    return Obx(
      () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

              // Center title
              Center(
                child: Text(
                  controller.title.value,
                  style: GoogleFonts.bebasNeue(
                    color: AppPalette.primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Notification and profile
              Row(
                children: [
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none_rounded),
                        onPressed: () {
                          // Handle notification tap
                        },
                      ),
                      if (controller.notificationCount.value > 0)
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              controller.notificationCount.value.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),

                  CircleAvatar(
                    radius: 22,
                    backgroundColor: controller.profileImage.value.isEmpty
                        ? AppPalette.primaryColor
                        : null,
                    backgroundImage: controller.profileImage.value.isNotEmpty
                        ? AssetImage(controller.profileImage.value)
                        : null,
                    child: controller.profileImage.value.isEmpty
                        ? Text(
                            controller.title.value.isNotEmpty
                                ? controller.title.value[0].toUpperCase()
                                : 'U',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
