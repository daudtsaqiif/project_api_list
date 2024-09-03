import 'dart:convert';
import 'package:project_api_list/config/config.dart';
import 'package:project_api_list/model/hoaxes.dart';

import 'package:http/http.dart' as http;
import 'package:project_api_list/model/hospitals.dart';
import 'package:project_api_list/model/news.dart';
import 'package:project_api_list/model/stats.dart';

class ApiService {
  Future<List<Hoaxes>?> getHoaxes() async {
    var url = Uri.parse('${baseURL}hoaxes');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jasonResponse = jsonDecode(response.body);
      return jasonResponse.map((hoax) => Hoaxes.fromJson(hoax)).toList();
    } else {
      print('Request gagal dengan status: ${response.statusCode}.');
      return null;
    }
  }

  Future<List<Hospitals>?> getHospitals() async {
    var url = Uri.parse('${baseURL}hospitals');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jasonResponse = jsonDecode(response.body);
      return jasonResponse
          .map((hospital) => Hospitals.fromJson(hospital))
          .toList();
    } else {
      print('Request gagal dengan status: ${response.statusCode}.');
      return null;
    }
  }

  Future<List<News>?> getNews() async {
    var url = Uri.parse('${baseURL}news');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jasonResponse = jsonDecode(response.body);
      return jasonResponse.map((news) => News.fromJson(news)).toList();
    } else {
      print('Request gagal dengan status: ${response.statusCode}.');
      return null;
    }
  }

  // Future<List<Stats>?> getStats() async {
  //   var url = Uri.parse('${baseURL}stats');
  //   print(url);

  //   var response = await http.get(url);
  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     List<dynamic> jasonResponse = jsonDecode(response.body);
  //     return jasonResponse.map((stats) => Stats.fromJson(stats)).toList();
  //   } else {
  //     print('Request gagal dengan status: ${response.statusCode}.');
  //     return null;
  //   }
  // }
  Future<Stats> getStats() async {
    var url = Uri.parse('${baseURL}stats');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      return statsFromJson(response.body);
    } else {
      throw Exception('failed to load');
    }
  }
}
