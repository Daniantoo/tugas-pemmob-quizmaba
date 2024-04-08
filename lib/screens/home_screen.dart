import 'package:flutter/material.dart';
import 'package:quizmaba/models/question_model.dart';
import 'package:quizmaba/widgets/result_box.dart';
import '../constants.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';
import '../widgets/result_box.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//membuat list pertanyaan dengan struktur yang sudah dideklarasikan di question model
class _HomeScreenState extends State<HomeScreen> {
  List<Question> _questions = [
    Question(
      id: '1',
      title: 'Ada berapa program studi di fakultas vokasi UNESA?',
      options: {'3': false, '7': false, '5': false, '10': true}),

    Question(
        id: '2',
        title: 'Apa tujuan utama anda dalam bergabung dengan komunitas mahasiswa fi kampus?',
        options: {'Meningkatkan pengetahuan akademis': false, 'Membangun jejaring sosial': false, 'Mengembangkan keterampilan kepemimpinan': false, 'Semua jawaban di atas benar': true}),

    Question(
        id: '3',
        title: 'Bagaimana cara yang efektif untuk mengatur waktu belajar dan waktu luang and?',
        options: {'Membuat jadwal harian atau mingguan': true, 'Mengikuti alur kegiatan tanpa jadwal tertentu': false, 'Menunda tugas-tugas penting sampai mendekati deadline': false, 'Bersenang-senang sampai melupakan waktu untuk belajar': false}),

    Question(
        id: '4',
        title: 'Apa yang harus anda lakukan jika mengalami kesulitan dalam memahami materi kuliah?',
        options: {'Mengirim surat cinta kepada dosen': false, 'Mengabaikan masalah tersebut': false, 'Mencari tutor atau bergabung dalam kelompok belajar': true, 'Bermain game online': false}),

    Question(
        id: '5',
        title: 'Gambar diatas merupakan jenis topologi apa?',
        options: {'Topologi Mesh': false, 'Topologi Star': false, 'Topologi Hybrid': true, 'Topologi Ring': false},
        imagePath: 'images/soal5.jpeg',
    ),

    Question(
        id: '6',
        title: 'Bagaimana cara yang tepat untuk menghubungi dosen jika anda memiliki pertanyaan tentang tugas?',
        options: {'Mengirim pesan ke media sosial': false, 'Mencari nomor telepon di direktori online kampus': true, 'Mengabaikan pertanyaan anda': false, 'Menunggu hingga akhir semester': false}),

    Question(
        id: '7',
        title: 'Apa yang sebaiknya dilakukan jika anda merasa setres karena tugas kuliah yang menumpuk?',
        options: {'Mengonsumsi alkohol': false, 'Mengabaikan tugas-tugas tersebut': false, 'Berbicara dengan teman atau dorongan akademik': true, 'Bersemunyi di kamar dan tidur sepanjang hari': false}),

    Question(
        id: '8',
        title: 'Apa langkah pertama yang harus diambil jika anda kehilangan kartu identitas mahasiswa?',
        options: {'Tetap menggunakan kartu identitas orang lain': false, 'Mengabaikan kehilangan itu': false, 'Melaporkan kehilangan kepada kantor keamanan kampus dan mengajukan permohonan untuk mendapatkan yang baru': true, 'Membuat kartu identitas palsu': false}),

    Question(
        id: '9',
        title: 'Apa yang harus dilakukan jika anda ingin meminta perpanjangan waktu untuk tugas kuliah?',
        options: {'Meminta kepada teman untuk mengerjakannya': false, 'Mengumpulkan tugas tanpa izin': false, 'Membicarakannya dengan dosen dan meminta perpanjangan dengan alasan yang': true, 'Mengabaika tugas tersebut': false}),

    Question(
        id: '10',
        title: 'Apa yang harus dilakukan jika ingin mendaftar mata kuliah tambahan',
        options: {'Mencari informasi di bioskop kampus': false, 'Menulis surat ke departemen musik': false, 'Menghubungi kantor akademik': true, 'Mengajukan permohonan melalui media sosial': false}),
  ];

  //deklarasi variabel
  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  //membuat fungsi untuk berganti ke pertanyaan selanjutnya dan menampilkan box hasil,
  //jika pertanyaan belum terpilih maka akan ada notifikasi
  void nextQuestion() {
    if(index == _questions.length -1){
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
            result: score,
            questionLength: _questions.length,
            onPressed: startOver,
          ));
    } else {
      if(isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      }else{
        //notifikasi untuk memilih jawaban
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please select option first.'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(vertical: 20.0),
            )
        );
      }
    }
  }

  //membuat fungsi untuk check jawaban dan menentukan skor dari jawaban yang dipilih
  void checkAnswerAndUpdate(bool value){
    if(isAlreadySelected){
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  //membuat fungsi untuk mengulang kembali aplikasi dengan mereset beberapa variabel
  void startOver(){
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('QuizMaba'), //judul aplikasi quizmaba
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding( //padding untuk menampilkan skor
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score : $score',
              style: const TextStyle(fontSize: 18.0),
            ),

          )
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column( //kolom yang digunakan untuk menampilkan pertanyaan yang kita input
          children: [
            QuestionWidget(
              question: _questions[index].title,
              indexAction: index,
              totalQuestions: _questions.length,
              imagePath: _questions[index].imagePath,
            ),
            const Divider(color: neutral),
            const SizedBox(height: 25.0),
            for(int i=0; i<_questions[index].options.length; i++)
              GestureDetector( //fungsi untuk merubah warna dari option bagi pilihan benar atau salah
                onTap: () => checkAnswerAndUpdate(
                    _questions[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  color : isPressed ? _questions[index].options.values.toList()[i] == true
                    ? correct
                    : incorrect
                  : neutral,
                ),
              )
          ],
        ),
      ),

      floatingActionButton: Padding( //tombol untuk pertanyaan selanjutnya
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
