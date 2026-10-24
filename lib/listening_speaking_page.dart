import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListeningSpeakingPage extends StatefulWidget {
  @override
  _ListeningSpeakingPageState createState() => _ListeningSpeakingPageState();
}

class _ListeningSpeakingPageState extends State<ListeningSpeakingPage> {
  bool isLoading = false;
  String aiResponse = "ಸ್ಟಾರ್ಟ್ ಬಟನ್ ಒತ್ತಿ AI ರೆಸ್ಪಾನ್ಸ್ ಪಡೆಯಿರಿ...";

  // Groq API ಕಾಲ್ ಮಾಡುವ ಫಂಕ್ಷನ್
  Future<void> fetchGroqResponse() async {
    setState(() {
      isLoading = true;
      aiResponse = "ಲೋಡ್ ಆಗುತ್ತಿದೆ...";
    });

    final apiKey = "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"; // ನಿಮ್ಮ Groq API Key ಇಲ್ಲಿ ಹಾಕಿ
    final url = Uri.parse('https://api.groq.com/openai/v1/chat/completions');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "llama3-8b-8192",
          "messages": [
            {
              "role": "user",
              "content": "Give me a simple English practice sentence with Kannada meaning for listening and speaking practice.",
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          aiResponse = data['choices'][0]['message']['content'];
          isLoading = false;
        });
      } else {
        setState(() {
          aiResponse = "ಎರರ್ ಬಂದಿದೆ. ಮತ್ತೊಮ್ಮೆ ಪ್ರಯತ್ನಿಸಿ.";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        aiResponse = "ಇಂಟರ್ನೆಟ್ ಕನೆಕ್ಷನ್ ಚೆಕ್ ಮಾಡಿ!";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[400],
      appBar: AppBar(
        title: Text("ಕೇಳುವುದು ಮತ್ತು ಉಚ್ಚರಿಸುವುದು"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.headphones, size: 80, color: Colors.white),
            SizedBox(height: 20),
            Text(
              "ಆಲಿಸಿ ಮತ್ತು ಸರಿಯಾಗಿ ಉಚ್ಚರಿಸಲು ಅಭ್ಯಾಸ ಮಾಡಿ.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 30),

            // AI ನಿಂದ ಬಂದ ರೆಸ್ಪಾನ್ಸ್ ತೋರಿಸುವ ಜಾಗ
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: isLoading
                  ? CircularProgressIndicator()
                  : Text(
                      aiResponse,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
            ),

            SizedBox(height: 40),

            // ಸ್ಟಾರ್ಟ್ (Start) ಬಟನ್
            ElevatedButton.icon(
              onPressed: fetchGroqResponse,
              icon: Icon(Icons.play_arrow, color: Colors.deepOrange),
              label: Text(
                "ಸ್ಟಾರ್ಟ್ (Start)",
                style: TextStyle(color: Colors.deepOrange, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
