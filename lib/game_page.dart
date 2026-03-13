import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'score_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int currentQuestion = 0;
  int timeLeft = 60;
  Timer? timer;

  List<String> selectedFoods = [];
  List<int> scorePerQuestion = [];
  List<Map<String, dynamic>> shuffledFoods = [];

  // ข้อมูลวัตถุดิบ (คงเดิม)
  final List<Map<String, dynamic>> foods = [
    {'name': 'ไก่', 'group': 1, 'icon': '🍗'},
    {'name': 'หมู', 'group': 1, 'icon': '🥩'},
    {'name': 'ปลา', 'group': 1, 'icon': '🐟'},
    {'name': 'ไข่', 'group': 1, 'icon': '🥚'},
    {'name': 'กุ้ง', 'group': 1, 'icon': '🦐'},
    {'name': 'ข้าว', 'group': 2, 'icon': '🍚'},
    {'name': 'ขนมปัง', 'group': 2, 'icon': '🍞'},
    {'name': 'น้ำมันพืช', 'group': 3, 'icon': '🛢️'},
    {'name': 'เนย', 'group': 3, 'icon': '🧈'},
    {'name': 'บรอกโคลี', 'group': 4, 'icon': '🥦'},
    {'name': 'แครอท', 'group': 4, 'icon': '🥕'},
    {'name': 'ผักบุ้ง', 'group': 4, 'icon': '🥬'},
    {'name': 'แอปเปิ้ล', 'group': 5, 'icon': '🍎'},
    {'name': 'กล้วย', 'group': 5, 'icon': '🍌'},
    {'name': 'ส้ม', 'group': 5, 'icon': '🍊'},
    {'name': 'แตงโม', 'group': 5, 'icon': '🍉'},
    {'name': 'สับปะรด', 'group': 5, 'icon': '🍍'},
  ];

  // คำถาม (คงเดิม)
  final List<Map<String, dynamic>> questions = [
    {
      'text': 'เลือกวัตถุดิบหมู่ที่ 1 (โปรตีน)',
      'groups': [1],
    },
    {
      'text': 'เลือกวัตถุดิบหมู่ที่ 2 (คาร์โบไฮเดรต)',
      'groups': [2],
    },
    {
      'text': 'เลือกวัตถุดิบหมู่ที่ 3 (ไขมัน)',
      'groups': [3],
    },
    {
      'text': 'เลือกวัตถุดิบหมู่ที่ 4 (วิตามิน)',
      'groups': [4],
    },
    {
      'text': 'เลือกวัตถุดิบหมู่ที่ 5 (เกลือแร่)',
      'groups': [5],
    },
    {
      'text': 'เมนู: ข้าวปลาแซลมอนย่าง + ผักสลัด + ส้ม',
      'foods': ['ปลา', 'ข้าว', 'บรอกโคลี', 'ส้ม'],
    },
    {
      'text': 'เมนู: ข้าวผัดไข่ใส่ผัก + ไก่ฉีก + แตงโม',
      'foods': ['ข้าว', 'ไข่', 'ไก่', 'ผักบุ้ง', 'แตงโม'],
    },
    {
      'text': 'เมนู: ข้าวราดแกงเขียวหวานไก่ + ผักสด + สับปะรด',
      'foods': ['ข้าว', 'ไก่', 'บรอกโคลี', 'สับปะรด'],
    },
    {
      'text': 'เมนู: ข้าวหน้าหมูผัดเทริยากิ + ผักลวก + กล้วย',
      'foods': ['ข้าว', 'หมู', 'ผักบุ้ง', 'กล้วย'],
    },
    {
      'text': 'เมนู: ข้าวหน้าไก่นึ่งซีอิ๊ว + ผักรวม + แอปเปิ้ล',
      'foods': ['ข้าว', 'ไก่', 'บรอกโคลี', 'แอปเปิ้ล'],
    },
  ];

  @override
  void initState() {
    super.initState();
    shuffleFoods();
    startTimer();
  }

  void shuffleFoods() {
    shuffledFoods = List<Map<String, dynamic>>.from(foods);
    shuffledFoods.shuffle(Random());
  }

  void startTimer() {
    timer?.cancel();
    timeLeft = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          t.cancel();
          checkAnswer();
        }
      });
    });
  }

  void toggleFood(String food) {
    setState(() {
      selectedFoods.contains(food)
          ? selectedFoods.remove(food)
          : selectedFoods.add(food);
    });
  }

  void checkAnswer() {
    timer?.cancel();
    int score = 0;
    final q = questions[currentQuestion];

    if (q.containsKey('groups')) {
      final selectedGroups = selectedFoods
          .map((f) => foods.firstWhere((e) => e['name'] == f)['group'])
          .toSet();
      score = selectedGroups.contains(q['groups'][0]) ? 100 : 0;
    } else {
      final correctFoods = q['foods'] as List<String>;
      final correctCount = selectedFoods
          .where((f) => correctFoods.contains(f))
          .length;
      score = (correctCount * 100 ~/ correctFoods.length);
    }

    scorePerQuestion.add(score);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFFFFF5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Color(0xFFFFD700), width: 2),
        ),
        title: Center(
          child: Text(
            score >= 80 ? 'สุดยอดไปเลย! 👑' : 'พยายามอีกนิดนะเพคะ! ✨',
            style: const TextStyle(
              color: Color(0xFFFF1493),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'คะแนนที่ได้คือ',
              style: TextStyle(fontSize: 16, color: Colors.pink),
            ),
            Text(
              '$score%',
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF69B4),
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF69B4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                score >= 80 ? nextQuestion() : retryQuestion();
              },
              child: Text(
                score >= 80 ? 'ลุยข้อต่อไป ✨' : 'ลองใหม่อีกครั้ง 🔄',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void retryQuestion() {
    setState(() {
      selectedFoods.clear();
      shuffleFoods();
    });
    startTimer();
  }

  void nextQuestion() {
    if (currentQuestion == questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScorePage(
            playerName: "เจ้าหญิงนักปรุง",
            scores: scorePerQuestion,
          ),
        ),
      );
      return;
    }

    setState(() {
      currentQuestion++;
      selectedFoods.clear();
      shuffleFoods();
    });
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. พื้นหลังไล่สีชมพู-ม่วงพาสเทล
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFF0F5), Color(0xFFF3E5F5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // 2. Header: แถบสถานะสีชมพูทอง
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _statusChip(
                        'ด่านที่ ${currentQuestion + 1}/${questions.length}',
                        const Color(0xFFFF1493),
                      ),
                      _statusChip(
                        '⏳ $timeLeft วินาที',
                        timeLeft < 10
                            ? Colors.redAccent
                            : const Color(0xFF8E24AA),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.home_rounded,
                            color: Color(0xFFFF69B4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 3. ป้ายภารกิจสไตล์สมุดบันทึก
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color(0xFFFFD700),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.1),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Color(0xFFFFD700), size: 18),
                          SizedBox(width: 8),
                          Text(
                            'ROYAL MISSION',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFD700),
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.star, color: Color(0xFFFFD700), size: 18),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        questions[currentQuestion]['text'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC71585),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 4. ตารางวัตถุดิบ (Grid) สไตล์ขนมหวาน
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.9,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                    itemCount: shuffledFoods.length,
                    itemBuilder: (context, index) {
                      final food = shuffledFoods[index];
                      final isSelected = selectedFoods.contains(food['name']);
                      return _foodCard(food, isSelected);
                    },
                  ),
                ),

                // 5. ส่วนท้าย: ตะกร้าหวายและปุ่มปรุงอาหาร
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // ตะกร้าแสดงจำนวน
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            size: 50,
                            color: Color(0xFFFF69B4),
                          ),
                          Positioned(
                            right: -2,
                            top: -2,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFD700),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${selectedFoods.length}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 25),
                      // ปุ่มส่งเข้าครัวสไตล์เจ้าหญิง
                      Expanded(
                        child: GestureDetector(
                          onTap: checkAnswer,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFF69B4), Color(0xFFFF1493)],
                              ),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.pink.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'เริ่มปรุงอาหาร ✨',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _foodCard(Map<String, dynamic> food, bool isSelected) {
    return GestureDetector(
      onTap: () => toggleFood(food['name']),
      child: AnimatedScale(
        scale: isSelected ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFCE4EC) : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isSelected ? const Color(0xFFFF69B4) : Colors.pink.shade50,
              width: 2.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? Colors.pink.withOpacity(0.1)
                    : Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(food['icon'], style: const TextStyle(fontSize: 38)),
              const SizedBox(height: 8),
              Text(
                food['name'],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? const Color(0xFFAD1457)
                      : Colors.grey.shade700,
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check_circle,
                  size: 16,
                  color: Color(0xFFFF69B4),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
