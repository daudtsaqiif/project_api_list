import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_api_list/model/hospitals.dart';
import 'package:project_api_list/service/api_service.dart';
import 'package:project_api_list/service/api_service.dart';
import 'package:project_api_list/model/stats.dart';
import 'package:fl_chart/fl_chart.dart';

class MainScreen extends StatefulWidget {
  const MainScreen(
      {super.key,
      this.email,
      this.username,
      this.password,
      this.firstName,
      this.lastName});

  final String? username;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Future<List<Hospitals>?> hospitals = ApiService().getHospitals();
  final Future<Stats> stats = ApiService().getStats();
  final List<String> imgList = [
    'assets/images/rs.jpg',
    'assets/images/rs2.jpg',
    'assets/images/rs3.jpg',
    'assets/images/rs4.jpg',
    'assets/images/rs5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //name profile header
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'stay healthy!',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        Judul(
                          judul: '${widget.username}',
                        ),
                      ],
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(8), //jika image mau kotak
                        image: DecorationImage(
                          image: AssetImage('assets/images/image_user.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //card corona info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 53, 156, 230),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Coronavirus atau lazim disebut COVID-19',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/covid-19');
                                },
                                child: Text(
                                  'Learn more',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  elevation: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/covid.png',
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              //piechart
              FutureBuilder(
                future: stats,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return PieChatWidget(
                      number: snapshot.data!.numbers,
                    );
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              //serch bar
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //Our Information slider
              Row(
                children: [
                  Judul(
                    judul: 'Our Information',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(Icons.info_outline),
                  )
                ],
              ),
              SizedBox(
                height: 9,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 98,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/hoaxes');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warning,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Hoaxes',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 98,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/hospitals');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_hospital_sharp,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Hospital',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 98,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/news');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.newspaper,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'News',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 98,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/stats');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.bar_chart,
                                size: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Stats',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //popular hospital
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Judul(
                        judul: 'Popular Hospitals',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Icon(Icons.local_hospital),
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/hospitals');
                    },
                    child: const Text(
                      'See More..',
                      style: TextStyle(
                        color: Colors.blueAccent, // Warna teks
                        fontSize: 16.0, // Ukuran teks
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              FutureBuilder(
                future: hospitals,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 240.0,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                      ),
                      itemBuilder:
                          (BuildContext builder, int index, int pageViewIndex) {
                        return HospitalInfo(
                          img: imgList[index],
                          text: snapshot.data?[index].name,
                          provinsi: snapshot.data?[index].region,
                        );
                      },
                      itemCount: imgList.length,
                    );
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16, // Ukuran font yang lebih besar
                    fontWeight: FontWeight.bold, // Teks tebal
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Warna latar tombol
                  foregroundColor: Colors.white, // Warna teks dan ikon
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Membuat tombol bulat
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15), // Ukuran padding yang proporsional
                  shadowColor: Colors.black
                      .withOpacity(0.3), // Warna bayangan lebih halus
                  elevation: 8, // Efek bayangan lebih tinggi
                  minimumSize: Size(150,
                      50), // Ukuran minimum lebih besar untuk tombol yang lebih enak dilihat
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HospitalInfo extends StatelessWidget {
  const HospitalInfo({super.key, this.img, this.provinsi, this.text});

  final String? text;
  final String? img;
  final String? provinsi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                img.toString(),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 135,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      text.toString(),
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      provinsi.toString(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
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

class Judul extends StatelessWidget {
  const Judul({super.key, this.judul});

  final String? judul;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            children: [
              Text(
                judul.toString(),
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(221, 19, 19, 19)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PieChatWidget extends StatelessWidget {
  const PieChatWidget({
    super.key,
    this.number,
  });

  final Numbers? number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 230,
          height: 230,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 5,
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 2,
              sections: [
                PieChartSectionData(
                  value: number?.fatal!.toDouble(),
                  color: Colors.red[900],
                  radius: 100,
                  title: '',
                ),
                PieChartSectionData(
                  value: number?.infected!.toDouble(),
                  color: Colors.yellow[800],
                  radius: 100,
                ),
                PieChartSectionData(
                  value: number?.recovered!.toDouble(),
                  color: Colors.green[900],
                  radius: 100,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    color: Colors.yellow[800],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Infected",
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    color: Colors.green[900],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Recovered",
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    color: Colors.red[900],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Fatal",
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
