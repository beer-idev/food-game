import 'package:flutter/material.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // พื้นหลังสีชมพูพาสเทลอ่อนๆ สไตล์เจ้าหญิง
      backgroundColor: const Color(0xFFFFF5F7),
      appBar: AppBar(
        title: const Text(
          'อาหารหลัก 5 หมู่',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF69B4), // สีชมพู Princess Pink
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.pink.withOpacity(0.3),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        // ไอคอนปุ่มย้อนกลับสีขาว
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(),
          const SizedBox(height: 25),

          // หมู่ที่ 1
          const DetailedLessonCard(
            icon: '🥩',
            title: 'หมู่ที่ 1 : โปรตีน (Protein)',
            subtitle: 'รากฐานของการเจริญเติบโต',
            content:
                'โปรตีนประกอบด้วยกรดอะมิโนที่จำเป็นต่อร่างกาย ทำหน้าที่เป็นโครงสร้างหลักของเซลล์ กล้ามเนื้อ และเอนไซม์ต่างๆ',
            benefits: [
              'ซ่อมแซมเนื้อเยื่อที่เสียหายจากการบาดเจ็บ',
              'สร้างภูมิคุ้มกันเพื่อต่อสู้กับเชื้อโรค',
              'ควบคุมการทำงานของระบบอวัยวะผ่านฮอร์โมน',
              'เป็นแหล่งพลังงานสำรองเมื่อร่างกายขาดแคล้ง',
            ],
            sources:
                'เนื้อสัตว์ทุกชนิด, ไข่, นม, ถั่วเมล็ดแห้ง, ธัญพืช, สาหร่ายบางชนิด',
            tips:
                'วัยเด็กควรได้รับโปรตีนมากกว่าวัยผู้ใหญ่เพื่อใช้ในการเจริญเติบโต และควรเน้นโปรตีนจากพืชเพื่อลดไขมันอิ่มตัว',
            color: Color(0xFFFF5252), // ปรับเป็นแดงชมพูเข้ม
          ),

          // หมู่ที่ 2
          const DetailedLessonCard(
            icon: '🍚',
            title: 'หมู่ที่ 2 : คาร์โบไฮเดรต (Carbohydrate)',
            subtitle: 'เชื้อเพลิงหลักของสมองและร่างกาย',
            content:
                'คาร์โบไฮเดรตจะถูกเปลี่ยนเป็น "กลูโคส" ซึ่งเป็นแหล่งพลังงานที่ร่างกายนำไปใช้ได้เร็วที่สุด โดยเฉพาะสมองที่ใช้พลังงานจากน้ำตาลกลูโคสเกือบ 100%',
            benefits: [
              'ให้พลังงานสำหรับการทำกิจกรรมหนักๆ',
              'ช่วยให้ระบบประสาททำงานได้อย่างมีประสิทธิภาพ',
              'ป้องกันการนำโปรตีนมาเผาผลาญเป็นพลังงาน (Protein Sparing Action)',
              'ช่วยในการเผาผลาญไขมันให้สมบูรณ์',
            ],
            sources:
                'ข้าวไม่ขัดสี (ข้าวกล้อง), ขนมปังโฮลวีต, แป้ง, มันฝรั่ง, เผือก, ข้าวโพด, น้ำตาลธรรมชาติ',
            tips:
                'ควรเลือกทาน "คาร์โบไฮเดรตเชิงซ้อน" (เช่น ข้าวกล้อง) เพราะจะค่อยๆ ปล่อยพลังงานและทำให้อิ่มนานกว่าแป้งขัดขาว',
            color: Color(0xFFFF9800), // สีส้มทอง
          ),

          // หมู่ที่ 3
          const DetailedLessonCard(
            icon: '🥦',
            title: 'หมู่ที่ 3 : เเกลือแร่และแร่ธาตุ (Minerals)',
            subtitle: 'ฟันเฟืองควบคุมระบบร่างกาย',
            content:
                'เกลือแร่เป็นสารอนินทรีย์ที่ร่างกายสร้างเองไม่ได้ แต่จำเป็นมากในการควบคุมสมดุลน้ำ และปฏิกิริยาเคมีต่างๆ',
            benefits: [
              'แคลเซียมและฟอสฟอรัส: สร้างกระดูกและฟันให้แข็งแรง',
              'เหล็ก: ส่วนประกอบสำคัญของเม็ดเลือดแดง (ฮีโมโกลบิน)',
              'ไอโอดีน: ควบคุมการทำงานของต่อมไทรอยด์',
              'ใยอาหาร (Fiber): ช่วยดักจับสารพิษและช่วยการขับถ่าย',
            ],
            sources:
                'ผักใบเขียวทุกชนิด, ผักสีเหลือง-ส้ม, เกลือเสริมไอโอดีน, อาหารทะเล',
            tips:
                'การทานผักหลายสี (ผัก 5 สี) จะช่วยให้ได้รับเกลือแร่ที่หลากหลายและครอบคลุมความต้องการของร่างกาย',
            color: Color(0xFF4CAF50), // สีเขียวมรกต
          ),

          // หมู่ที่ 4
          const DetailedLessonCard(
            icon: '🍎',
            title: 'หมู่ที่ 4 : วิตามิน (Vitamins)',
            subtitle: 'เกราะป้องกันโรคและบำรุงผิวพรรณ',
            content:
                'วิตามินจากผลไม้ช่วยทำหน้าที่เป็น "สารต้านอนุมูลอิสระ" ปกป้องเซลล์ไม่ให้ถูกทำลาย และช่วยให้ผิวพรรณดูอ่อนเยาว์',
            benefits: [
              'วิตามิน C: ป้องกันโรคลักปิดลักเปิดและเพิ่มการดูดซึมเหล็ก',
              'วิตามิน A: บำรุงสายตาและช่วยการมองเห็นในที่มืด',
              'วิตามิน E: บำรุงผิวพรรณและระบบสืบพันธุ์',
              'ช่วยลดความเสี่ยงในการเกิดโรคไม่ติดต่อเรื้อรัง (NCDs)',
            ],
            sources:
                'ส้ม, ฝรั่ง (วิตามิน C สูงมาก), มะละกอ, กล้วย, ผลไม้ตระกูลเบอร์รี่',
            tips:
                'ควรรับประทานผลไม้สดสด แทนการคั้นน้ำ เพราะจะได้รับใยอาหารที่ช่วยลดการดูดซึมน้ำตาลเข้าสู่กระแสเลือดเร็วเกินไป',
            color: Color(0xFFFF4081), // สีชมพูเข้มสดใส
          ),

          // หมู่ที่ 5
          const DetailedLessonCard(
            icon: '🧈',
            title: 'หมู่ที่ 5 : ไขมัน (Fats)',
            subtitle: 'แหล่งพลังงานเข้มข้นและความอบอุ่น',
            content:
                'ไขมันเป็นสารอาหารที่ให้พลังงานสูงที่สุด (9 แคลอรีต่อกรัม) และมีความสำคัญต่อการผลิตฮอร์โมนบางชนิด',
            benefits: [
              'ละลายและช่วยดูดซึมวิตามิน A, D, E, K',
              'ห่อหุ้มอวัยวะภายในเพื่อป้องกันการกระทบกระเทือน',
              'เป็นส่วนประกอบสำคัญของเยื่อหุ้มเซลล์และเนื้อเยื่อประสาท',
              'รักษาอุณหภูมิร่างกายให้คงที่ในที่อากาศเย็น',
            ],
            sources:
                'ไขมันพืช (น้ำมันมะกอก, รำข้าว), ไขมันปลา, ถั่วเปลือกแข็ง, เนย, กะทิ',
            tips:
                'หลีกเลี่ยงไขมันทรานส์ (Trans Fat) ในเนยเทียมหรือครีมเทียม และหันมาทานไขมันไม่อิ่มตัวเพื่อสุขภาพหัวใจที่ดี',
            color: Color(0xFFFFC107), // สีเหลืองอำพัน
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFFFD700), width: 2), // ขอบทอง
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            size: 60,
            color: Color(0xFFFFD700),
          ), // ไอคอนประกายดาวทอง
          const SizedBox(height: 10),
          const Text(
            'หลักโภชนาการที่ถูกต้อง',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF1493),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'การเข้าใจหน้าที่ของสารอาหารแต่ละชนิด จะช่วยให้เราเลือกทานอาหารได้สมดุลและมีสุขภาพที่ยั่งยืน',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.pink.shade300),
          ),
        ],
      ),
    );
  }
}

class DetailedLessonCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String content;
  final List<String> benefits;
  final String sources;
  final String tips;
  final Color color;

  const DetailedLessonCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.benefits,
    required this.sources,
    required this.tips,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.only(bottom: 28),
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: color.withOpacity(0.2), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ส่วนหัวการ์ดสไตล์ริบบิ้นเจ้าหญิง
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(icon, style: const TextStyle(fontSize: 35)),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.star_border_purple500, color: Colors.white70),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.edit_note_rounded, color: color, size: 22),
                    const SizedBox(width: 5),
                    const Text(
                      '📝 คำอธิบายบทเรียน:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Icon(Icons.auto_awesome, color: color, size: 22),
                    const SizedBox(width: 5),
                    const Text(
                      '🌟 ประโยชน์ที่ได้รับ:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...benefits.map(
                  (b) => Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '💖 ',
                          style: TextStyle(color: color, fontSize: 12),
                        ),
                        Expanded(
                          child: Text(b, style: const TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                ),

                const Divider(height: 40, thickness: 1),

                Row(
                  children: [
                    Icon(
                      Icons.restaurant_menu_rounded,
                      size: 20,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'แหล่งอาหารหลัก:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    sources,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),

                const SizedBox(height: 20),

                // กล่องเคล็ดลับสไตล์กรอบรูปเจ้าหญิง
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: color.withOpacity(0.3), width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.lightbulb_circle, color: color, size: 26),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'เคล็ดลับสุขภาพ: $tips',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
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
}
