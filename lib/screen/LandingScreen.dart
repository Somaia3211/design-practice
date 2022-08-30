import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:ui_design/custom/BorderBox.dart';
import 'package:ui_design/custom/OptionButtom.dart';
import 'package:ui_design/utils/constant.dart';
import 'package:ui_design/utils/sample_data.dart';
import 'package:ui_design/utils/wigdt_function.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25.0;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderBox(
                          width: 50,
                          heigth: 50,
                          child: Icon(Icons.menu),
                        ),
                        BorderBox(
                          width: 50,
                          heigth: 50,
                          child: Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text('city', style: themeData.textTheme.bodyText2),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: sidePadding,
                    child: Text('San fransisco',
                        style: themeData.textTheme.headline1),
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        "<22,000",
                        "fore sale",
                        "3-4 beds",
                        ">1000sqft"
                      ].map((filter) => ChoiceOption(text: filter)).toList(),
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: RE_DATA.length,
                        itemBuilder: (context, index) {
                          return RelateEstateItem(itemDate: RE_DATA[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                width: size.width,
                child: Center(
                  child: OptionButton(
                    icon: Icons.map_rounded,
                    text: 'Map View',
                    width: size.width * 0.35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: EdgeInsets.only(left: 25),
      child: Text(text, style: themeData.textTheme.headline5),
    );
  }
}

class RelateEstateItem extends StatelessWidget {
  final dynamic itemDate;

  const RelateEstateItem({super.key, required this.itemDate});

  @override
  Widget build(BuildContext context) {
    final ThemeData itemData = Theme.of(context);
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(itemDate["image"]),),
              Positioned(
                top: 15,
                right: 15,
                child: BorderBox(
                  width: 50,
                  heigth: 50,
                  child: Icon(
                    Icons.favorite_border,
                    color: COLOR_BLACK,
                  ),
                ),
              ),
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                "${itemDate["amount"]}",
                style: themeData.textTheme.headline1,
              ),
              addHorizentalSpace(10),
              Text(
                "${itemDate["adress"]}",
                style: themeData.textTheme.bodyText2,
              ),
            ],
          ),
          addVerticalSpace(10),
          Text(
            "${itemDate["bedroom"]} bedrooms /${itemDate["bathroom"]} batrooms/"
            "${itemDate["area"]}/area sqtf",
            style: themeData.textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
