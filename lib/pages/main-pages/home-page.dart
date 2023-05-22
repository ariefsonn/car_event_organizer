import 'package:car_event_organizer/base/constant.dart';
import 'package:car_event_organizer/domain/entities/ticket/camp.dart';
import 'package:car_event_organizer/domain/usecases/ticket.dart';
import 'package:car_event_organizer/pages/auth-pages/login-page.dart';
import 'package:car_event_organizer/pages/main-pages/detail-page.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  int select = 0;
  final PageController _pageController = PageController(initialPage: 0);
  late SharedPreferences user;

  late Future<List<Ticket>> camp;
  late Future<List<Ticket>> tour;
  late Future<List<Ticket>> concert;
  late Future<List<Ticket>> all;
  final ticket = ListTicket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        decoration: const BoxDecoration(
          color: Color(KColor.mainBackground)
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Saturday',
                      style: TextStyle(
                        color: Color(KColor.thirdFontColor),
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '17 December 2023',
                      style: TextStyle(
                        color: Color(KColor.thirdFontColor),
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                    minimumSize: const Size(46, 46),
                  ),
                  onPressed: () {
                    setState(() async {
                      user = await SharedPreferences.getInstance();
                      user.remove('id');
                      user.remove('nama');
                      user.remove('no_hp');
                      user.remove('pin');
                      user.remove('is_login');
                      logout();
                    });
                  },
                  child: Image.asset('assets/exit.png', color: Colors.black, width: 22, height: 22),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 30),
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
                  'Discover Events',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(KColor.mainBackground),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3D6568)),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3D6568), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      hintText: 'Search Events',
                      hintStyle: TextStyle(fontSize: 14, color: Color(0xFF4F7777)),
                      prefixIcon: Icon(Icons.search_rounded, size: 20, color: Color(0xFF4F7777)),
                      suffixIcon: Icon(Icons.menu_open_rounded, color: Color(0xFFD6C88E), size: 25),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
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
            const Text(
              'Events by Categories',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 35),
              height: 110,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        select = 0;
                        _pageController.jumpToPage(select);
                      });
                    },
                    child: Container(
                      width: 88,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Color(select == 0 ? 0xFFE0BB68 : 0xFF225050),
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: Color(select == 0 ? 0xFF0A150D : 0xFF819FA0),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        select = 1;
                        _pageController.jumpToPage(select);
                      });
                    },
                    child: Container(
                      width: 88,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Color(select == 1 ? 0xFFE0BB68 : 0xFF225050),
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Image.asset(
                            'assets/itinerary.png',
                            width: 40,
                            height: 40,
                            color: Color(select == 1 ? 0xFF0A150D : 0xFF819FA0),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Tour',
                            style: TextStyle(
                              color: Color(select == 1 ? 0xFF0A150D : 0xFF819FA0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        select = 2;
                        _pageController.jumpToPage(select);
                      });
                    },
                    child: Container(
                      width: 88,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Color(select == 2 ? 0xFFE0BB68 : 0xFF225050),
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Image.asset(
                            'assets/camping.png',
                            width: 40,
                            height: 40,
                            color: Color(select == 2 ? 0xFF0A150D : 0xFF819FA0),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Camp',
                            style: TextStyle(
                              color: Color(select == 2 ? 0xFF0A150D : 0xFF819FA0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        select = 3;
                        _pageController.jumpToPage(select);
                      });
                    },
                    child: Container(
                      width: 88,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Color(select == 3 ? 0xFFE0BB68 : 0xFF225050),
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Image.asset(
                            'assets/spotlights.png',
                            width: 40,
                            height: 40,
                            color: Color(select == 3 ? 0xFF0A150D : 0xFF819FA0),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Concert',
                            style: TextStyle(
                              color: Color(select == 3 ? 0xFF0A150D : 0xFF819FA0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(  
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    select = index;
                  });
                },
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(KColor.mainBackground),
                    ),
                    child: FutureBuilder(
                      future: all,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (BuildContext ctx, int i) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
                                width: double.infinity,
                                height: 265,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 5,
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF001211),
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
                                                '${snapshot.data?[i].name}',
                                                style: const TextStyle(
                                                  color: Color(0xFF001211),
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                '${snapshot.data?[i].year}',
                                                style: const TextStyle(
                                                  color: Color(0xFF001211),
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: const CircleBorder(),
                                            backgroundColor: const Color(0xFFEEEFF0),
                                            minimumSize: const Size(43, 43),
                                          ),
                                          onPressed: () {},
                                          child: Image.asset('assets/heart.png', width: 20, height: 20),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      margin: const EdgeInsets.only(left: 22, right: 5),
                                      width: double.infinity,
                                      height: 153,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons.access_time_outlined, size: 20, color: Color(0xFF9DABAB)),
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    '${snapshot.data?[i].tanggal}',
                                                    style: const TextStyle(
                                                      color: Color(0xFF9DABAB),
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              Row(
                                                children: [
                                                  const Icon(Icons.location_on_outlined, size: 20, color: Color(0xFF9DABAB)),
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    '${snapshot.data?[i].lokasi}',
                                                    style: const TextStyle(
                                                      color: Color(0xFF9DABAB),
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 27.2),
                                                child: Text(
                                                  '${snapshot.data?[i].country}',
                                                  style: const TextStyle(
                                                    color: Color(0xFF9DABAB),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 13),
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
                                                        '${snapshot.data?[i].jumlah_tiket}',
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
                                              const SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$${snapshot.data?[i].harga}',
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
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailPage(
                                                id: snapshot.data![i].id.toString(),
                                                title: snapshot.data?[i].name,
                                                year: snapshot.data?[i].year,
                                                tanggal: snapshot.data?[i].tanggal,
                                                location: snapshot.data?[i].lokasi,
                                                country: snapshot.data?[i].country,
                                                description: snapshot.data?[i].description,
                                                event_schedule: snapshot.data?[i].even_schedule,
                                                price: snapshot.data?[i].harga,
                                                jumlah_tiket: snapshot.data?[i].jumlah_tiket,
                                              )));
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 170,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFE0BB68),
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                              ),
                                              child: const Center(
                                                child: RotatedBox(
                                                  quarterTurns: 3,
                                                  child: Text(
                                                    'GET A TICKET',
                                                    style: TextStyle(
                                                        color: Color(0xFF212101),
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 13
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.black,
                                  size: 40,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(KColor.mainBackground),
                    ),
                    child: FutureBuilder(
                      future: tour,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (BuildContext ctx, int i) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
                                width: double.infinity,
                                height: 265,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 5,
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF001211),
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
                                                '${snapshot.data?[i].name}',
                                                style: const TextStyle(
                                                  color: Color(0xFF001211),
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                '${snapshot.data?[i].year}',
                                                style: const TextStyle(
                                                  color: Color(0xFF001211),
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: const CircleBorder(),
                                            backgroundColor: const Color(0xFFEEEFF0),
                                            minimumSize: const Size(43, 43),
                                          ),
                                          onPressed: () {},
                                          child: Image.asset('assets/heart.png', width: 20, height: 20),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      margin: const EdgeInsets.only(left: 22, right: 5),
                                      width: double.infinity,
                                      height: 153,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons.access_time_outlined, size: 20, color: Color(0xFF9DABAB)),
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    '${snapshot.data?[i].tanggal}',
                                                    style: const TextStyle(
                                                      color: Color(0xFF9DABAB),
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              Row(
                                                children: [
                                                  const Icon(Icons.location_on_outlined, size: 20, color: Color(0xFF9DABAB)),
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    '${snapshot.data?[i].lokasi}',
                                                    style: const TextStyle(
                                                      color: Color(0xFF9DABAB),
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 27.2),
                                                child: Text(
                                                  '${snapshot.data?[i].country}',
                                                  style: const TextStyle(
                                                    color: Color(0xFF9DABAB),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 13),
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
                                                        '${snapshot.data?[i].jumlah_tiket}',
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
                                              const SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$${snapshot.data?[i].harga}',
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
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailPage(
                                                id: snapshot.data?[i].id,
                                                title: snapshot.data?[i].name,
                                                year: snapshot.data?[i].year,
                                                tanggal: snapshot.data?[i].tanggal,
                                                location: snapshot.data?[i].lokasi,
                                                country: snapshot.data?[i].country,
                                                description: snapshot.data?[i].description,
                                                event_schedule: snapshot.data?[i].even_schedule,
                                                price: snapshot.data?[i].harga,
                                                jumlah_tiket: snapshot.data?[i].jumlah_tiket,
                                              )));
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 170,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFE0BB68),
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                              ),
                                              child: const Center(
                                                child: RotatedBox(
                                                  quarterTurns: 3,
                                                  child: Text(
                                                    'GET A TICKET',
                                                    style: TextStyle(
                                                        color: Color(0xFF212101),
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 13
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.black,
                                  size: 40,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(KColor.mainBackground),
                    ),
                    child: FutureBuilder(
                      future: camp,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (BuildContext ctx, int i) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
                                width: double.infinity,
                                height: 265,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 5,
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF001211),
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
                                                '${snapshot.data?[i].name}',
                                                style: const TextStyle(
                                                  color: Color(0xFF001211),
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                '${snapshot.data?[i].year}',
                                                style: const TextStyle(
                                                  color: Color(0xFF001211),
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: const CircleBorder(),
                                            backgroundColor: const Color(0xFFEEEFF0),
                                            minimumSize: const Size(43, 43),
                                          ),
                                          onPressed: () {},
                                          child: Image.asset('assets/heart.png', width: 20, height: 20),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      margin: const EdgeInsets.only(left: 22, right: 5),
                                      width: double.infinity,
                                      height: 153,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons.access_time_outlined, size: 20, color: Color(0xFF9DABAB)),
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    '${snapshot.data?[i].tanggal}',
                                                    style: const TextStyle(
                                                      color: Color(0xFF9DABAB),
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              Row(
                                                children: [
                                                  const Icon(Icons.location_on_outlined, size: 20, color: Color(0xFF9DABAB)),
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    '${snapshot.data?[i].lokasi}',
                                                    style: const TextStyle(
                                                      color: Color(0xFF9DABAB),
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 27.2),
                                                child: Text(
                                                  '${snapshot.data?[i].country}',
                                                  style: const TextStyle(
                                                    color: Color(0xFF9DABAB),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 13),
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
                                                        '${snapshot.data?[i].jumlah_tiket}',
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
                                              const SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$${snapshot.data?[i].harga}',
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
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailPage(
                                                id: snapshot.data?[i].id,
                                                title: snapshot.data?[i].name,
                                                year: snapshot.data?[i].year,
                                                tanggal: snapshot.data?[i].tanggal,
                                                location: snapshot.data?[i].lokasi,
                                                country: snapshot.data?[i].country,
                                                description: snapshot.data?[i].description,
                                                event_schedule: snapshot.data?[i].even_schedule,
                                                price: snapshot.data?[i].harga,
                                                jumlah_tiket: snapshot.data?[i].jumlah_tiket,
                                              )));
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 170,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFE0BB68),
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                              ),
                                              child: const Center(
                                                child: RotatedBox(
                                                  quarterTurns: 3,
                                                  child: Text(
                                                    'GET A TICKET',
                                                    style: TextStyle(
                                                        color: Color(0xFF212101),
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 13
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.black,
                                  size: 40,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(KColor.mainBackground),
                    ),
                    child: FutureBuilder(
                      future: concert,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (BuildContext ctx, int i) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
                                width: double.infinity,
                                height: 265,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 5,
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF001211),
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
                                                '${snapshot.data?[i].name}',
                                                style: const TextStyle(
                                                  color: Color(0xFF001211),
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                '${snapshot.data?[i].year}',
                                                style: const TextStyle(
                                                  color: Color(0xFF001211),
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: const CircleBorder(),
                                            backgroundColor: const Color(0xFFEEEFF0),
                                            minimumSize: const Size(43, 43),
                                          ),
                                          onPressed: () {},
                                          child: Image.asset('assets/heart.png', width: 20, height: 20),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      margin: const EdgeInsets.only(left: 22, right: 5),
                                      width: double.infinity,
                                      height: 153,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons.access_time_outlined, size: 20, color: Color(0xFF9DABAB)),
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    '${snapshot.data?[i].tanggal}',
                                                    style: const TextStyle(
                                                      color: Color(0xFF9DABAB),
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              Row(
                                                children: [
                                                  const Icon(Icons.location_on_outlined, size: 20, color: Color(0xFF9DABAB)),
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    '${snapshot.data?[i].lokasi}',
                                                    style: const TextStyle(
                                                      color: Color(0xFF9DABAB),
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 27.2),
                                                child: Text(
                                                  '${snapshot.data?[i].country}',
                                                  style: const TextStyle(
                                                    color: Color(0xFF9DABAB),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 13),
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
                                                        '${snapshot.data?[i].jumlah_tiket}',
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
                                              const SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$${snapshot.data?[i].harga}',
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
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailPage(
                                                id: snapshot.data?[i].id,
                                                title: snapshot.data?[i].name,
                                                year: snapshot.data?[i].year,
                                                tanggal: snapshot.data?[i].tanggal,
                                                location: snapshot.data?[i].lokasi,
                                                country: snapshot.data?[i].country,
                                                description: snapshot.data?[i].description,
                                                event_schedule: snapshot.data?[i].even_schedule,
                                                price: snapshot.data?[i].harga,
                                                jumlah_tiket: snapshot.data?[i].jumlah_tiket,
                                              )));
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 170,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFE0BB68),
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                              ),
                                              child: const Center(
                                                child: RotatedBox(
                                                  quarterTurns: 3,
                                                  child: Text(
                                                    'GET A TICKET',
                                                    style: TextStyle(
                                                        color: Color(0xFF212101),
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 13
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.black,
                                  size: 40,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  void logout() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c) => const LoginPage()), (route) => false);
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    camp = ticket.listCampTicket();
    tour = ticket.listTourTicket();
    concert = ticket.listConcertTicket();
    all = ticket.listAllTicket();
  }
}
