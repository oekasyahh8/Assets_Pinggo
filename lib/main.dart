import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageSliderScreen(),
    );
  }
}

class ImageSliderScreen extends StatefulWidget {
  @override
  _ImageSliderScreenState createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Halaman aktif

  // Daftar path gambar lokal
  final List<String> images = [
    'assets/k3.gif',
    'assets/k1.jpg',
    'assets/k2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinggo Ukasyah Ferkasoe'),
        backgroundColor: const Color.fromARGB(255, 255, 193, 213),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 300, 
              height: 300, 
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: images.map((image) {
                  return Image.asset(
                    image,
                    fit: BoxFit.cover,
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index
                    ? 12
                    : 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentPage == index ? const Color.fromARGB(255, 255, 158, 190) : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
