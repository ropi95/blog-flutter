import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/domain/entity/blog_entity.dart';
import 'package:flutter_application_1/src/presentation/widgets/card.dart';

class DetailWidget extends StatelessWidget {
  final BlogEntity blogEntity;
  const DetailWidget({Key? key, required this.blogEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Blog',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w800),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.backspace,
              color: Colors.amber,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ScoreAndResultScoreCard(
          blog: blogEntity,
        ),
      ),
    );
  }
}
