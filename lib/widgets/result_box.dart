import 'package:flutter/material.dart';
import '../constants.dart';

//deklarasi class dan memanggil beberapa fungsi yang diperlukan
class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  }) : super(key:key);

  //deklarasi variabel
  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  //membuat tampilan dari result box setelah menjawab semua pertanyaan
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Score',
              style: TextStyle(color: neutral, fontSize: 22.0),
            ),
            const SizedBox(height: 20.0),
            CircleAvatar(child: Text('$result/$questionLength', //menampilkan jawaban yang benar dari total soal
              style: TextStyle(fontSize: 30.0),
            ),
              radius: 70.0,
              backgroundColor: result == questionLength/2 //digunakan untuk warna dari total jawaban yang benar
                  ? Colors.yellow
                  : result < questionLength/2
                  ? incorrect
                  : correct,
            ),
            const SizedBox(height: 20.0,),
            Text( //digunakan untuk menentukan tingkat kebenaran dari jawaban
              result == questionLength/2
                  ? 'Hampir Sempurna' //jika hasil sama dengan setengah dari total pertanyaan maka akan muncul notif ini
                  : result < questionLength/2
                  ? 'Coba Lagi?'
                  : 'Sempurna',
              style: const TextStyle(color : neutral),
            ),
            const SizedBox(height: 25.0),
            GestureDetector( //tombol untuk memulai kembali pertanyaan
              onTap: onPressed,
              child: const Text(
                'Start Over',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize : 20.0,
                  letterSpacing: 1.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}