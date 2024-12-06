import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frozen_app/detail_screen.dart';
import 'package:frozen_app/footer/tentang_kami.dart';
import 'package:frozen_app/footer/kebijakan_privasi.dart';
import 'package:frozen_app/footer/kritik_saran.dart';
import 'package:frozen_app/model/data_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar home
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Frozen Food',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          // Icon search
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              print('Search icon tapped');
            },
          ),
          // Icon shopping
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            color: Colors.white,
            onPressed: () {
              print('Shopping cart icon tapped');
            },
          ),
        ],
      ),

      // Drawer navigation
      drawer: Drawer(
        child: ListView(
          children: [
            // Header drawer
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Frozen Food Store',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'admin@frozenfood.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Icon home
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap:() {
                Navigator.pop(context);
                // navigasi ke halaman home
              },
            ),
            // Icon kategori produk
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Kategori Produk'),
              onTap: () {
                Navigator.pop(context);
                // navigasi ke halaman kategori produk
              },
            ),
            // Icon pesanan saya
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Pesanan Saya'),
              onTap: () {
                Navigator.pop(context);
                // navigasi ke halaman kategori produk
              },
            ),
            // Icon profile
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                // navigasi ke halaman pengaturan
              },
            ),
            Divider(),
            // Icon pengaturan
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan'),
              onTap: () {
                Navigator.pop(context);
                // navigasi ke halaman pengaturan
              },
            ),
            // Icon logout
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Keluar'),
              onTap: () {
                Navigator.pop(context);
                // navigasi untuk logout
              },
            )
          ],
        ),
      ),

      // Body home page
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Image body
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/images/frozen.jpg'),
              ),

              // Menu kategori
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Kategori : Produk Beku',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oxygen'
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 300, // Sesuaikan tinggi grid jika perlu
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200, // Lebar maksimum setiap kartu
                      crossAxisSpacing: 8.0, // Jarak horizontal antar kartu
                      mainAxisSpacing: 8.0, // Jarak vertikal antar kartu
                      childAspectRatio: 3 / 4, // Rasio lebar ke tinggi kartu
                    ),
                    itemCount: dataProductList.length,
                    itemBuilder: (context, index) {
                      final DataProduct place = dataProductList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DetailScreen(place: place); // Ganti dengan layar detail Anda
                          }));
                        },
                        child: Card(
                          elevation: 3.0, // Bayangan ringan
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Membulatkan sudut kartu
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                child: Image.asset(
                                  place.imageAsset,
                                  width: double.infinity,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      place.name,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      place.price,
                                      style: const TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 30.0),

              // Footer
              Container(
                width: double.infinity,
                color: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Frozen Food',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Fresh, Delicious, Delivered to Your Doorstep',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.credit_card, size: 40, color: Colors.white), // Ikon kartu kredit
                        SizedBox(width: 16.0),
                        Icon(Icons.account_balance, size: 40, color: Colors.white), // Ikon bank
                        SizedBox(width: 16.0),
                        Icon(Icons.attach_money, size: 40, color: Colors.white), // Ikon uang
                        SizedBox(width: 16.0),
                        Icon(Icons.account_balance_wallet, size: 40, color: Colors.white), // Ikon dompet
                      ],
                    ),
                    SizedBox(height: 16.0),

                    // Alamat kantor
                    Text(
                      'Jl. Kertajaya No. 123, Jakarta, Indonesia',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),

                    // Email
                    Text(
                      'info@frozenfood.com',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),

                    // Nomor telepon
                    Text(
                      '+62 812 3456 7890',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.0), // Jarak antar bagian

                    // Informasi & kebijakan
                    Text(
                      'INFORMASI & KEBIJAKAN',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // navigasi ke halaman pengiriman produk
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TentangKami()),
                        );
                      },
                      child: Text(
                        'Tentang Kami',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // navigasi ke halaman kebijakan privasi
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KebijakanPrivasi()),
                        );
                      },
                      child: Text(
                        'Kebijakan Privasi',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // navigasi ke halaman Kritik & Saran
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KritikSaran()),
                        );
                      },
                      child: Text(
                        'Kritik & Saran',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 32.0), // Jarak antar bagian

                    Text(
                      'IKUTI KAMI',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.instagram, size: 40, color: Colors.white),
                        SizedBox(width: 16.0),
                        FaIcon(FontAwesomeIcons.whatsapp, size: 40, color: Colors.white),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}