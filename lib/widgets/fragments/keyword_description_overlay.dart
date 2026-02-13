import 'package:flutter/material.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';

class KeyWordDescription extends StatelessWidget {
  const KeyWordDescription({
    super.key,
    required this.keyWord,
    required this.descrpition,
  });

  final String keyWord;
  final String descrpition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Padding6,
      width: 160,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247,239,208),
        border: Border.all(color: Color.fromARGB(255, 213,162,75))
      ),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(keyWord,style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 81,137,188)),),
          Text(descrpition,style: TextStyle(fontSize: 16,color: Colors.black)),
        ],
      ),
    );
  }
}