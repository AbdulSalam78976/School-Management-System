import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class NewConversationScreen extends StatelessWidget {
  const NewConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: AppPalette.accentColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'New Conversation',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            /// Students
            const SectionHeader(title: 'Students'),
            ..._buildUserList([
              User(name: 'Ethan Harper', subtitle: 'Grade 10', image: ''),
              User(name: 'Olivia Bennett', subtitle: 'Grade 11', image: ''),
              User(name: 'Noah Carter', subtitle: 'Grade 9', image: ''),
            ]),

            const SectionHeader(title: 'Teachers'),
            ..._buildUserList([
              User(name: 'Mr. Anderson', image: ''),
              User(name: 'Ms. Rodriguez', image: '8'),
              User(name: 'Mr. Thompson', image: ''),
            ]),

            const SectionHeader(title: 'Staff'),
            ..._buildUserList([
              User(name: 'Ms. Clark', image: ''),
              User(name: 'Mr. Davis', image: ''),
            ]),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildUserList(List<User> users) {
    return users
        .map(
          (user) => ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 4),
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(user.image),
            ),
            title: Text(
              user.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: user.subtitle != null
                ? Text(
                    user.subtitle!,
                    style: TextStyle(color: Colors.teal.shade700),
                  )
                : null,
            onTap: () {
              Get.toNamed(RouteName.chatScreen);
            },
          ),
        )
        .toList();
  }
}

/// Header for each section like "Students", "Parents"
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppPalette.textColor,
      ),
    );
  }
}

/// User model for easier structuring
class User {
  final String name;
  final String? subtitle;
  final String image;

  User({required this.name, this.subtitle, required this.image});
}
