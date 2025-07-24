import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/common/screens/settings/profile/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            const SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: controller.pickProfileImage,
                child: Obx(
                  () => CircleAvatar(
                    radius: 80,
                    backgroundImage: controller.profileImage.value != null
                        ? FileImage(controller.profileImage.value!)
                        : const AssetImage('assets/images/teacher.png')
                              as ImageProvider,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Ms. Harper',
                    style: TextStyle(
                      color: AppPalette.textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Teacher',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Account',
              style: TextStyle(
                color: AppPalette.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            CustomTile(
              icon: Icons.email,
              title: 'Email',
              subtitle: 'harper.teacher@email.com',
              onTap: null,
            ),
            CustomTile(
              icon: Icons.lock,
              title: 'Change Password',
              subtitle: '********',
              onTap: () => _showPasswordDialog(controller, context),
            ),
            const SizedBox(height: 20),
            const Text(
              'Personal Information',
              style: TextStyle(
                color: AppPalette.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            CustomTile(
              icon: Icons.person,
              title: 'Name',
              subtitle: 'Ms. Harper',
            ),
            CustomTile(
              icon: Icons.phone,
              title: 'Phone Number',
              subtitle: '+1 (555) 123-4567',
            ),
            CustomTile(
              icon: Icons.location_on,
              title: 'Address',
              subtitle: '123 School St, Anytown',
            ),
          ],
        ),
      ),
    );
  }

  void _showPasswordDialog(ProfileController controller, BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Change Password'),
        content: TextField(
          controller: controller.passwordController,
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Enter new password'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.passwordController.clear();
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => controller.updatePassword(),
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const CustomTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 24, child: Icon(icon)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppPalette.textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
