import 'package:flutter/material.dart';
import 'package:ui_design/utils/constant.dart';
import 'package:ui_design/utils/wigdt_function.dart';

class OptionButton extends StatelessWidget {
 final String text;
 final IconData? icon;
 final double? width;

  const OptionButton({super.key, required this.text,  this.icon,   this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(onPressed: (){},
        splashColor: COLOR_WHITH.withAlpha(55),
          child: Row(
           children: [
            Icon(icon,color: COLOR_WHITH,),
            addHorizentalSpace(10),

            Text(text,style: TextStyle(color: COLOR_WHITH),),
           ],
          ),
       
       color: COLOR_DARK_BLUE,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
       padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),

      ),
    );

  }
}
