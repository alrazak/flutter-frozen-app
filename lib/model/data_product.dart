class DataProduct {
  String name;
  String price;
  String description;
  String nutritionalContent;
  String imageAsset;
  List<String> imageUrls;

  DataProduct({
    required this.name,
    required this.price,
    required this.description,
    required this.nutritionalContent,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var dataProductList = [
  DataProduct(
    name: 'Kentang (500 gram)',
    price: 'Rp 35.000',
    description: 'Kentang siap masak dengan potongan french fries atau wedges. Sudah dibumbui ringan, sehingga mudah disiapkan untuk camilan atau pendamping steak. Nikmati dengan saus favoritmu!',
    nutritionalContent: 'Kentang mengandung 120 kalori per 100 gram, membuatnya menjadi camilan ringan yang cocok untuk semua usia. Kandungan protein sebesar 2 gram membantu melengkapi kebutuhan harian, sementara lemak sebesar 3 gram memberikan tekstur renyah setelah digoreng. Dengan 22 gram karbohidrat, kentang ini menjadi sumber energi yang baik, dan sodium sebesar 200 mg memberikan rasa gurih yang seimbang.',
    imageAsset: 'assets/images/potato.jpg',
    imageUrls: [
      'https://down-id.img.susercontent.com/file/8040de8275e2d0a4d3ef7bfb41afccbd',
      'https://cdn1.productnation.co/optimized/960w/stg/sites/5/5c5391864d86d.jpeg',
      'https://akcdn.detik.net.id/visual/2021/03/03/kentang-goreng_169.jpeg?w=750&q=90',
    ],
  ),
  DataProduct(
    name: 'Chikuwa (250 gram)',
    price: 'Rp 30.000',
    description: 'Chikuwa adalah camilan tradisional Jepang berbentuk tabung, terbuat dari adonan ikan yang dihaluskan dan dimasak hingga matang. Memiliki tekstur kenyal dengan rasa gurih. Cocok sebagai pelengkap sup, gorengan, atau hidangan tumis.',
    nutritionalContent: 'Chikuwa mengandung 140 kalori per 100 gram, dengan 12 gram protein yang baik untuk membantu memperbaiki jaringan tubuh. Kandungan lemaknya yang rendah, hanya 2 gram, membuatnya menjadi pilihan camilan sehat. Selain itu, terdapat 19 gram karbohidrat sebagai sumber energi, dan sodium sebanyak 800 mg yang memberikan rasa gurih tanpa memerlukan banyak tambahan bumbu.',
    imageAsset: 'assets/images/chikua.jpg',
    imageUrls: [
      'https://cdn.store-assets.com/s/352029/i/57611809.jpeg?width=1024',
      'https://down-id.img.susercontent.com/file/id-11134201-23030-3444fiimtqov36',
      'https://blog.cove.id/content/images/2023/02/chikuwa.webp',
    ],
  ),
  DataProduct(
    name: 'Kanzler (300 gram)',
    price: 'Rp 55.000',
    description: 'Kanzler berbahan dasar daging sapi berkualitas dengan bumbu khas Eropa. Memiliki tekstur lembut dan rasa otentik. Varian populer termasuk bratwurst dan cheese sausage. Nikmati dengan dipanggang, digoreng, atau sebagai isian sandwich.',
    nutritionalContent: 'Kanzler memiliki 260 kalori per 100 gram, cocok sebagai pilihan untuk menu utama. Dengan 10 gram protein, sosis ini menjadi sumber protein hewani yang baik. Kandungan lemaknya sebesar 22 gram memberikan rasa gurih yang kaya, sementara kandungan karbohidratnya yang rendah, hanya 4 gram, cocok untuk diet rendah karbohidrat. Sodium sebanyak 700 mg melengkapi cita rasa khasnya.',
    imageAsset: 'assets/images/kanzler.jpg',
    imageUrls: [
      'https://down-id.img.susercontent.com/file/sg-11134201-23010-nct0phfcvymv4c',
      'https://images.tokopedia.net/img/cache/700/VqbcmM/2024/6/9/570b35c0-042f-4eb6-aae5-5f2128985f26.png',
      'https://down-id.img.susercontent.com/file/id-11134207-7r98z-ln6u3ryzjd2559',
    ],
  ),
  DataProduct(
    name: 'Sosis (250 gram)',
    price: 'Rp 30.000',
    description: 'Sosis ayam atau sapi dengan ukuran kecil hingga sedang, praktis untuk sarapan, bekal anak, atau menu masakan. Bisa digoreng, direbus, atau dipanggang sesuai selera.',
    nutritionalContent: 'Sosis mengandung 150 kalori per 100 gram, menjadikannya camilan praktis dengan kalori yang pas. Dengan kandungan protein sebesar 9 gram, sosis ini dapat membantu memenuhi kebutuhan harian. Lemaknya sebesar 11 gram memberikan rasa yang lezat, sedangkan karbohidratnya hanya 4 gram, menjadikannya cocok untuk diet rendah karbohidrat. Sodium sebanyak 450 mg menambahkan rasa yang pas tanpa membuatnya terlalu asin.',
    imageAsset: 'assets/images/sosis.jpg',
    imageUrls: [
      'https://i0.wp.com/i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/1e069ec0-3540-4a3e-a941-f54689481c9a_IMG_20200920_001613_770.jpg',
      'https://ecs7-p.tokopedia.net/img/cache/300/VqbcmM/2020/12/31/601bdd21-0508-452f-a10c-7f3f14980803.jpg',
      'https://3.bp.blogspot.com/-BO045Sf5rOA/T45zwOx2kSI/AAAAAAAAALA/Q0BACiW4gy0/s1600/bulaf+cocktail.JPG',
    ],
  ),
];
