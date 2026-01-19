import 'package:flutter/material.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('บทเรียนอาหาร 5 หมู่'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          LessonCard(
            icon: '🥩',
            title: 'อาหารหมู่ที่ 1 : โปรตีน',
            description:
                'มีหน้าที่เสริมสร้างและซ่อมแซมส่วนที่สึกหรอของร่างกาย '
                'ช่วยในการเจริญเติบโต เสริมสร้างกล้ามเนื้อ เลือด และภูมิคุ้มกัน',
            examples: 'ไก่, หมู, ปลา, ไข่, นม, ถั่ว',
            caution:
                'ควรรับประทานในปริมาณที่เหมาะสม หลีกเลี่ยงเนื้อสัตว์ติดมันมากเกินไป',
            color: Colors.redAccent,
          ),
          LessonCard(
            icon: '🍚',
            title: 'อาหารหมู่ที่ 2 : คาร์โบไฮเดรต',
            description:
                'เป็นแหล่งพลังงานหลักของร่างกาย '
                'ช่วยให้สมองและกล้ามเนื้อทำงานได้อย่างมีประสิทธิภาพ',
            examples: 'ข้าว, ขนมปัง, เส้นก๋วยเตี๋ยว, เผือก, มัน',
            caution: 'หลีกเลี่ยงน้ำตาลและแป้งขัดขาวมากเกินไป',
            color: Colors.orangeAccent,
          ),
          LessonCard(
            icon: '🧈',
            title: 'อาหารหมู่ที่ 3 : ไขมัน',
            description:
                'ให้พลังงานสูง ช่วยดูดซึมวิตามิน A D E K '
                'และช่วยให้ร่างกายอบอุ่น',
            examples: 'น้ำมันพืช, เนย, น้ำมันมะกอก, ถั่ว',
            caution: 'ไม่ควรบริโภคไขมันอิ่มตัวและไขมันทรานส์มากเกินไป',
            color: Colors.yellow,
          ),
          LessonCard(
            icon: '🥦',
            title: 'อาหารหมู่ที่ 4 : วิตามิน',
            description:
                'ช่วยควบคุมการทำงานของระบบต่าง ๆ ในร่างกาย '
                'ช่วยเสริมภูมิคุ้มกันและป้องกันโรค',
            examples: 'ผักใบเขียว, แครอท, บรอกโคลี, ฟักทอง',
            caution: 'ควรรับประทานให้หลากหลายและสดใหม่',
            color: Colors.green,
          ),
          LessonCard(
            icon: '🍎',
            title: 'อาหารหมู่ที่ 5 : เกลือแร่',
            description:
                'ช่วยในการทำงานของระบบประสาท กล้ามเนื้อ และกระดูก '
                'ช่วยควบคุมสมดุลของน้ำในร่างกาย',
            examples: 'แอปเปิ้ล, กล้วย, ส้ม, แตงโม',
            caution: 'ควรเลือกผลไม้สด หลีกเลี่ยงผลไม้แปรรูปที่มีน้ำตาลสูง',
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final String examples;
  final String caution;
  final Color color;

  const LessonCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.examples,
    required this.caution,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.8), color.withOpacity(0.4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(icon, style: const TextStyle(fontSize: 36)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 10),
            Text(
              '🍽 ตัวอย่างอาหาร: $examples',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 6),
            Text(
              '⚠️ ข้อควรระวัง: $caution',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
