import 'package:event/widgets/circle_container.dart';
import 'package:event/widgets/container_button.dart';
import 'package:flutter/material.dart';
import 'confirm_seat.dart';

class EventDetail extends StatelessWidget {
  final String nodeId;
  const EventDetail({super.key, required this.nodeId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const CirlceContainer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Event Title WhatEver',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(60, 195, 240, 1)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://img.freepik.com/free-vector/music-event-poster-with-photo-2021_52683-42065.jpg?w=740&t=st=1675012054~exp=1675012654~hmac=321d065671621404a67c224d1b6c719c9546cec3a67b237ce708372b3f16668d',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '''A Little Night Musicsings and waltzes its way through the lives of mismatched couples who are about to make some very surprising.''',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 100, 97, 97),
                    ),
                  ),
                  const Text(
                    'Starting Time: 6:00 pm',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Ending Time: 10:00 pm',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 40,
                      width: 200,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(60, 195, 240, 0.5)),
                      child: const Center(
                        child: Text('Total Seat is : 50'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 40,
                      width: 200,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(60, 195, 240, 0.5)),
                      child: const Center(
                        child: Text('Teket Free : 30'),
                      ),
                    ),
                  ),
                  ContainerButton(
                    colors: const Color.fromRGBO(60, 195, 240, 1),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ConfirmSeat(nodeId: nodeId,)));
                    },
                    title: 'Register',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
