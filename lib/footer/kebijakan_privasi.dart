import 'package:flutter/material.dart';
import 'package:frozen_app/home_screen.dart';

class KebijakanPrivasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kebijakan Privasi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kebijakan Privasi Kami',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Kami menghargai privasi Anda dan berkomitmen untuk melindungi informasi pribadi yang Anda berikan kepada kami. Kebijakan privasi ini menguraikan jenis informasi yang kami kumpulkan, bagaimana kami menggunakannya, dan langkah-langkah yang kami ambil untuk melindunginya.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'Informasi yang Kami Kumpulkan:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Kami mengumpulkan informasi pribadi seperti nama, alamat email, dan informasi lainnya yang Anda berikan kepada kami melalui formulir pendaftaran atau interaksi lainnya.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'Penggunaan Informasi:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Informasi yang kami kumpulkan digunakan untuk memberikan layanan, meningkatkan pengalaman pengguna, dan menghubungi Anda jika diperlukan.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
