import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/models/subject.dart';
import 'package:school_app/common/models/teacher.dart';
import 'package:school_app/common/resources/theme/colors.dart';

class ClassDetailScreen extends StatefulWidget {
  const ClassDetailScreen({super.key});

  @override
  State<ClassDetailScreen> createState() => _ClassDetailScreenState();
}

class _ClassDetailScreenState extends State<ClassDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Subject? subject;
  int initialTabIndex = 0; // Default to assignments tab

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Get arguments passed from the previous screen
    final arguments = Get.arguments;

    if (arguments != null) {
      if (arguments is Map<String, dynamic>) {
        // New format: Map with subject and initialTab
        try {
          subject = arguments['subject'] as Subject?;
        } catch (e) {
          // Fallback for web reload
          subject = Subject(
            id: 'default',
            name: 'Mathematics',
            teacher: Teacher(
              id: 'teacher1',
              name: 'Dr. Smith',
              avatarUrl: 'https://example.com/avatar.jpg',
              email: 'smith@school.com',
              major: 'Mathematics',
            ),
          );
        }

        // Get the initial tab index
        initialTabIndex = arguments['initialTab'] ?? 0;
      } else if (arguments is Subject) {
        // Old format: Just Subject
        subject = arguments;
        initialTabIndex = 0; // Default to assignments tab
      } else {
        // Fallback for web reload
        subject = Subject(
          id: 'default',
          name: 'Mathematics',
          teacher: Teacher(
            id: 'teacher1',
            name: 'Dr. Smith',
            avatarUrl: 'https://example.com/avatar.jpg',
            email: 'smith@school.com',
            major: 'Mathematics',
          ),
        );
        initialTabIndex = 0;
      }
    } else {
      // Fallback for web reload
      subject = Subject(
        id: 'default',
        name: 'Mathematics',
        teacher: Teacher(
          id: 'teacher1',
          name: 'Dr. Smith',
          avatarUrl: 'https://example.com/avatar.jpg',
          email: 'smith@school.com',
          major: 'Mathematics',
        ),
      );
      initialTabIndex = 0;
    }

    // Set the initial tab after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_tabController.length > initialTabIndex) {
        _tabController.animateTo(initialTabIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),

        elevation: 0,
        centerTitle: true,
        title: Text(
          subject?.name ?? 'Subject',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: AppPalette.textColor,
            indicatorWeight: 5.0, // <-- Add this
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: 'Assignments'),
              Tab(text: 'Grades'),
              Tab(text: 'Resources'),
            ],
          ),
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAssignmentsTab(),
          _buildGradesTab(),
          _buildResourcesTab(),
        ],
      ),
    );
  }

  Widget _buildAssignmentsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            'Upcoming',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppPalette.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          _buildAssignmentTile('Algebra Quiz', 'Due: May 15, 2024', false),
          _buildAssignmentTile('Geometry Project', 'Due: May 20, 2024', false),
          const SizedBox(height: 20),
          Text(
            'Completed',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppPalette.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          _buildAssignmentTile(
            'Calculus Homework',
            'Submitted: May 1, 2024',
            true,
          ),
        ],
      ),
    );
  }

  Widget _buildGradesTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            'Current Grade',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppPalette.primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppPalette.primaryColor, AppPalette.secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Text(
                  'A-',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Overall Grade',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildGradeStat('85%', 'Average'),
                    _buildGradeStat('92%', 'Best'),
                    _buildGradeStat('78%', 'Lowest'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Recent Grades',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppPalette.primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          _buildGradeTile('Algebra Quiz', 'A', '95%', 'May 10, 2024'),
          _buildGradeTile('Geometry Test', 'B+', '87%', 'May 5, 2024'),
          _buildGradeTile('Calculus Assignment', 'A-', '90%', 'April 28, 2024'),
        ],
      ),
    );
  }

  Widget _buildResourcesTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            'Learning Materials',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppPalette.primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          _buildResourceTile(
            'Chapter 5: Linear Algebra',
            'PDF • 2.3 MB',
            Icons.picture_as_pdf,
            Colors.red,
          ),
          _buildResourceTile(
            'Practice Problems Set 3',
            'DOC • 1.1 MB',
            Icons.description,
            Colors.blue,
          ),
          _buildResourceTile(
            'Video: Matrix Operations',
            'MP4 • 15.2 MB',
            Icons.video_library,
            Colors.purple,
          ),
          const SizedBox(height: 24),
          Text(
            'External Links',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppPalette.primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          _buildLinkTile(
            'Khan Academy - Linear Algebra',
            'https://khanacademy.org/linear-algebra',
            Icons.link,
          ),
          _buildLinkTile(
            'MIT OpenCourseWare',
            'https://ocw.mit.edu/math',
            Icons.school,
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentTile(String title, String subtitle, bool isCompleted) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: isCompleted
            ? null
            : () {
                // Navigate to assignment upload screen
                Get.toNamed(
                  '/assignment_upload_Screen',
                  arguments: {
                    'assignmentTitle': title,
                    'assignmentDescription':
                        'Complete the assignment and submit your work.',
                    'dueDate': DateTime.now().add(Duration(days: 7)),
                  },
                );
              },
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isCompleted
                  ? AppPalette.accentColor
                  : AppPalette.secondaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              isCompleted ? Icons.check : Icons.assignment,
              color: Colors.white,
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: AppPalette.primaryColor),
          ),
          trailing: isCompleted
              ? const Icon(Icons.check_circle, color: Colors.green)
              : const Icon(
                  Icons.arrow_forward_ios,
                  color: AppPalette.greyColor,
                  size: 16,
                ),
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
        ),
      ),
    );
  }

  Widget _buildGradeStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.white70)),
      ],
    );
  }

  Widget _buildGradeTile(
    String title,
    String grade,
    String percentage,
    String date,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppPalette.secondaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              grade,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$percentage • $date',
                  style: TextStyle(color: AppPalette.greyColor, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceTile(
    String title,
    String subtitle,
    IconData icon,
    Color iconColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(color: AppPalette.greyColor)),
        trailing: IconButton(
          icon: const Icon(Icons.download, color: AppPalette.primaryColor),
          onPressed: () {
            // Download functionality
          },
        ),
      ),
    );
  }

  Widget _buildLinkTile(String title, String url, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppPalette.accentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppPalette.accentColor, size: 24),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(url, style: TextStyle(color: AppPalette.greyColor)),
        trailing: IconButton(
          icon: const Icon(Icons.open_in_new, color: AppPalette.primaryColor),
          onPressed: () {
            // Open link functionality
          },
        ),
      ),
    );
  }
}
