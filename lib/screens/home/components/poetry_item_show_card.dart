import 'package:flutter/material.dart';
import 'package:Verses/utils.dart';
import 'package:Verses/contants.dart';

class PoetryItemShowCard extends StatefulWidget {
  final Map<String, dynamic> poetry;
  final int themeId;
  PoetryItemShowCard({Key key, this.poetry, this.themeId}) : super(key: key);
  @override
  _PoetryItemShowCardState createState() => _PoetryItemShowCardState();
}

class _PoetryItemShowCardState extends State<PoetryItemShowCard> {
  PoetryShowTypes poetryShowType = PoetryShowTypes.normal;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: Container(
                width: size.width,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: getContent(widget.poetry, poetryShowType: this.poetryShowType),
                        style: TextStyle(
                          fontSize: 15,
                          color: themeColor[widget.themeId]['textColor'],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            indent: 5,
            endIndent: 5,
            height: 1,
          ),
          Container(
            height: size.height * 0.08,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                TextButton(
                  child: Text('拼'),
                  style: buttonForPoetryStyle(PoetryShowTypes.pinyin, size),
                  onPressed: () {
                    switch (this.poetryShowType) {
                      case PoetryShowTypes.normal:
                        this.poetryShowType = PoetryShowTypes.pinyin;
                        break;
                      case PoetryShowTypes.pinyin:
                        this.poetryShowType = PoetryShowTypes.normal;
                        break;
                      case PoetryShowTypes.fanti:
                        this.poetryShowType = PoetryShowTypes.all;
                        break;
                      case PoetryShowTypes.all:
                        this.poetryShowType = PoetryShowTypes.fanti;
                        break;
                    }
                    setState(() {});
                  },
                ),
                TextButton(
                  child: Text('繁'),
                  style: buttonForPoetryStyle(PoetryShowTypes.fanti, size),
                  onPressed: () {
                    switch (this.poetryShowType) {
                      case PoetryShowTypes.normal:
                        this.poetryShowType = PoetryShowTypes.fanti;
                        break;
                      case PoetryShowTypes.pinyin:
                        this.poetryShowType = PoetryShowTypes.all;
                        break;
                      case PoetryShowTypes.fanti:
                        this.poetryShowType = PoetryShowTypes.normal;
                        break;
                      case PoetryShowTypes.all:
                        this.poetryShowType = PoetryShowTypes.pinyin;
                        break;
                    }
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: themeColor[widget.themeId]['primaryColor'],
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  ButtonStyle buttonForPoetryStyle(PoetryShowTypes type, Size size) {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(size.height * 0.06, size.height * 0.05)),
      foregroundColor: MaterialStateProperty.all(
        themeColor[widget.themeId]['textColor'],
      ),
      overlayColor: (this.poetryShowType == PoetryShowTypes.all || this.poetryShowType == type)
          ? MaterialStateProperty.all(themeColor[widget.themeId]['primaryColor'])
          : MaterialStateProperty.all(themeColor[widget.themeId]['backgroundColor']),
      backgroundColor: (this.poetryShowType == PoetryShowTypes.all || this.poetryShowType == type)
          ? MaterialStateProperty.all(themeColor[widget.themeId]['backgroundColor'])
          : MaterialStateProperty.all(themeColor[widget.themeId]['primaryColor']),
    );
  }
}
