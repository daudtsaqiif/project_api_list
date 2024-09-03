import 'package:flutter/material.dart';
import 'package:project_api_list/model/news.dart';
import 'package:intl/intl.dart';

import '../service/api_service.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final Future<List<News>?> news = ApiService().getNews();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Information'),
      ),
      body: FutureBuilder(
        future: news,
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
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('${snapshot.data?[index].title}'),
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 6,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 233, 177, 24),
                              Color.fromARGB(255, 255, 230, 138),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
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
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500,
                                    ),
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
