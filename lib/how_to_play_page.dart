import 'package:flutter/material.dart';

class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ขั้นตอนการเล่นเกม',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFF69B4), // สีชมพู Princess Pink
        elevation: 5,
        shadowColor: Colors.pink.withOpacity(0.3),
        iconTheme: const IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF5F7), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          children: const [
            HeaderCard(),
            SizedBox(height: 25),

            RuleCard(
              number: '1',
              icon: Icons.auto_awesome, // เปลี่ยนเป็นประกายวิเศษ
              iconColor: Colors.pinkAccent,
              title: 'เริ่มภารกิจ',
              text:
                  'กดปุ่ม “Game” เพื่อเริ่มต้นการเดินทางเข้าสู่โลกแห่งสารอาหาร',
            ),
            RuleCard(
              number: '2',
              icon: Icons.hourglass_top_rounded, // เปลี่ยนเป็นนาฬิกาทราย
              iconColor: Colors.blueAccent,
              title: 'แข่งกับเวลา',
              text: 'มีคำถามทั้งหมด 10 ข้อ โดยมีเวลาตัดสินใจข้อละ 60 วินาทีนะ!',
            ),
            RuleCard(
              number: '3',
              icon: Icons.verified_rounded, // เปลี่ยนเป็นตราประทับ
              iconColor: Colors.orangeAccent,
              title: 'เกณฑ์การผ่าน',
              text:
                  'ต้องตอบถูกให้ได้คะแนนไม่น้อยกว่า 80% ถึงจะผ่านไปยังด่านถัดไปได้',
            ),
            RuleCard(
              number: '4',
              icon: Icons.brush, // เปลี่ยนเป็นไม้คทา
              iconColor: Colors.redAccent,
              title: 'ลองใหม่อีกครั้ง',
              text:
                  'หากคะแนนไม่ถึง 80% ไม่ต้องเสียใจ! กลับไปแก้ตัวในข้อเดิมได้ทันที',
            ),
            RuleCard(
              number: '5',
              icon: Icons.report_problem_rounded,
              iconColor: Colors.purpleAccent,
              title: 'ระวังเวลาหมด',
              text: 'ถ้าตอบไม่ทันเวลา คะแนนจะถูกลดลงครั้งละ 10% รีบตัดสินใจนะ!',
            ),
            RuleCard(
              number: '6',
              icon:
                  Icons.workspace_premium_rounded, // เปลี่ยนเป็นมงกุฎ/เหรียญตรา
              iconColor: Colors.amber,
              title: 'ประกาศชัยชนะ',
              text:
                  'เมื่อพิชิตครบ 10 ข้อ สามารถตรวจสอบคะแนนรวมได้ที่หน้า “คะแนน”',
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ================= HEADER สไตล์เจ้าหญิง =================
class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF1493), Color(0xFFFF69B4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(35),
        border: Border.all(
          color: const Color(0xFFFFD700),
          width: 2.5,
        ), // ขอบทองหรูๆ
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.castle_rounded,
            color: Colors.white,
            size: 60,
          ), // ไอคอนปราสาท
          const SizedBox(height: 12),
          const Text(
            'กติกาการเล่นเกม',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'เตรียมตัวให้พร้อมก่อนเริ่มสนุก!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= RULE CARD ดีไซน์อ่อนหวาน =================
class RuleCard extends StatelessWidget {
  final String number;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String text;

  const RuleCard({
    super.key,
    required this.number,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.pink.shade50, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // ส่วนตัวเลขสไตล์เครื่องประดับ
            Container(
              width: 55,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  bottomLeft: Radius.circular(28),
                ),
              ),
              child: Center(
                child: Text(
                  number,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                    fontFamily: 'Serif', // เพิ่มความหรูหรา
                  ),
                ),
              ),
            ),
            // ส่วนเนื้อหา
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(icon, color: iconColor, size: 26),
                        const SizedBox(width: 10),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink.shade900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                        height: 1.4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
