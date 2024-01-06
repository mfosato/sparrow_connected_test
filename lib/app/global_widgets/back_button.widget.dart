import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: const CircleAvatar(
            child: Center(
                child: Icon(
              Icons.chevron_left,
              size: 30,
            )),
          ),
        ),
      ),
    );
  }
}
