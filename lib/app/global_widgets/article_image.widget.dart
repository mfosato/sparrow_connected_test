import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  final String url;
  const ArticleImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        url,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Theme.of(context).primaryColor.withOpacity(0.6),
          width: Size.infinite.width,
          height: 200,
          child: const Icon(Icons.newspaper, size: 100,)),
      ),
    );
  }
}
