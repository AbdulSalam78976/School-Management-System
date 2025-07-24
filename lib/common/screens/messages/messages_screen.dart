import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/screens/messages/messages_controller.dart';
import 'package:school_app/common/screens/messages/new_conversation_screen.dart';

class TeacherMessagesScreen extends StatefulWidget {
  const TeacherMessagesScreen({super.key});

  @override
  State<TeacherMessagesScreen> createState() => _TeacherMessagesScreenState();
}

class _TeacherMessagesScreenState extends State<TeacherMessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TeacherMessagesController>();

    final List<Map<String, String>> messages = [
      {"name": "Ms. Johnson", "message": "See you tomorrow!", "avatar": ""},
      {
        "name": "Parents of Alex",
        "message": "Reminder: Parent-teacher conference next week.",
        "avatar": "",
      },
      {
        "name": "Class 7A",
        "message": "Math assignment due Friday.",
        "avatar": "",
      },
      {
        "name": "School Staff",
        "message": "Meeting at 3 PM today.",
        "avatar": "",
      },
      {
        "name": "Mr. Davis",
        "message": "Can we reschedule our meeting?",
        "avatar": "",
      },
    ];
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              /// Search Bar
              const TextField(
                decoration: InputDecoration(
                  hintText: "Search messages or contacts",
                  // border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Messages List
              Expanded(
                child: ListView.separated(
                  itemCount: messages.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(msg['avatar']!),
                      ),
                      title: Text(
                        msg['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        msg['message']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      onTap: () {
                        // Navigate to conversation screen
                        Get.toNamed(
                          RouteName.teacherChatScreen,
                          arguments: {
                            'sender': 'You',
                            'receiver': msg['name']!,
                          },
                        );
                      },
                      trailing: Text(
                        '2:30 PM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      /// Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(NewConversationScreen());
        },

        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
