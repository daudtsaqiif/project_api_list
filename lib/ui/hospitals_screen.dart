import 'package:flutter/material.dart';
import 'package:project_api_list/service/api_service.dart';

import '../model/hospitals.dart';

class HospitalsScreen extends StatefulWidget {
  const HospitalsScreen({super.key});

  @override
  State<HospitalsScreen> createState() => _HospitalsScreenState();
}

class _HospitalsScreenState extends State<HospitalsScreen> {
  final Future<List<Hospitals>?> hospitals = ApiService().getHospitals();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospitals Information'),
      ),
      body: FutureBuilder(
        future: hospitals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                  },
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${snapshot.data?[index].name}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                'Alamat: ${snapshot.data?[index].address}',
                                style: TextStyle(color: Colors.white, fontSize: 17),
                              ),
                              Text(
                                'Daerah: ${snapshot.data?[index].region}',
                                style: TextStyle(color: Colors.white, fontSize: 17),
                              ),Text(
                                'Provinsi: ${snapshot.data?[index].province}',
                                style: TextStyle(color: Colors.white, fontSize: 17),
                              ),
                              Text(
                                'No Tlp: ${snapshot.data?[index].phone}',
                                style: TextStyle(color: Colors.white, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data?.length,
            );
          }
        },
      ),
    );
  }
}
