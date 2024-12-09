import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Rincian Pembayaran
            Text('Rincian Pembayaran', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            Text('Total Harga: Rp ', style: TextStyle(fontSize: 16.0)),

            SizedBox(height: 24.0),

            // Form Pembayaran
            Text('Metode Pembayaran', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pilih Metode Pembayaran',
              ),
              items: [
                DropdownMenuItem(child: Text('Transfer Bank'), value: 'Transfer Bank'),
                DropdownMenuItem(child: Text('Doku Pay'), value: 'Doku Pay'),
                DropdownMenuItem(child: Text('OVO'), value: 'OVO'),
                DropdownMenuItem(child: Text('GoPay'), value: 'GoPay'),
              ],
              onChanged: (value) {},
            ),

            SizedBox(height: 24.0),

            // Tombol Konfirmasi Pembayaran
            ElevatedButton(
              onPressed: () {
                // Aksi konfirmasi pembayaran
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Pembayaran Berhasil'),
                    content: Text('Pembayaran Anda berhasil dilakukan dengan total Rp '),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Text('Konfirmasi Pembayaran'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}