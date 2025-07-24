import 'package:flutter/material.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class TeacherChatScreen extends StatefulWidget {
  const TeacherChatScreen({super.key});

  @override
  State<TeacherChatScreen> createState() => _TeacherChatScreenState();
}

class _TeacherChatScreenState extends State<TeacherChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      "sender": "Ms. Johnson",
      "text":
          "Hi Mr. Davis, I wanted to discuss Sarah’s recent performance in class. She’s been struggling with the math concepts, and I think she could benefit from some extra help. Are you available for a quick chat tomorrow?",
      "isMe": false,
    },
    {
      "sender": "Mr. Davis",
      "text":
          "Hi Ms. Johnson, thank you for reaching out. I’ve noticed Sarah’s difficulties as well. I’m available tomorrow afternoon. Let’s schedule a call to discuss how we can support her better.",
      "isMe": true,
    },
    {
      "sender": "Ms. Johnson",
      "text":
          "That sounds great, Mr. Davis. How about 3 PM? We can go over her progress and explore some strategies to help her catch up.",
      "isMe": false,
    },
    {
      "sender": "Mr. Davis",
      "text":
          "3 PM works perfectly for me. I appreciate your proactive approach in addressing this. Looking forward to our discussion.",
      "isMe": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //  backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Ms. Johnson',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final isMe = msg['isMe'] as bool;

                  return Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          msg['sender'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (!isMe)
                            const CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage(
                                'assets/images/teacher.png',
                              ),
                            ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isMe
                                    ? Colors.lightBlueAccent
                                    : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                msg['text'],
                                style: TextStyle(
                                  color: isMe ? Colors.black : Colors.black87,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (isMe)
                            const CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage(
                                'assets/images/davis.png',
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),

            SendMessageWidget(messageController: _messageController),
          ],
        ),
      ),
    );
  }
}

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({
    super.key,
    required TextEditingController messageController,
  }) : _messageController = messageController;

  final TextEditingController _messageController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Row(
          children: [
            /// Input Box with Icons
            Expanded(
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          style: const TextStyle(fontSize: 15),
                          decoration: const InputDecoration(
                            hintText: "Type a message...",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.attach_file_outlined,
                          color: Colors.grey[700],
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.grey[700],
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            /// Send Button
            Container(
              decoration: BoxDecoration(
                color: AppPalette.secondaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: () {
                  // send message logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
