import 'package:flutter/material.dart';
import '../constants.dart';

//deklarasi class dan memanggil beberapa fungsi
class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.nextQuestion});
  final VoidCallback nextQuestion;

  //membuat widget dari next button terkait tampilan dan fungsi yang akan direturn
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: neutral,
          borderRadius: BorderRadius.circular(10.0)
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Text(
        'Next Question',
        textAlign: TextAlign.center,
      ),
    )
    );
  }
}
