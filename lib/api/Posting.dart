import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class PostingController {
  final String  baseUrl = "https://apimdl.000webhostapp.com/api/postings";

  Future<List<dynamic>> getPostings() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)["data"];
      return jsonData;
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  Future<Map<String,dynamic>> getDetail(int id) async {
    final response = await http.get(Uri.parse(baseUrl + '/$id'));
    if (response.statusCode == 200) {
      final Map<String,dynamic> jsonData = json.decode(response.body)["data"];
      return jsonData;
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  Future createPosting(String title, String description,String image) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.files.add(await http.MultipartFile.fromPath('image', image));

    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    return responseData;
  }

   Future updatePosting(int id,String title, String description,String image) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/$id'), // Ganti URL sesuai dengan endpoint update yang sesuai
    );

    final dataId = await getDetail(id);

    if (dataId != null) {
     request.fields['title'] = title;
     request.fields['description'] = description;

      if (image.isNotEmpty) {
        var imageFile = File(image);
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();

        var multipartFile = http.MultipartFile(
          'image',
          stream,
          length,
          filename: path.basename(imageFile.path),
        );

        request.files.add(multipartFile);
      }

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        print(responseData);
        print('Product updated successfully');
      } else {
        print('Failed to update product. Status code: ${response.statusCode}');
      }
    } else {
      print('Product not found');
    }
  }

   Future deletePosting(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/delete/$id'));
    var res = json.decode(response.body);
    print(res);
    return res;
  }

}