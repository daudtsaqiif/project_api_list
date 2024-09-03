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
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${snapshot.data?[index].title}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    style: TextStyle(color: Colors.white),
                                    DateFormat('dd/MM/yyyy').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          snapshot.data?[index].timestamp ?? 0),
                                    ),
                                  ),
                                ],
                              ),
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
