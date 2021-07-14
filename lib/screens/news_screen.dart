import 'dart:convert';
import 'package:newsapp/utility/news_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/components/navigation_button.dart';
import 'package:newsapp/components/news_item.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/screens/favourite_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsScreen extends StatefulWidget {
  static String id = 'NewsScreen';

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsData> fav = [];
  Future data;
  Future getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString('email'));
    String url = "https://api.first.org/data/v1/news";
    http.Response response = await http.get(Uri.parse(url));
    List<NewsData> res = [];
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'] as List;
      data.forEach((element) {
        NewsData d1 = NewsData(
          title: element['title'] != null ? element['title'] : " ",
          desc: element['summary'] != null ? element['summary'] : " ",
          date: element['published'] != null ? element['published'] : " ",
        );

        res.add(d1);
      });
    }
    print(response.statusCode);
    return res;
  }
  @override
  void initState() {
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDFE5),
      body: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                NewsData d =NewsData(
                  title: snapshot.data[index].title,
                  desc: snapshot.data[index].desc,
                  date: snapshot.data[index].date,
                );
                return NewsItem(
                  data: d,

                  icnColor: snapshot.data[index].isFav?Colors.red:Colors.grey,
                  onPressed: (){
                    if(fav.contains(d)){
                      print('hello');
                      fav.remove(d);
                    }

                    else
                      fav.add(d);
                    setState(() {
                      snapshot.data[index].isFav = !snapshot.data[index].isFav;
                    });
                  },
                );
              },
            );
          } else {
            return Container(
              child: Center(
                child: Text('Loading.....'),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: NavigationButton(
              icon: Icons.menu,
              iconColor: Colors.white,
              textColor: Colors.white,
              buttonText: 'News',
              buttonColor: Color(0xFF234295),
              onPressed: () {
                print('News button');

              },
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: NavigationButton(
              icon: Icons.favorite,
              buttonColor: Colors.white,
              buttonText: 'Favs',
              textColor: Colors.black,
              iconColor: Colors.red,
              onPressed: () {
                print(fav);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return FavouriteScreen(data: fav,);
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}

