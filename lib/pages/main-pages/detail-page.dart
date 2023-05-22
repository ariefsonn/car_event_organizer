import 'package:car_event_organizer/base/constant.dart';
import 'package:car_event_organizer/pages/main-pages/home-page.dart';
import 'package:car_event_organizer/pages/main-pages/security-page.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.title, required this.year, required this.tanggal, required this.location, required this.country, required this.description, required this.event_schedule, required this.price, required this.jumlah_tiket, required this.id}) : super(key: key);

  final String id;
  final String title;
  final String year;
  final String tanggal;
  final String location;
  final String country;
  final String description;
  final String event_schedule;
  final String price;
  final String jumlah_tiket;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
                  decoration: const BoxDecoration(
                    color: Color(KColor.mainBackground),
                  ),
                  height: 1100,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                              minimumSize: const Size(46, 46),
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => const HomePage()), (route) => false);
                            },
                            child: const Icon(Icons.arrow_back_rounded, color: Colors.black),
                          ),
                          const Text(
                            'Event Details',
                            style: TextStyle(
                              color: Color(0xFFF9FFFF),
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: const Color(0xFFEEEFF0),
                              minimumSize: const Size(46, 46),
                            ),
                            onPressed: () {},
                            child: Image.asset('assets/heart.png', width: 23, height: 23),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 30),
                        width: double.infinity,
                        height: 2,
                        decoration: const BoxDecoration(
                          color: Color(KColor.stringColor),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF9FFFF),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          const SizedBox(width: 13),
                          SizedBox(
                            width: 240,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: const TextStyle(
                                    color: Color(0xFFF9FFFF),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  widget.year,
                                  style: const TextStyle(
                                    color: Color(0xFFF9FFFF),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Container (
                        margin: const EdgeInsets.only(left: 18, right: 5),
                        width: double.infinity,
                        height: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.access_time_outlined, size: 22, color: Color(0xFF627E7F)),
                                const SizedBox(width: 7),
                                Text(
                                  widget.tanggal,
                                  style: const TextStyle(
                                    color: Color(0xFF627E7F),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined, size: 22, color: Color(0xFF627E7F)),
                                const SizedBox(width: 7),
                                Text(
                                  widget.location,
                                  style: const TextStyle(
                                    color: Color(0xFF627E7F),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 28.7),
                              child: Text(
                                widget.country,
                                style: const TextStyle(
                                  color: Color(0xFF627E7F),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 30),
                        width: double.infinity,
                        height: 2,
                        decoration: const BoxDecoration(
                          color: Color(KColor.stringColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Description',
                            style: TextStyle(
                              color: Color(0xFFF9FFFF),
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 17),
                          Text(
                            widget.description,
                            softWrap: true,
                            style: const TextStyle(
                              color: Color(0xFF627E7F),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 30),
                        width: double.infinity,
                        height: 2,
                        decoration: const BoxDecoration(
                          color: Color(KColor.stringColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Event Schedule',
                            style: TextStyle(
                              color: Color(0xFFF9FFFF),
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.event_schedule,
                            style: const TextStyle(
                              color: Color(0xFFF9FFFF),
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Text(
                          //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pharetra libero eu enim laoreet blandit. Vivamus congue leo ipsum, ut mattis diam fermentum eget. Nunc tortor neque, dignissim nec viverra vel, auctor ac velit. In id mauris ornare, sagittis urna ac, condimentum augue. Donec augue ipsum, porta vel ultricies et, mattis in quam. Nullam dui eros, facilisis at dolor dictum, vehicula laoreet quam. Proin vulputate est non sollicitudin facilisis. Integer nec maximus erat.',
                          //   softWrap: true,
                          //   style: TextStyle(
                          //     color: Color(0xFF627E7F),
                          //     fontSize: 15,
                          //     fontWeight: FontWeight.w400,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 23),
              width: double.infinity,
              height: 190,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$${widget.price}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 27
                        ),
                      ),
                      const Text(
                        '/per person',
                        style: TextStyle(
                            color: Color(0xFFC4C9C7),
                            fontWeight: FontWeight.w700,
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 181,
                    height: 25,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border(
                        top: BorderSide(width: 1, color: Colors.black26),
                        bottom: BorderSide(width: 1, color: Colors.black26),
                        left: BorderSide(width: 1, color: Colors.black26),
                        right: BorderSide(width: 1, color: Colors.black26),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.jumlah_tiket,
                            style: const TextStyle(
                              color: Color(0xFF274C4C),
                              fontWeight: FontWeight.w700,
                              fontSize: 13.4,
                            ),
                          ),
                          const Text(
                            '/100 tickets available',
                            style: TextStyle(
                              color: Color(0xFF9DABAB),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => SecurityPage(id: widget.id)), (route) => false);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE0BB68),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text(
                        'GET A TICKET',
                        style: TextStyle(
                            color: Color(0xFF212101),
                            fontWeight: FontWeight.w700,
                            fontSize: 15.5
                        ),
                      ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
