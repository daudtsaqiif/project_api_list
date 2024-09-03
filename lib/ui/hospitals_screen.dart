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
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.3),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.cyan[800],
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${snapshot.data?[index].name}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Alamat: ${snapshot.data?[index].address}',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 16),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Daerah: ${snapshot.data?[index].region}',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 16),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Provinsi: ${snapshot.data?[index].province}',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 16),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'No Tlp: ${snapshot.data?[index].phone}',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 16),
                            ),
                          ],
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
