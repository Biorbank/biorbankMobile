  
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselImageWidget extends StatelessWidget {
  const CarouselImageWidget({
    super.key,
    required this.carouselController,
    required this.images,
  });

  final CarouselController carouselController;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 311.h,
      child: CarouselSlider(
        key: ValueKey(DateTime.now()
            .millisecondsSinceEpoch),
        carouselController: carouselController,
        items: List.generate(
          images.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 4),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: images[index],
                height: 311.h,
                width: 311.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox.shrink(),
              ),
            ),
          ),
        ),
        options: CarouselOptions(
          initialPage: 0,
          onPageChanged: (index, reason) {
            // controller.onChangeImageIndex(index);
          },
          autoPlay: false,
          viewportFraction: 1.0,
          height: double.maxFinite,
        ),
      ),
    );
  }
}

