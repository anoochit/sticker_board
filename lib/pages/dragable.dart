import 'package:flutter/material.dart';

class DragablePage extends StatefulWidget {
  const DragablePage({super.key});

  @override
  State<DragablePage> createState() => _DragablePageState();
}

class _DragablePageState extends State<DragablePage> {
  Offset offset = Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned(
              left: offset.dx,
              top: offset.dy,
              child: MouseRegion(
                cursor: SystemMouseCursors.move,
                child: Draggable(
                  data: 'assets/stickers/appwrite.png',
                  feedback: Image.asset(
                    'assets/stickers/appwrite.png',
                    width: 180,
                    height: 180,
                  ),
                  childWhenDragging: Container(),
                  child: Image.asset(
                    'assets/stickers/appwrite.png',
                    width: 180,
                    height: 180,
                  ),
                ),
              ),
            ),
            DragTarget(
              builder: (context, candidateData, rejectedData) {
                return Container();
              },
              onAcceptWithDetails: (details) {
                setState(() {
                  offset = details.offset;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
