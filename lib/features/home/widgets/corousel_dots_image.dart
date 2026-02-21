import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class ImageCarouselWithDots extends StatefulWidget {
  const ImageCarouselWithDots({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageCarouselWithDotsState createState() => _ImageCarouselWithDotsState();
}

class _ImageCarouselWithDotsState extends State<ImageCarouselWithDots> {
  int _currentPosition = 0;

  final List<String> imgList = [
    'assets/images/ara.png',
    'assets/images/hotel.png',
    'assets/images/flight.png',
    'assets/images/taxi.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map((item) => Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blueAccent, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPosition = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        DotsIndicator(
          dotsCount: imgList.isEmpty ? 1 : imgList.length,
          position: _currentPosition.toDouble(),
          decorator: DotsDecorator(
            color: Colors.grey,
            activeColor: Colors.blue,
            size: const Size.square(8.0),
            activeSize: const Size(20.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
