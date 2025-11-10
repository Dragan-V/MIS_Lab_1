import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../screens/exam_detail_screen.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd.MM.yyyy');
    final timeFormatter = DateFormat('HH:mm');

    return Card(
      color: exam.isPassed ? Colors.green.shade50 : Colors.blue.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(
          exam.isPassed ? Icons.check_circle : Icons.pending_actions,
          color: exam.isPassed ? Colors.green : Colors.blue,
          size: 32,
        ),
        title: Text(
          exam.subject,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text(dateFormatter.format(exam.dateTime)),
                const SizedBox(width: 8),
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text(timeFormatter.format(exam.dateTime)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                Expanded(child: Text(exam.rooms.join(", "))),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExamDetailScreen(exam: exam),
            ),
          );
        },
      ),
    );
  }
}
