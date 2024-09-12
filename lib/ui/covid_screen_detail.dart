import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CovidScreenDetail extends StatelessWidget {
  const CovidScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFedf4ff),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Gambar Covid-19 yang disesuaikan dengan layar
                Image.asset(
                  'assets/images/covid19-.jpg',
                  width: screenWidth, // Menyesuaikan dengan lebar layar
                  fit: BoxFit.cover, // Agar gambar memenuhi seluruh lebar
                  height: 260, // Menentukan tinggi gambar
                ),
                // Konten setelah gambar
                Container(
                  // Tinggi container menyesuaikan sisa layar
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        'Covid-19',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Coronavirus',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ReadMoreText(
                        'COVID-19, yang juga disebut penyakit koronavirus 2019, adalah penyakit yang disebabkan oleh virus. Virus ini disebut sindrom pernapasan akut berat koronavirus 2, atau yang lebih umum disebut SARS-CoV-2. Virus ini mulai menyebar pada akhir tahun 2019 dan menjadi penyakit pandemi pada tahun 2020.\n\n'
                        'Virus penyebab COVID-19 paling sering menyebar melalui udara dalam bentuk tetesan cairan kecil di antara orang-orang yang berkontak dekat. Banyak orang yang terjangkit COVID-19 tidak menunjukkan gejala atau sakitnya ringan. Namun, bagi orang dewasa yang lebih tua dan orang-orang dengan kondisi medis tertentu, COVID-19 dapat menyebabkan perlunya perawatan di rumah sakit atau kematian.\n\n'
                        'Tetap mendapatkan vaksin COVID-19 membantu mencegah penyakit serius, perlunya perawatan di rumah sakit karena COVID-19, dan kematian akibat COVID-19 . Cara lain yang dapat membantu mencegah penyebaran virus corona ini meliputi aliran udara dalam ruangan yang baik, menjaga jarak fisik, mengenakan masker di tempat yang tepat, dan menjaga kebersihan.\n\n'
                        'Obat dapat membatasi keseriusan infeksi virus. Kebanyakan orang pulih tanpa efek jangka panjang, tetapi beberapa orang memiliki gejala yang berlanjut selama berbulan-bulan.',
                        trimLines: 10,
                        colorClickableText: Colors.blue,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: 'Show less',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        moreStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        lessStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'See The Stats In Indonesia',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/stats');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Color(0xFF4A90E2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Stats',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Tombol Kembali
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
