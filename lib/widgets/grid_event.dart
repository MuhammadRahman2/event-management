import 'package:event/screen/event_detail.dart';
import 'package:flutter/material.dart';

class GridEvent extends StatelessWidget {
  final String? ename;
  final String? date;
  final String? endTime;
  final String? startTime;
  final String? imageUrl;
  final String? description;
  // final String nodeId;
  const GridEvent({
    Key? key,
    this.ename,
    required this.imageUrl,
    required this.date,
    required this.endTime,
    required this.startTime,
    required this.description,

    // required this.nodeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Container(
        decoration: BoxDecoration(
            color: const Color(0xff3CC3CC).withOpacity(0.7),
            borderRadius: BorderRadius.circular(10)),
        child: GridTileBar(
          // backgroundColor: const Color.fromRGBO(60, 195, 240, 0.7),
          title: Text(
            ename!.toString(),
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            date.toString(),
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventDetail(
                  ename: ename.toString(),
                  date: date,
                  imageUrl: imageUrl,
                  description: description,
                  endTime: endTime,
                  startTime: startTime),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl!),
            ),
          ),
        ),
      ),
    );
  }
}
