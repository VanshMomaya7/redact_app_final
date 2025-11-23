import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class BlockchainService {
  // Point to the new backend
  final String backendUrl = "http://10.10.122.104:8000/verify-and-store";

  Future<Map<String, dynamic>> verifyAndStore(Uint8List imageBytes) async {
    var request = http.MultipartRequest('POST', Uri.parse(backendUrl));
    
    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: 'upload.jpg',
      ),
    );

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to verify and store record: ${response.body}');
    }
  }
}
