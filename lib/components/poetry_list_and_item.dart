import 'package:flutter/material.dart';
import 'package:Verses/contants.dart';

class PoetryListView extends StatelessWidget {
  final List<Map<String, dynamic>> poetries;
  final Function poetryItem;

  PoetryListView({Key key, this.poetries, this.poetryItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.poetries.length,
      itemBuilder: (context, index) {
        return PoetryListItem(
          poetry: this.poetries[index],
          poetryItem: this.poetryItem,
        );
      },
    );
  }
}

class PoetryListItem extends StatelessWidget {
  final Map<String, dynamic> poetry;
  final Function poetryItem;

  PoetryListItem({Key key, this.poetry, this.poetryItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        height: size.height * 0.1,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Text(this.poetry['题目']),
            Spacer(),
            Text(this.poetry['作者']),
          ],
        ),
        decoration: BoxDecoration(
          color: kPirmaryColor,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      onTap: () {
        print(this.poetry);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => poetryItem(this.poetry)),
        );
      },
    );
  }
}