import 'package:big_cart/mouckData/mouckData.dart';
import 'package:big_cart/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 120,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: catList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 800),
                        type: PageTransitionType.leftToRight,
                        child: catList[index].widget));
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: catList[index].color,
                        borderRadius: BorderRadius.circular(50)),
                    child: SvgPicture.asset(
                      catList[index].imageUrl,
                      fit: BoxFit.none,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Text(
                    catList[index].title,
                    style: TextStyle(
                        color: lightgrey, fontFamily: popin, fontSize: 12),
                  )
                ],
              ),
            );
          }),
    );
  }
}
