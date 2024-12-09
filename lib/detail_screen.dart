import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frozen_app/checkout/checkout_page.dart';
import 'package:frozen_app/home_screen.dart';
import 'package:frozen_app/model/data_product.dart';
import 'package:frozen_app/checkout/checkout_page.dart';

class DetailScreen extends StatefulWidget {
  @override
  final DataProduct place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;
  bool isWishlistAdded = false;
  bool isDescriptionExpanded = false;
  bool isAdditionalInfoExpanded = false;

  String? mainImage;

  void _showAddedToCartPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Berhasil'),
          content: Text('Produk berhasil ditambahkan ke keranjang.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup popup
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    mainImage = widget.place.imageAsset;
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: mainImage!.startsWith('http')
                      ? Image.network(mainImage!)
                        : Image.asset(mainImage!),
                  ),
                  Positioned(
                    top: 24.0,
                    left: 24.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.place.imageUrls.map((url) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            mainImage = url;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(url),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama Produk dan Harga
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.place.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            widget.place.price,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Tombol Kurangi dan Tambah Jumlah
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              minimumSize: Size(50, 50),
                            ),
                            child: Icon(Icons.remove),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              '$quantity',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              minimumSize: Size(50, 50)
                            ),
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Tombol Tambah ke Keranjang
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Tampilkan popup saat tombol ditekan
                          _showAddedToCartPopup(context);
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: Text('Tambah Keranjang'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Tombol Beli Sekarang
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutPage(),
                            ),
                          );
                        },
                        child: Text('Beli Sekarang'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )
                        )
                      ),
                    ),
                    SizedBox(height: 16.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {

                            },
                            icon: FaIcon(FontAwesomeIcons.whatsapp),
                            label: Text('Hubungi Kami'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius:  BorderRadius.zero,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                isWishlistAdded = !isWishlistAdded;
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isWishlistAdded ? Colors.red : Colors.grey,
                            ),
                            label: Text('Wishlist'),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50),
                                backgroundColor: Colors.white,
                                side: BorderSide(color: Colors.grey),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),

                    Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDescriptionExpanded = !isDescriptionExpanded;
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Deksripsi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Icon(
                                isDescriptionExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down
                            ),
                          ],
                        ),
                      )
                    ),
                    if (isDescriptionExpanded)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          widget.place.description,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),

                    Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),

                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isAdditionalInfoExpanded = !isAdditionalInfoExpanded;
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kandungan Gizi',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Icon(
                                  isAdditionalInfoExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down
                              ),
                            ],
                          ),
                        )
                    ),
                    if (isAdditionalInfoExpanded)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          widget.place.nutritionalContent,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),

                    Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),

                    GestureDetector(
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kategori : Produk Beku',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 20.0),

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