import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/custom_appbar.dart';
import 'package:school_app/common/components/custom_drawer.dart';
import 'package:school_app/teacher/screens/screens%20controller/teacher_dashboard_controller.dart';
import 'package:school_app/teacher/data/teacher_drawer_data.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TeacherDashboardController drawerController = Get.put(
      TeacherDashboardController(),
    );

    return Scaffold(
      drawer: Obx(
        () => CustomDrawer(
          userName: 'Ms. Harper',
          userProfileImage: 'assets/images/ms_harper.png',
          items: TeacherDrawerData.getTeacherDrawerItems(drawerController),
          onLogout: () {
            // Handle teacher logout
            Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
      ),
      appBar: CustomAppBar(text: "Dashboard"),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const _GreetingSection(),
                const SizedBox(height: 30),
                const _ActionCardsGrid(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GreetingSection extends StatelessWidget {
  const _GreetingSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Hello James',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Make your day easy with us',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

class _ActionCardsGrid extends StatelessWidget {
  const _ActionCardsGrid();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              _ActionCard(
                color: const Color(0xFFE5DEFF),
                icon: Icons.mic,
                iconBg: const Color(0xFFD1C4E9),
                title: 'Talk with Cooper',
                subtitle: "Let's try it now",
                onTap: () {},
              ),
              const SizedBox(height: 16),
              _ActionCard(
                color: Colors.black,
                icon: Icons.image_search,
                iconBg: Color(0xFF232323),
                title: 'Search by image',
                subtitle: '',
                textColor: Colors.white,
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              Stack(
                children: [
                  _ActionCard(
                    color: const Color(0xFFFFF6D6),
                    icon: Icons.chat_bubble_outline,
                    iconBg: Color(0xFFFFECB3),
                    title: 'New chat',
                    subtitle: '',
                    onTap: () {},
                  ),
                  Positioned(
                    top: 12,
                    right: 18,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'New',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconBg;
  final String title;
  final String subtitle;
  final Color? textColor;
  final VoidCallback onTap;

  const _ActionCard({
    required this.color,
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: textColor ?? Colors.black, size: 28),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.black,
              ),
            ),
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: (textColor ?? Colors.black).withOpacity(0.6),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
