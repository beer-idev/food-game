import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('บทเรียนสารอาหาร 5 หมู่')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'สารอาหารหลัก 5 หมู่',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              'สารอาหารแต่ละหมู่มีประโยชน์ต่อร่างกายแตกต่างกัน '
              'เรามาเรียนรู้กันว่าอาหารแต่ละชนิดอยู่ในหมู่ใด',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // ===== รายการ 5 หมู่ =====
            Expanded(
              child: ListView(
                children: const [
                  lessonItem('หมู่ที่ 1', 'ข้าว แป้ง น้ำตาล'),
                  lessonItem('หมู่ที่ 2', 'ผักและผลไม้'),
                  lessonItem('หมู่ที่ 3', 'เนื้อสัตว์ ไข่ ถั่ว'),
                  lessonItem('หมู่ที่ 4', 'นมและผลิตภัณฑ์จากนม'),
                  lessonItem('หมู่ที่ 5', 'ไขมันและน้ำมัน'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== Widget รายการบทเรียน =====
class lessonItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const lessonItem(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.restaurant_menu),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
