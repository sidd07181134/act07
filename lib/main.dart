import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fading Text and Image Frame Animation',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const FadingTextAnimation(),
    );
  }
}

class FadingTextAnimation extends StatefulWidget {
  const FadingTextAnimation({super.key});

  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> {
  bool _isVisible = true; // For fading text visibility
  bool _showFrame = false; // For toggling the frame around the image

  // Function to toggle text visibility
  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  // Function to toggle the image frame
  void toggleFrame(bool value) {
    setState(() {
      _showFrame = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fading Text Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Fading Text
          Center(
            child: GestureDetector(
              onTap: toggleVisibility,
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut, // Smoother animation with ease-in-out curve
                child: const Text(
                  'Hello, Flutter!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          // Switch for toggling frame around the image
          SwitchListTile(
            title: const Text('Show Frame'),
            value: _showFrame,
            onChanged: toggleFrame,
          ),
          const SizedBox(height: 20),
          // Image with optional frame
          Container(
            decoration: _showFrame
                ? BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 4.0),
                    borderRadius: BorderRadius.circular(15),
                  )
                : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://flutter.dev/images/catalog-widget-placeholder.png',
                height: 150,
                width: 150,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
