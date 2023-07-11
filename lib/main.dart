import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:docx_template/docx_template.dart';

Future<List<Model>> main() async {
  const String baseUrl = "https://notion-api.splitbee.io/v1/table";
  const String today = "96006eaeb0d640b385b2693dc8f77ac8";

  final f = File("lib/template.docx");
  final docx = await DocxTemplate.fromBytes(await f.readAsBytes());

  List<Model> instances = [];
  final url = Uri.parse('$baseUrl/$today');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> cells = jsonDecode(utf8.decode(response.bodyBytes));
    //print(cells[1]['출처']);
    //print(cells[1]['출처'].runtimeType);
    for (var cell in cells) {
      instances.add(Model.fromJson(cell));
      String? text0001 = cell['출처'];
      text0001 ??= "";
      String? text0002 = cell['지문'];
      text0002 ??= "";
      String? text0003 = cell['별표1'];
      if (text0003 != null) {
        text0003 = "*$text0003";
      } else {
        text0003 = "";
      }
      String? text0004 = cell['별표2'];
      if (text0004 != null) {
        text0004 = "**$text0004";
      } else {
        text0004 = "";
      }
      String? text0005 = cell['별표3'];
      if (text0005 != null) {
        text0005 = "***$text0005";
      } else {
        text0005 = "";
      }
      String? text0006 = cell['정답'];
      if (text0006 != null) {
        text0006 = "[정답] $text0006";
      } else {
        text0006 = "[정답]";
      }
      String? text0007 = cell['소재'];
      if (text0007 != null) {
        text0007 = "[소재] $text0007";
      } else {
        text0007 = "[소재]";
      }
      String? text0008 = cell['해석'];
      if (text0008 != null) {
        text0008 = "[해석] $text0008";
      } else {
        text0008 = "[해석]";
      }
      String? text0009 = cell['해설'];
      if (text0009 != null) {
        text0009 = "[해설] $text0009";
      } else {
        text0009 = "[해설]";
      }
      String? text0010 = cell['어휘1'];
      if (text0010 != null) {
        text0010 = "□ $text0010";
      } else {
        text0010 = "";
      }
      String? text0011 = cell['뜻1'];
      text0011 ??= "";
      String? text0012 = cell['어휘2'];
      if (text0012 != null) {
        text0012 = "□ $text0012";
      } else {
        text0012 = "";
      }
      String? text0013 = cell['뜻2'];
      text0013 ??= "";
      String? text0014 = cell['어휘3'];
      if (text0014 != null) {
        text0014 = "□ $text0014";
      } else {
        text0014 = "";
      }
      String? text0015 = cell['뜻3'];
      text0015 ??= "";
      String? text0016 = cell['어휘4'];
      if (text0016 != null) {
        text0016 = "□ $text0016";
      } else {
        text0016 = "";
      }
      String? text0017 = cell['뜻4'];
      text0017 ??= "";
      String? text0018 = cell['어휘5'];
      if (text0018 != null) {
        text0018 = "□ $text0018";
      } else {
        text0018 = "";
      }
      String? text0019 = cell['뜻5'];
      text0019 ??= "";
      String? text0020 = cell['어휘6'];
      if (text0020 != null) {
        text0020 = "□ $text0020";
      } else {
        text0020 = "";
      }
      String? text0021 = cell['뜻6'];
      text0021 ??= "";
      String? text0022 = cell['어휘7'];
      if (text0022 != null) {
        text0022 = "□ $text0022";
      } else {
        text0022 = "";
      }
      String? text0023 = cell['뜻7'];
      text0023 ??= "";
      String? text0024 = cell['어휘8'];
      if (text0024 != null) {
        text0024 = "□ $text0024";
      } else {
        text0024 = "";
      }
      String? text0025 = cell['뜻8'];
      text0025 ??= "";
      String? text0026 = cell['어휘9'];
      if (text0026 != null) {
        text0026 = "□ $text0026";
      } else {
        text0026 = "";
      }
      String? text0027 = cell['뜻9'];
      text0027 ??= "";

      print(text0001);
      //print(cell['출처']);
      //print(cell['지문']);
      Content content = Content();
      content
        ..add(TextContent("0001", text0001))
        ..add(TextContent("0002", text0002))
        ..add(TextContent("0003", text0003))
        ..add(TextContent("0004", text0004))
        ..add(TextContent("0005", text0005))
        ..add(TextContent("0006", text0006))
        ..add(TextContent("0007", text0007))
        ..add(TextContent("0008", text0008))
        ..add(TextContent("0009", text0009))
        ..add(TextContent("0010", text0010))
        ..add(TextContent("0011", text0011))
        ..add(TextContent("0012", text0012))
        ..add(TextContent("0013", text0013))
        ..add(TextContent("0014", text0014))
        ..add(TextContent("0015", text0015))
        ..add(TextContent("0016", text0016))
        ..add(TextContent("0017", text0017))
        ..add(TextContent("0018", text0018))
        ..add(TextContent("0019", text0019))
        ..add(TextContent("0020", text0020))
        ..add(TextContent("0021", text0021))
        ..add(TextContent("0022", text0022))
        ..add(TextContent("0023", text0023))
        ..add(TextContent("0024", text0024))
        ..add(TextContent("0025", text0025))
        ..add(TextContent("0026", text0026))
        ..add(TextContent("0027", text0027));

      final docGenerated = await docx.generate(content);
      final fileGenerated = File('result/${cell['출처']}_generated.docx');
      if (docGenerated != null) await fileGenerated.writeAsBytes(docGenerated);
    }
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
