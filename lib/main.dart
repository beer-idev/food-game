import 'package:flutter/material.dart';
import 'game_page.dart';
import 'lesson_page.dart';
import 'how_to_play_page.dart';
import 'score_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthy Plate Game',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF69B4)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// ================= 1. LOGIN PAGE (Princess Style) =================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFD1DC),
                  Color(0xFFFFF5F7),
                  Color(0xFFE1F5FE),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -50,
            child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.white.withOpacity(0.5),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFFFD700),
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pinkAccent.withOpacity(0.2),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.auto_awesome_rounded,
                      size: 80,
                      color: Color(0xFFFF69B4),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color(0xFFFFD1DC),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.1),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Healthy Quest',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF1493),
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'เริ่มต้นการผจญภัยอาหาร 5 หมู่',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.pink.shade300,
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextField(
                          controller: nameController,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF1493),
                          ),
                          decoration: InputDecoration(
                            hintText: 'กรอกชื่อนักเรียน...',
                            filled: true,
                            fillColor: Colors.pink.withOpacity(0.05),
                            prefixIcon: const Icon(
                              Icons.star_border_purple500,
                              color: Color(0xFFFF69B4),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTapDown: (_) => setState(() => isPressed = true),
                          onTapUp: (_) {
                            setState(() => isPressed = false);
                            if (nameController.text.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(playerName: nameController.text),
                                ),
                              );
                            }
                          },
                          child: AnimatedScale(
                            scale: isPressed ? 0.95 : 1.0,
                            duration: const Duration(milliseconds: 100),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFFF69B4),
                                    Color(0xFFFF1493),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink.withOpacity(0.4),
                                    blurRadius: 15,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'เข้าสู่ระบบ!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'กินให้ครบ 5 หมู่ เพื่อสุขภาพที่แข็งแรง',
                    style: TextStyle(
                      color: Colors.pink.shade400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= 2. HOME PAGE (Princess Style - Elegant Text Edition) =================
class HomePage extends StatelessWidget {
  final String playerName;
  const HomePage({super.key, required this.playerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFF5F7), Color(0xFFFFD1DC)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'พร้อมลุยหรือยัง?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.pink.shade400,
                            ),
                          ),
                          Text(
                            'สวัสดี $playerName!',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF1493),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.pink.shade100),
                        ),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.logout_rounded,
                            color: Color(0xFFFF69B4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // --- ส่วนที่เปลี่ยนจากกล่องข้อความ มาเป็นกล่องปราสาทเปล่าๆ ---
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF69B4), Color(0xFFFFB6C1)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    // ใช้ Center เพื่อให้ไอคอนอยู่ตรงกลางพอดีเพคะ
                    child: const Center(
                      child: Icon(
                        Icons.castle_rounded, // ไอคอนปราสาท
                        size: 120, // ปรับขนาดให้ใหญ่จุใจ
                        color: Colors.white, // สีขาวเข้าธีม
                      ),
                    ),
                  ),
                ),

                // --------------------------------------------------------
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 30,
                    left: 20,
                    right: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: const Color(0xFFFFD700).withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      menuItem(
                        context,
                        Icons.menu_book_rounded,
                        'บทเรียน',
                        const LessonPage(),
                        const Color(0xFFFF1493),
                      ),
                      menuItem(
                        context,
                        Icons.auto_fix_high_rounded,
                        'วิธีเล่น',
                        const HowToPlayPage(),
                        const Color(0xFFFF1493),
                      ),
                      menuItem(
                        context,
                        Icons.favorite_rounded,
                        'เริ่มเกม',
                        const GamePage(),
                        const Color(0xFFFF1493),
                      ),
                      menuItem(
                        context,
                        Icons.workspace_premium_rounded,
                        'คะแนน',
                        ScorePage(
                          playerName: playerName,
                          scores: const [100, 90],
                        ),
                        const Color(0xFFFFD700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(
    BuildContext context,
    IconData icon,
    String text,
    Widget page,
    Color color,
  ) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color.withOpacity(0.3), width: 1.5),
            ),
            child: Icon(icon, size: 30, color: color),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.pink.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
