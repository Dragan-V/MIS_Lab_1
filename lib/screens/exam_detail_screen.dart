import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import 'package:intl/intl.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({Key? key, required this.exam}) : super(key: key);

  String timeUntilExam() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return "${days.abs()} дена, ${hours.abs()} часа";
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd.MM.yyyy HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.subject,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 8),
                    Text(dateFormatter.format(exam.dateTime)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 8),
                    Expanded(child: Text(exam.rooms.join(", "))),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  exam.isPassed
                      ? "Овој испит е веќе положен ✅"
                      : "Преостанува уште: ${timeUntilExam()}",
                  style: TextStyle(
                    fontSize: 16,
                    color: exam.isPassed ? Colors.green : Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
