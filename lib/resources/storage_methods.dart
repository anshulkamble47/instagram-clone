import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class CloudinaryMethods {
  static Future<String> uploadImage(Uint8List imageBytes) async {
    const cloudName = 'deui2ha34';
    const uploadPreset = 'Insta_clone_cloudinary';

    final url = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: 'profile_pic.jpg',
      ));

    final response = await request.send();
    final resStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return json.decode(resStr)['secure_url'];
    } else {
      throw Exception("Cloudinary upload failed: $resStr");
    }
  }
}
