import 'package:flutter/material.dart';
import 'package:newsapp/components/navigation_button.dart';
import 'package:newsapp/components/news_item.dart';
import 'package:newsapp/utility/news_data.dart';

class FavouriteScreen extends StatefulWidget {
  static String id = 'FavouriteScreen';
  final data;
  FavouriteScreen({this.data});

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDFE5),
      body: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            NewsData d = NewsData(
              title: widget.data[index].title,
              desc: widget.data[index].desc,
              date: widget.data[index].date,
            );
            return NewsItem(
              data: d,
              icnColor: Colors.red,
            );
          }),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: NavigationButton(
              icon: Icons.menu,
              iconColor: Colors.black,
              textColor: Colors.black,
              buttonText: 'News',
              buttonColor: Colors.white,
              onPressed: () {
                print('News button');
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: NavigationButton(
              icon: Icons.favorite,
              buttonColor: Color(0xFF234295),
              buttonText: 'Favs',
              textColor: Colors.white,
              iconColor: Colors.white,
              onPressed: () {
                print(widget.data);
              },
            ),
          ),
        ],
      ),
    );
  }
}
