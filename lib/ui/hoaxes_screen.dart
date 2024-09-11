import 'package:flutter/material.dart';
import 'package:project_api_list/service/api_service.dart';
import 'package:intl/intl.dart';

import '../model/hoaxes.dart';

class HoaxesScreen extends StatefulWidget {
  const HoaxesScreen({super.key});

  @override
  State<HoaxesScreen> createState() => _HoaxesScreenState();
}

class _HoaxesScreenState extends State<HoaxesScreen> {
  final Future<List<Hoaxes>?> hoaxes = ApiService().getHoaxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoaxes Information'),
      ),
      body: FutureBuilder(
        future: hoaxes,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 6,
                      shadowColor: Colors.black.withOpacity(0.2),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors
                              .redAccent, // Warna latar belakang yang lebih cerah
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${snapshot.data?[index].title}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Divider(
                              color: Colors.black.withOpacity(0.3),
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  DateFormat('dd/MM/yyyy').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        snapshot.data?[index].timestamp ?? 0),
                                  ),
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
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
