import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Country {
  final int id;
  final String name;
  final String code;
  final String phonecode;
  final String flag;

  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.phonecode,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      phonecode: json['phonecode'],
      flag: json['flag'],
    );
  }
}

class CountryService {
  static const String apiUrl = "http://192.168.1.61:3000/api/user/countrieslist"; // Replace with your API endpoint

  static Future<List<Country>> fetchCountryData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load country data');
    }
  }
}

class CountryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Details'),
      ),
      body: FutureBuilder<List<Country>>(
        future: CountryService.fetchCountryData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final countries = snapshot.data!;

            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];

                return ListTile(
                  title: Text('Country Name: ${country.name}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Country Code: ${country.code}'),
                      Text('Phone Code: ${country.phonecode}'),
                    ],
                  ),
                  leading: Image.network(country.flag, height: 50, width: 50),
                );
              },
            );
          }
        },
      ),
    );
  }
}
