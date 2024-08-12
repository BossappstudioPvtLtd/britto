import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_app/new/data/locations.dart'; // Make sure this path is correct
import 'location_widget.dart'; // Import your LocationWidget

class LocationsWidget extends StatefulWidget {
  const LocationsWidget({super.key});

  @override
  _LocationsWidgetState createState() => _LocationsWidgetState();
}

class _LocationsWidgetState extends State<LocationsWidget> {
  int pageIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider.builder(
            carouselController: _controller,
            itemCount: locations.length,
            itemBuilder: (context, index, realIndex) {
              final location = locations[index];
              return LocationWidget(location: location);
            },
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  pageIndex = index;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:20 ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: locations.asMap().entries.map((entry) {
              final bool isActive = pageIndex == entry.key;
              final Color baseColor = Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey
                  : const Color.fromARGB(255, 255, 255, 255);
              final HSVColor hsvColor = HSVColor.fromColor(baseColor);
              final Color adjustedColor = hsvColor
                  .withSaturation(isActive ? hsvColor.saturation : hsvColor.saturation * 0.3)
                  .toColor();
          
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 10.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: adjustedColor.withOpacity(isActive ? 0.7 : 0.2),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            '${pageIndex + 1}/${locations.length}',
            style: const TextStyle(color: Colors.white70),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
