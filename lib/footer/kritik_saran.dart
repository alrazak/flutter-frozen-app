import 'package:flutter/material.dart';
import 'package:frozen_app/home_screen.dart';

class KritikSaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kritik & Saran'),
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
                'Kritik & Saran',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Kami sangat menghargai masukan dan saran dari Anda untuk terus memperbaiki layanan kami. Silakan sampaikan kritik atau saran Anda melalui formulir di bawah ini.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'Formulir Saran:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Masukkan Saran Anda',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Simulasi pengiriman saran
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Terima Kasih'),
                        content: Text('Saran Anda telah diterima. Terima kasih atas masukan Anda!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Kirim Saran'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
