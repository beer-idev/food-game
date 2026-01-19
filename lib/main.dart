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
      home: const LoginPage(),
    );
  }
}

// ================= LOGIN =================
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
          // ===== พื้นหลังไล่สี =====
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF81D4FA), Color(0xFFE1F5FE)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // ===== รูปอาหารลอย =====
          Positioned(
            top: 60,
            left: 20,
            child: Opacity(
              opacity: 0.15,
              child: Image.asset(
                'assets/images/apple.png',
                width: 80,
                errorBuilder: (_, __, ___) => const SizedBox(),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 30,
            child: Opacity(
              opacity: 0.15,
              child: Image.asset(
                'assets/images/milk.png',
                width: 90,
                errorBuilder: (_, __, ___) => const SizedBox(),
              ),
            ),
          ),

          // ===== กล่อง Login =====
          Center(
            child: Container(
              width: 360,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Healthy Plate Game',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'เกมเรียนรู้โภชนาการ 5 หมู่',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  const SizedBox(height: 24),

                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'ชื่อนักเรียน',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ===== ปุ่มมี Animation =====
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
                      duration: const Duration(milliseconds: 120),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                          child: Text(
                            'เริ่มเล่นเกม',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}

// ================= HOME =================
class HomePage extends StatelessWidget {
  final String playerName;

  const HomePage({super.key, required this.playerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(playerName),
        actions: [
          TextButton(
            onPressed: () {                                                                                                           
              Navigator.pop(context);
            },
            child: const Text('Log out', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Image.network(
                'https://image.shutterstock.com/image-vector/five-food-groups-isolated-illustration-260nw-2260307357.jpg',
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 40),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                menuItem(
                  context,
                  Icons.menu_book,
                  'บทเรียน',
                  const LessonPage(),
                ),

                const SizedBox(width: 28),
                menuItem(
                  context,
                  Icons.help_outline,
                  'วิธีการเล่น',
                  const HowToPlayPage(),
                ),
                const SizedBox(width: 28),
                menuItem(context, Icons.games, 'Game', const GamePage()),
                const SizedBox(width: 28),
                menuItem(
                  context,
                  Icons.star,
                  'คะแนน',
                  ScorePage(
                    playerName: playerName,
                    scores: const [80, 90, 100, 70, 85],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================= MENU ITEM =================
Widget menuItem(BuildContext context, IconData icon, String text, Widget page) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 36),
          const SizedBox(height: 6),
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
