import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // Add this import statement

import '../screens/details_of_news.dart';
class News extends StatelessWidget {
  const News({super.key, required this.author, required this.title, required this.publishedAt, required this.image, required this.content, required this.description});
  final String author;
  final String title;
  final String publishedAt;
  final String image;
  final String content;
  final String description;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetails(
              content: content,
              description: description,
              image: image,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width*345/375,
              height: MediaQuery.of(context).size.height*240/812,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
                  child: Stack(
                    children:[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*80/812,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*16/375,),
                            child: Text(author , style: TextStyle(backgroundColor: Colors.black.withOpacity(0.5),color: Colors.white, fontFamily: "Nunito", fontWeight: FontWeight.w800),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*16/375,),
                            child: Text(title, style:  TextStyle(backgroundColor: Colors.black.withOpacity(0.5), color: Colors.white, fontFamily: "New York Small", fontWeight: FontWeight.w800),),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*39/812,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*16/375,),
                            child: Text(publishedAt, style: TextStyle(backgroundColor: Colors.black.withOpacity(0.5), color: Colors.white, fontFamily: "Nunito", fontWeight: FontWeight.w600, fontSize: 10),),
                          ),
                        ],
                      )
                    ]
                ),
      ),
    );
  }
}
