import 'package:flutter/material.dart';
import 'package:frozen_app/model/data_product.dart';

class CheckoutPage extends StatelessWidget {
  final List<DataProduct> cartItems;

  const CheckoutPage({Key? key, required this.cartItems}) : super(key: key);

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
            // List Produk di Keranjang
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: item.imageAsset.startsWith('http')
                          ? Image.network(item.imageAsset, width: 50, height: 50, fit: BoxFit.cover)
                          : Image.asset(item.imageAsset, width: 50, height: 50, fit: BoxFit.cover),
                      title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Harga: ${item.price} x ${item.quantity} pcs'),
                      trailing: Text(
                        'Subtotal: Rp ${(int.parse(item.price.replaceAll('Rp ', '').replaceAll(',', '')) * item.quantity)}',
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 16.0),

            // Rincian Pembayaran
            Text('Rincian Pembayaran', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Total Harga: Rp ${_calculateTotal(cartItems)}', style: TextStyle(fontSize: 16.0)),

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
                    content: Text('Pembayaran Anda berhasil dilakukan dengan total Rp ${_calculateTotal(cartItems)}'),
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

  // Fungsi untuk menghitung total harga
  int _calculateTotal(List<DataProduct> items) {
    return items.fold(
      0,
          (total, item) =>
      total + (int.parse(item.price.replaceAll('Rp ', '').replaceAll(',', '')) * item.quantity),
    );
  }
}
