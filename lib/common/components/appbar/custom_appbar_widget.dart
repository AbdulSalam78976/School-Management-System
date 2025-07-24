import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    final AppBarController controller = Get.put(AppBarController());

    return Obx(
      () => AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        centerTitle: true,
        title: Text(
          controller.title.value,
          style: GoogleFonts.bebasNeue(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded),
                onPressed: () {
                  // handle notification tap
                },
              ),
              if (controller.notificationCount.value > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
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
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () => Get.toNamed(RouteName.profileScreen),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: controller.profileImage.value.isEmpty
                    ? Colors.white
                    : Colors.transparent,
                backgroundImage: controller.profileImage.value.isNotEmpty
                    ? AssetImage(controller.profileImage.value)
                    : null,
                child: controller.profileImage.value.isEmpty
                    ? Text(
                        controller.title.value.isNotEmpty
                            ? controller.title.value[0].toUpperCase()
                            : 'U',
                        style: const TextStyle(
                          color: AppPalette.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
