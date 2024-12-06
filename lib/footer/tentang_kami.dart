import 'package:flutter/material.dart';
import 'package:frozen_app/home_screen.dart';

class TentangKami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Kami'),
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
                'Tentang Perusahaan',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Perusahaan kami didirikan dengan tujuan untuk memberikan layanan terbaik di bidang teknologi. Kami berkomitmen untuk selalu berinovasi dan memberikan solusi yang relevan dengan kebutuhan pelanggan kami. Dengan pengalaman lebih dari 10 tahun, kami terus berkembang untuk menjadi pemimpin di industri ini.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'Visi & Misi',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Visi: Menjadi perusahaan terdepan dalam solusi teknologi yang memberikan dampak positif bagi masyarakat.\n\nMisi: Meningkatkan kualitas produk dan layanan melalui inovasi berkelanjutan dan kepuasan pelanggan.',
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
