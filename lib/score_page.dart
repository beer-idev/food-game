import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final String playerName;
  final List<int> scores;

  const ScorePage({super.key, required this.playerName, required this.scores});

  static const int totalQuestions = 10;

  @override
  Widget build(BuildContext context) {
    // เติมคะแนนที่ยังไม่ทำให้เป็น 0%
    final List<int> fullScores = List.generate(
      totalQuestions,
      (index) => index < scores.length ? scores[index] : 0,
    );

    final int totalScore = fullScores.reduce((a, b) => a + b) ~/ totalQuestions;

    final bool isComplete = scores.length == totalQuestions;
    final bool isPass = isComplete && totalScore >= 80;

    return Scaffold(
      appBar: AppBar(title: const Text('คะแนนของฉัน')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ชื่อนักเรียน: $playerName',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              'คะแนนรวม: $totalScore%',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Text('สถานะ: ', style: TextStyle(fontSize: 18)),
                Text(
                  isPass ? 'ผ่าน ✅' : 'ไม่ผ่าน ❌',
                  style: TextStyle(
                    fontSize: 18,
                    color: isPass ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            if (!isComplete)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  '⚠️ ต้องทำให้ครบ 10 ข้อจึงจะผ่าน',
                  style: TextStyle(color: Colors.red),
                ),
              ),

            const SizedBox(height: 20),

            const Text(
              'คะแนนรายข้อ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: totalQuestions,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Text(
                        'ข้อ ${index + 1}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: Text(
                        '${fullScores[index]}%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: fullScores[index] >= 80
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.home),
                label: const Text('กลับหน้าแรก'),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
