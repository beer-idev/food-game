import 'package:flutter/material.dart';

class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('วิธีการเล่น'), centerTitle: true),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            HeaderCard(),
            SizedBox(height: 16),

            RuleCard(
              number: '1',
              text: 'นักเรียนกดปุ่ม “Game” เพื่อเริ่มต้นการเล่นเกม',
            ),
            RuleCard(
              number: '2',
              text:
                  'ภายในเกมประกอบด้วยคำถามทั้งหมด 10 ข้อ โดยแต่ละข้อมีระยะเวลาในการตอบคำถาม 60 วินาที',
            ),
            RuleCard(
              number: '3',
              text:
                  'นักเรียนต้องอ่านคำถามและเลือกคำตอบให้ถูกต้อง โดยต้องได้คะแนนไม่น้อยกว่า 80% จึงจะสามารถไปยังข้อถัดไปได้',
            ),
            RuleCard(
              number: '4',
              text:
                  'หากนักเรียนทำคะแนนได้ต่ำกว่า 80% จะต้องกลับไปทำข้อเดิมใหม่อีกครั้ง',
            ),
            RuleCard(
              number: '5',
              text:
                  'หากไม่สามารถทำข้อสอบได้ทันภายในเวลาที่กำหนด คะแนนจะถูกลดลงครั้งละ 10%',
            ),
            RuleCard(
              number: '6',
              text:
                  'เมื่อทำครบทั้ง 10 ข้อ นักเรียนสามารถตรวจสอบคะแนนรวมทั้งหมดได้ที่หน้า “วิธีการเล่น”',
            ),
          ],
        ),
      ),
    );
  }
}

// ================= HEADER =================
class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        children: [
          Icon(Icons.help_outline, color: Colors.white, size: 48),
          SizedBox(height: 10),
          Text(
            'กติกาและวิธีการเล่นเกม',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text('Healthy Plate Game', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

// ================= RULE CARD =================
class RuleCard extends StatelessWidget {
  final String number;
  final String text;

  const RuleCard({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blue,
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
