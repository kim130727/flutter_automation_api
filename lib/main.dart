import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Model>> main() async {
  const String baseUrl = "https://notion-api.splitbee.io/v1/table";
  const String today = "96006eaeb0d640b385b2693dc8f77ac8";

  List<Model> instances = [];
  final url = Uri.parse('$baseUrl/$today');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final List<dynamic> cells = jsonDecode(utf8.decode(response.bodyBytes));
    print(cells[1]['출처']);
    print(cells[1]['출처'].runtimeType);
    for (var cell in cells) {
      instances.add(Model.fromJson(cell));
      print(cell['출처']);
      print(cell['지문']);
    }
    print(instances);
    return instances;
  }
  throw Error();
}

/* class Model {
  final String cell1;
  Model({
    required this.cell1,
  });
} */

class Model {
  final String cell1;
  Model.fromJson(Map<String, dynamic> json) : cell1 = json['출처'];
}
