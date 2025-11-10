import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  ExamListScreen({Key? key}) : super(key: key);

  final List<Exam> exams = [
    Exam(subject: "Вовед во компјутерските науки", dateTime: DateTime(2025, 2, 15, 10, 0), rooms: ["Lab 2", "Lab 3"], isPassed: false),
    Exam(subject: "Архитектура и организација на компјутери", dateTime: DateTime(2025, 1, 28, 9, 30), rooms: ["Lab 215"], isPassed: false),
    Exam(subject: "Основи на веб дизајн", dateTime: DateTime(2024, 12, 12, 12, 0), rooms: ["Lab 13"], isPassed: true),
    Exam(subject: "Веројатност и статистика", dateTime: DateTime(2025, 3, 2, 11, 0), rooms: ["Lab 12"], isPassed: false),
    Exam(subject: "Оперативни системи", dateTime: DateTime(2024, 9, 25, 10, 0), rooms: ["Lab 12,Lab 13"], isPassed: true),
    Exam(subject: "Компјутерска графика", dateTime: DateTime(2025, 2, 10, 13, 0), rooms: ["Lab 108"], isPassed: false),
    Exam(subject: "Бази на податоци", dateTime: DateTime(2025, 1, 20, 10, 0), rooms: ["Lab 215c"], isPassed: false),
    Exam(subject: "Основи на роботиката", dateTime: DateTime(2024, 7, 5, 9, 0), rooms: ["Lab 3"], isPassed: true),
    Exam(subject: "Мобилни информациски системи", dateTime: DateTime(2025, 4, 10, 10, 0), rooms: ["Lab 200"], isPassed: false),
    Exam(subject: "Виртуелна реалност", dateTime: DateTime(2025, 3, 20, 14, 0), rooms: ["Lab 200ab"], isPassed: false),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 211245"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return ExamCard(exam: exams[index]);
              },
            ),
          ),
          Container(
            color: Colors.indigo.shade100,
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.book, color: Colors.indigo),
                const SizedBox(width: 8),
                Text("Вкупно испити: ${exams.length}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
