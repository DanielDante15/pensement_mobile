// import 'dart:convert';
// import 'package:pensement_mobile/utils/env.dart';
// import 'package:pensement_mobile/models/book.dart';
// import 'package:pensement_mobile/models/charpter.dart';
// import 'package:http/http.dart' as http;
// // import 'package:shared_preferences/shared_preferences.dart';

// class PensementApi extends UrlEnviroment {
//   PensementApi();

//   String url = UrlEnviroment().env;
//   Future<List<Book>> getBookList() async {
//     try {
//       final response = await http.get(
//         Uri.parse("$url/livros/"),
//       );
//       if (response.statusCode == 200) {
//         final List<dynamic> jsonList =
//             json.decode(const Utf8Decoder().convert(response.bodyBytes));
//         return jsonList.map((json) => Book.fromJson(json)).toList();
//       } else {
//         Map<String, dynamic> errorMsg = json.decode(response.body);
//         throw Exception(errorMsg["detail"]);
//       }
//     } catch (e) {
//       throw 'Error while loading books ';
//     }
//   }

//   Future<Charpter> getCharpter({args}) async {
//     try {
//       String path = args ?? "gn/1";

//       final response = await http.get(
//         Uri.parse("$url/$path"),
//       );
//       if (response.statusCode == 200) {
//         final jsonData =
//             json.decode(const Utf8Decoder().convert(response.bodyBytes));
//         final charpter = Charpter.fromJson(jsonData);
//         return charpter;
//       } else {
//         Map<String, dynamic> errorMsg = json.decode(response.body);
//         throw Exception(errorMsg["detail"]);
//       }
//     } catch (e) {
//       throw '$e';
//     }
//   }

//   Future<String> updateVerse(bool value, int id) async {
//     try {
//       final response = await http.patch(Uri.parse("$url/versiculos/$id/"),
//           body: {"isMarked": "$value"});
//       if (response.statusCode == 200) {
//         return response.body;
//       } else {
//         Map<String, dynamic> errorMsg = json.decode(response.body);
//         throw Exception(errorMsg["detail"]);
//       }
//     } catch (e) {
//       throw '$e';
//     }
//   }
// }
