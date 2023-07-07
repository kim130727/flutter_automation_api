import 'dart:convert' show utf8;
import 'package:http/http.dart' as http;

void main() async {
  const String baseUrl = "https://notion-api.splitbee.io/v1/table";
  const String today = "96006eaeb0d640b385b2693dc8f77ac8";

  final url = Uri.parse('$baseUrl/$today');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    print(utf8.decode(response.bodyBytes));
    return;
  }
  throw Error();
}
