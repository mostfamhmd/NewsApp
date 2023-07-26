import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.content, required this.description, required this.image});
  final String content;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover
              )
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*8/812, horizontal: MediaQuery.of(context).size.width*15/375),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/arrow back.svg',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height*374/812,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(24),topLeft: Radius.circular(24))
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*80/812,right: MediaQuery.of(context).size.width*15/375,left: MediaQuery.of(context).size.width*15/375,),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(content, style: const TextStyle(color: Color(0xFF2E0505), fontSize: 14, fontWeight: FontWeight.w600, fontFamily: "Nunito"))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height*246/812,
                          left: MediaQuery.of(context).size.width*289/375,
                          child: FloatingActionButton(
                            onPressed: (){},
                            backgroundColor: Colors.red,
                            child: SvgPicture.asset("assets/favorite_icon.svg"),
                          )
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*295/812, horizontal: MediaQuery.of(context).size.width*32/375),
                  child :Container(
                    height: MediaQuery.of(context).size.height*141/812,
                    width: MediaQuery.of(context).size.width*311/375,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                        child: Container(
                            decoration: BoxDecoration(color: Color(0xffF5F5F5).withOpacity(0.0)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*14/375,horizontal: MediaQuery.of(context).size.width*24/812,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(description, style: const TextStyle(color: Color(0xFF2E0505), fontSize: 12, fontWeight: FontWeight.w600, fontFamily: "Nunito"),)
                              ],
                            ),
                          ),
                  ),
              ),
                    )
                  )) ],
          ),
        )
      ),
    );
  }
}
/*MediaQuery.of(context).size.height*80/812,
right: MediaQuery.of(context).size.width*15/375,*/