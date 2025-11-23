import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sih_shetkari/l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class DiseaseDetection extends StatefulWidget {
  const DiseaseDetection({super.key});

  @override
  State<DiseaseDetection> createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? _diseaseName;
  String? _recommendations;
  bool _isLoading = false;
  bool _showRecommendations = false;

  final String apiUrl = 'https://vansh180-daksh159-plant-disease-api.hf.space/predict';

  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image first')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _diseaseName = null;
    });

    try {
      print("Sending image to blockchain-secured backend...");

      // Read bytes directly from XFile to avoid path issues
      final bytes = await _image!.readAsBytes();
      
      final request = http.MultipartRequest(
        'POST', 
        Uri.parse('http://10.10.122.104:8000/verify-and-store')
      );
      
      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          bytes,
          filename: 'upload.jpg',
        ),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        
        final String prediction = jsonResponse['prediction'];
        final double confidence = jsonResponse['confidence'];
        final String pendingTx = jsonResponse['pending_tx'];
        final String updateTx = jsonResponse['update_tx'];
        final String recommendations = jsonResponse['recommendations'] ?? 'No recommendations available';

        setState(() {
          _diseaseName = "$prediction (${(confidence * 100).toStringAsFixed(1)}%)\n\n" +
                        "🔐 Blockchain Verified\n" +
                        "📝 Hash: ${jsonResponse['hash'].substring(0, 16)}...\n" +
                        "⛓️ TX: ${updateTx.substring(0, 16)}...";
          _recommendations = recommendations;
          _showRecommendations = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image verified on blockchain!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server Error: ${response.statusCode}')),
        );
      }
    } catch (e) {
      print("Error occurred: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: const Duration(seconds: 5),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    if (localizations == null) {
      return const Text('Localization not available');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text(
            localizations.page2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Merriweather",
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Identify crop diseases with ease! Upload a photo of your plant, and our AI-powered tool will detect the disease and provide preventive measures to protect your crops and ensure a healthy harvest.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Mergeone",
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _pickImageFromCamera,
              icon: const Icon(Icons.camera_alt),
              label: const Text(
                "Click an Image from Camera",
                style: TextStyle(
                    fontFamily: "Mergeone", fontSize: 16, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A9F5D),
                iconColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _pickImageFromGallery,
              icon: const Icon(Icons.photo_library),
              label: const Text(
                "Upload an Image from Gallery",
                style: TextStyle(
                    fontFamily: "Mergeone", fontSize: 16, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A9F5D),
                iconColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: _uploadImage,
              label: const Text(
                "Submit",
                style: TextStyle(
                    fontFamily: "Mergeone", fontSize: 16, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A9F5D),
                iconColor: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_diseaseName != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Disease Detected: $_diseaseName',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Merriweather",
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 85, 56),
                  ),
                ),
              ),
            const SizedBox(height: 10),
            // AI Recommendations Card
            if (_recommendations != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.psychology, color: Color(0xFF2A9F5D)),
                        title: const Text(
                          '🤖 AI Agricultural Recommendations',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        trailing: Icon(
                          _showRecommendations
                              ? Icons.expand_less
                              : Icons.expand_more,
                        ),
                        onTap: () {
                          setState(() {
                            _showRecommendations = !_showRecommendations;
                          });
                        },
                      ),
                      if (_showRecommendations)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              _recommendations!,
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 5),
            if (_image != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade900.withOpacity(0.5),
                        blurRadius: 1,
                        spreadRadius: 5,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.file(
                      File(_image!.path),
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
