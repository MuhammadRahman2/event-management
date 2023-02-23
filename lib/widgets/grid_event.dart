import 'package:event/screen/event_detail.dart';
import 'package:flutter/material.dart';

class GridEvent extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  const GridEvent({
    Key? key,
    this.title,
    this.imageUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: const Color.fromRGBO(60, 195, 240, 0.7),
        title: Text(title!),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EventDetail()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:  DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageUrl!
              ),
            ),
          ),
        ),
      ),
    );
  }
}
