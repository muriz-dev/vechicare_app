import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/vehicle_model.dart';
import 'vehicle_card.dart';

class VehicleCarousel extends StatefulWidget {
  final List<VehicleModel> vehicles;
  final Function(int)? onPageChanged;

  const VehicleCarousel({
    super.key,
    required this.vehicles,
    this.onPageChanged,
  });

  @override
  State<VehicleCarousel> createState() => _VehicleCarouselState();
}

class _VehicleCarouselState extends State<VehicleCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            enableInfiniteScroll: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
              if (widget.onPageChanged != null) {
                widget.onPageChanged!(index);
              }
            },
          ),
          items: widget.vehicles.map((vehicle) {
            return VehicleCard(vehicle: vehicle);
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.vehicles.asMap().entries.map((entry) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withValues(
                          alpha: _currentIndex == entry.key ? 0.9 : 0.4,
                        ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
