import 'package:flutter/material.dart';
import 'package:newsapp/utility/news_data.dart';
class NewsItem extends StatefulWidget {
  final NewsData data;
  final Function onPressed;
  final Color icnColor;
  NewsItem({this.data,this.onPressed,this.icnColor});

  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.all(25.0),
              child: GestureDetector(
                onTap: widget.onPressed,
                child: Icon(
                  Icons.favorite,
                  color: widget.icnColor,
                  size: 40.0,
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(widget.data.desc),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    widget.data.date,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}