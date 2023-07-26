import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '../comp/news.dart';
import '../data/cubit/news_app_state_cubit.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*15/375, vertical: MediaQuery.of(context).size.height*16/812),
        child : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Dogecoin to the Moon...",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                              'assets/search.svg',
                              width: 12,
                              height: 12,
                            ),
                        ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                        ),
                      ),
                    ),
                SizedBox(width: MediaQuery.of(context).size.width*15/375,),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: SvgPicture.asset(
                    'assets/bell.svg',
                    width: 5,
                    height: 5,
                  ),
                ),
              ],
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height*24/812,
          ),
           Center(
             child: ElevatedButton(
               onPressed: (){
                 context.read<NewsAppStateCubit>().getNews();
               },
               child: Text("Get News"),
             ),
           ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Latest News", style: TextStyle(fontFamily: "NewYorkSmall", fontSize: 18,fontWeight: FontWeight.w700),),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("See All", style: TextStyle(color: Color(0xFF0080FF), fontFamily: "Nunito", fontSize: 12, fontWeight: FontWeight.w600),),

                ],
              ),*/
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Text("See All", style: TextStyle(color: Color(0xFF0080FF), fontFamily: "Nunito", fontSize: 12, fontWeight: FontWeight.w600),),
                    SizedBox(width: MediaQuery.of(context).size.width*16/375,
                      child: SvgPicture.asset(
                        'assets/arrow.svg',
                        width: 10,
                        height: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*16/812,),
          BlocConsumer<NewsAppStateCubit, NewsAppStateState>(
            listener: (context, state) {
              // You can add any necessary listeners here if needed
            },
            builder: (context, state) {
              if (state is NewsAppStateInitial) {
                return const Center(child: Text("Press on Get News Button"),);
              } else if (state is NewsAppResponseLoading) {
                return const Center(child: CircularProgressIndicator(),);
              } else if (state is NewsAppResponseSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var news = state.ourData.articles[index];
                      return News(
                        author: news.author,
                        title: news.title,
                        publishedAt: news.publishedAt,
                        image: news.urlToImage,
                        content: news.content,
                        description: news.description,
                      );
                    },
                    itemCount: state.ourData.articles.length,
                  ),
                );
              } else if (state is NewsAppResponseField) {
                return const Center(child: Text("Error Request"),);
              } else {
                return const Center(child: Text("You are offline"),);
              }
            },
          )
        ],
        ),
      ),
    );
  }
}