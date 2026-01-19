import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

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

  // ================== อาหาร 50 รายการ ==================
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
    // 👉 เพิ่มรายการอื่นของคุณได้อีก (logic รองรับแล้ว)
  ];

  // ================== โจทย์ ==================
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
      'text': 'ข้าวปลาแซลมอนย่าง + ผักสลัด + ส้มเขียวหวาน',
      'foods': ['ปลา', 'ข้าว', 'บรอกโคลี', 'ส้ม'],
    },
    {
      'text': 'ข้าวผัดไข่ใส่ผัก + ไก่ฉีก + แตงโม',
      'foods': ['ข้าว', 'ไข่', 'ไก่', 'ผักบุ้ง', 'แตงโม'],
    },
    {
      'text': 'ข้าวราดแกงเขียวหวานไก่ + ผักสด + สับปะรด',
      'foods': ['ข้าว', 'ไก่', 'บรอกโคลี', 'สับปะรด'],
    },
    {
      'text': 'ข้าวหน้าหมูผัดซอสเทริยากิ + ผักลวก + กล้วย',
      'foods': ['ข้าว', 'หมู', 'ผักบุ้ง', 'กล้วย'],
    },
    {
      'text': 'ข้าวหน้าไก่นึ่งซีอิ๊ว + ผักรวม + แอปเปิ้ล',
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
      setState(() {
        timeLeft--;
        if (timeLeft == 0) {
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

  void showBasket() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('ตะกร้าวัตถุดิบ 🧺'),
        content: selectedFoods.isEmpty
            ? const Text('ยังไม่ได้เลือกวัตถุดิบ')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: selectedFoods.map((e) => Text('• $e')).toList(),
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ปิด'),
          ),
        ],
      ),
    );
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
        title: const Text('ผลคะแนน'),
        content: Text('คุณได้ $score%'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              score >= 80 ? nextQuestion() : retryQuestion();
            },
            child: Text(score >= 80 ? 'ผ่าน ✔' : 'ลองใหม่ 🔄'),
          ),
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
    if (currentQuestion == questions.length - 1) return;

    setState(() {
      currentQuestion++;
      selectedFoods.clear();
      shuffleFoods();
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Healthy Plate Game'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_basket),
            onPressed: showBasket,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Center(child: Text('${selectedFoods.length}')),
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            'ข้อ ${currentQuestion + 1} / 10',
            style: const TextStyle(fontSize: 18),
          ),
          Text('⏱ $timeLeft วินาที', style: const TextStyle(fontSize: 16)),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              questions[currentQuestion]['text'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 5,
              childAspectRatio: 0.85,
              padding: const EdgeInsets.all(8),
              children: shuffledFoods.map((food) {
                final isSelected = selectedFoods.contains(food['name']);
                return GestureDetector(
                  onTap: () => toggleFood(food['name']),
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.teal[300] : Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(blurRadius: 4, color: Colors.black12),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          food['icon'],
                          style: const TextStyle(fontSize: 28),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          food['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.send),
            label: const Text('ส่งคำตอบ'),
            onPressed: checkAnswer,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
