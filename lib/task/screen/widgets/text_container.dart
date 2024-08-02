import 'package:flutter/material.dart';
import '../../../main.dart';
import 'gradient_border.dart';

class TextContainer extends StatelessWidget {
  final String? text;
  const TextContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mq.width * .42,
      padding: EdgeInsets.only(top: 8, bottom: 8, left: mq.width * .04),
      margin: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
          color: Color.fromARGB(97, 102, 102, 102),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: GradientBoxBorder(
              gradient: LinearGradient(colors: [
            Color(0xffB7B7B7),
            Color(0xff8B8B8B),
            Color(0xff666666),
            Color(0xffB7B7B7),
          ]))),
      child: Text(
        text ?? "",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class TextContainer2 extends StatelessWidget {
  final String text;
  const TextContainer2({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mq.width * .85,
      padding: EdgeInsets.only(top: 8, bottom: 8, left: mq.width * .04),
      margin: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
          color: Color.fromARGB(97, 102, 102, 102),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: GradientBoxBorder(
              gradient: LinearGradient(colors: [
            Color(0xffB7B7B7),
            Color(0xff8B8B8B),
            Color(0xff666666),
            Color(0xffB7B7B7),
          ]))),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class TableDataText extends StatelessWidget {
  const TableDataText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: mq.width * .27,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
