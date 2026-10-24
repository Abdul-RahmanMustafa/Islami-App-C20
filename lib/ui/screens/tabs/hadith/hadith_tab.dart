import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/tabs/hadith/widget/hadith_item.dart';
import 'package:islami_app/utils/size_utils.dart';

class HadithTab extends StatelessWidget {
  HadithTab({super.key});

  List<int>numbers = List.generate(50, ((index) => index + 1));
  


  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return CarouselSlider(
        items: numbers.map((index) {
          return HadithItem(index: index,);
        }).toList(),
        options: CarouselOptions(
          height: height * 0.66,
          enlargeCenterPage: true,
        ));
  }
}
