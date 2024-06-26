import 'package:flutter/material.dart';
import '../constants.dart';

//deklarasi class dan memanggil beberapa fungsi yang diperlukan
class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.option,
    required this.color,
    }) : super(key: key);

  final String option;
  final Color color;

  //membuat tampilan dari setiap option dari jawaban
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
