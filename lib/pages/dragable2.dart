// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

class Dragable2Page extends StatefulWidget {
  const Dragable2Page({super.key});

  @override
  State<Dragable2Page> createState() => _Dragable2PageState();
}

class _Dragable2PageState extends State<Dragable2Page> {
  List<Offset> listOffset = <Offset>[];

  List<String> listSticker = [
    'assets/stickers/digital-ocean-smile.webp',
    'assets/stickers/appwrite.png',
    'assets/stickers/pegasaurus.png',
    'assets/stickers/surfer-moby-dock.png'
  ];

  @override
  void initState() {
    super.initState();

    listSticker.forEach((v) {
      listOffset.add(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/board/boardbg.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Stack(
          children: List.generate(listSticker.length, (index) {
            return Positioned(
              left: listOffset[index].dx,
              top: listOffset[index].dy,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    listOffset[index] = listOffset[index] +
                        Offset(details.delta.dx, details.delta.dy);
                  });
                },
                child: Image.asset(
                  listSticker[index],
                  width: 180,
                  height: 180,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
