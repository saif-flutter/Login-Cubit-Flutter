import 'package:flutter/material.dart';


class Button extends StatefulWidget {

  final String titleName;
  final VoidCallback onpressed;
  final Color color;
  final TextStyle textStyle;


   const Button({
    Key? key,
    required this.titleName, required this.onpressed,required this.color ,
     required this.textStyle,

  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
   late VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 34),
      child: SizedBox(
        // padding:  EdgeInsets.symmetric(vertical: 30.h, ),
        width: 307,
        height: 56,
        child: ElevatedButton(

            style: ElevatedButton.styleFrom(
                primary: widget.color,
                side: const BorderSide(
                  color: Color(0xff051761)
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),

            onPressed: widget.onpressed,
            child: Text(widget.titleName,style: widget.textStyle,)
            ),
      ),
    );
  }
}