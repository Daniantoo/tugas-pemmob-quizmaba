import 'package:flutter/material.dart';
import '../constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
  {Key? key,
    required this.question,
    required this.indexAction,
    required this.totalQuestions,
    this.imagePath
}) : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestions;
  final String? imagePath;
  @override
  Widget build (BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        if (imagePath != null) // Tampilkan gambar hanya jika imagePath tidak null
          Image.asset(
            imagePath!, // Gunakan imagePath jika tidak null
            width: 250,
            height: 200,
          ), // Image.asset
            SizedBox(height: 5), // Jarak antara gambar dan teks
            Text(
            'Question ${indexAction + 1}/$totalQuestions: $question',
            style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            fontFamily: "Viga",
            color: Color.fromARGB(255, 255, 237, 216),
              ),
            ),
      ],
    );
  }
}
