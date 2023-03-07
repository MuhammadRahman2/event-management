import 'package:event/screen/event_detail.dart';
import 'package:flutter/material.dart';

class GridEvent extends StatelessWidget {
  final String? ename;
  final String? date;
  final String? imageUrl;
  const GridEvent({
    Key? key,
    this.ename =
        'https://img.freepik.com/free-vector/music-event-poster-with-photo-2021_52683-42065.jpg?w=740&t=st=1675012054~exp=1675012654~hmac=321d065671621404a67c224d1b6c719c9546cec3a67b237ce708372b3f16668d',
    this.imageUrl,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(60, 195, 240, 0.7).withOpacity(0.4),
            borderRadius: BorderRadius.circular(10)),
        child: GridTileBar(
          // backgroundColor: const Color.fromRGBO(60, 195, 240, 0.7),
          title: Text(
            ename!.toString(),
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(date.toString(),style:const  TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EventDetail()));
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
