import 'package:http/http.dart' as http;
import 'dart:convert';
import '../login/loginView.controller.dart';

Future<List> fetchHistorico(String idPet, String data) async {
  final response = await http.get(Uri.parse('https://flasktest-f17y.onrender.com/historico?idPet=$idPet&data=$data'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}


Future<List> fetchGetPet() async {
  final response = await http.get(Uri.parse('https://flasktest-f17y.onrender.com/getPets?IDdono=${GlobalVariables().IDdono}'));

  if (response.statusCode == 200) {
    Map<String, dynamic> responseBody = json.decode(response.body);
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

class Pet {
  final int id;
  final String nome;

  Pet({required this.id, required this.nome});

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
