import 'package:flutter/material.dart';

class EmptyNewsWidget extends StatelessWidget {
  const EmptyNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.3),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.newspaper,
                size: 120,
                color: Colors.white,
              ),
              Text(
                'No news available.\nPlease try again later',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ],
          )),
    );
  }
}
