import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/domain/entity/blog_entity.dart';

class ScoreAndResultScoreCard extends StatelessWidget {
  final BlogEntity blog;
  const ScoreAndResultScoreCard({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 154.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.amber,
            blurRadius: 5.0,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 48,
              alignment: Alignment.centerLeft,
              child: Text(
                blog.title,
              ),
            ),
          ),
          const Divider(
            thickness: 0.5,
            height: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              blog.body,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
