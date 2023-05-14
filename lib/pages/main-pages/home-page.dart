import 'package:car_event_organizer/base/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  int select = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

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
                  onPressed: () {},
                  child: const Icon(Icons.menu_rounded, color: Colors.black),
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
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
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
                                      children: const [
                                        Text(
                                          'Jakchap Fest',
                                          style: TextStyle(
                                            color: Color(0xFF001211),
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '2023',
                                          style: TextStyle(
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
                                          children: const [
                                            Icon(Icons.access_time_outlined, size: 20, color: Color(0xFF9DABAB)),
                                            SizedBox(width: 7),
                                            Text(
                                              '1 - 3 January (3 days)',
                                              style: TextStyle(
                                                color: Color(0xFF9DABAB),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: const [
                                            Icon(Icons.location_on_outlined, size: 20, color: Color(0xFF9DABAB)),
                                            SizedBox(width: 7),
                                            Text(
                                              'Balishira Resort, Sreemangal,',
                                              style: TextStyle(
                                                color: Color(0xFF9DABAB),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 27.2),
                                          child: Text(
                                            'Bangladesh',
                                            style: TextStyle(
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
                                              children: const [
                                                Text(
                                                  '40',
                                                  style: TextStyle(
                                                    color: Color(0xFF274C4C),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13.4,
                                                  ),
                                                ),
                                                Text(
                                                  '/400 tickets available',
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
                                          children: const [
                                            Text(
                                              '\$50.00',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 27
                                              ),
                                            ),
                                            Text(
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
                                      onTap: () {},
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
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(KColor.mainBackground),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
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
                                      children: const [
                                        Text(
                                          'Jakchap Fest',
                                          style: TextStyle(
                                            color: Color(0xFF001211),
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '2023',
                                          style: TextStyle(
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
                                          children: const [
                                            Icon(Icons.access_time_outlined, size: 20, color: Color(0xFF9DABAB)),
                                            SizedBox(width: 7),
                                            Text(
                                              '1 - 3 January (3 days)',
                                              style: TextStyle(
                                                color: Color(0xFF9DABAB),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: const [
                                            Icon(Icons.location_on_outlined, size: 20, color: Color(0xFF9DABAB)),
                                            SizedBox(width: 7),
                                            Text(
                                              'Balishira Resort, Sreemangal,',
                                              style: TextStyle(
                                                color: Color(0xFF9DABAB),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 27.2),
                                          child: Text(
                                            'Herzegovina',
                                            style: TextStyle(
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
                                              children: const [
                                                Text(
                                                  '40',
                                                  style: TextStyle(
                                                    color: Color(0xFF274C4C),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13.4,
                                                  ),
                                                ),
                                                Text(
                                                  '/400 tickets available',
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
                                          children: const [
                                            Text(
                                              '\$50.00',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 27
                                              ),
                                            ),
                                            Text(
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
                                      onTap: () {},
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
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(KColor.mainBackground),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
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
                                      children: const [
                                        Text(
                                          'Jakchap Fest',
                                          style: TextStyle(
                                            color: Color(0xFF001211),
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '2023',
                                          style: TextStyle(
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
                                          children: const [
                                            Icon(Icons.access_time_outlined, size: 20, color: Color(0xFF9DABAB)),
                                            SizedBox(width: 7),
                                            Text(
                                              '1 - 3 January (3 days)',
                                              style: TextStyle(
                                                color: Color(0xFF9DABAB),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: const [
                                            Icon(Icons.location_on_outlined, size: 20, color: Color(0xFF9DABAB)),
                                            SizedBox(width: 7),
                                            Text(
                                              'Balishira Resort, Sreemangal,',
                                              style: TextStyle(
                                                color: Color(0xFF9DABAB),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 27.2),
                                          child: Text(
                                            'Herzegovina',
                                            style: TextStyle(
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
                                              children: const [
                                                Text(
                                                  '40',
                                                  style: TextStyle(
                                                    color: Color(0xFF274C4C),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13.4,
                                                  ),
                                                ),
                                                Text(
                                                  '/400 tickets available',
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
                                          children: const [
                                            Text(
                                              '\$50.00',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 27
                                              ),
                                            ),
                                            Text(
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
                                      onTap: () {},
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
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(KColor.mainBackground),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
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
                                      children: const [
                                        Text(
                                          'Jakchap Fest',
                                          style: TextStyle(
                                            color: Color(0xFF001211),
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '2023',
                                          style: TextStyle(
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
                                          children: const [
                                            Icon(Icons.access_time_outlined, size: 20, color: Color(0xFF9DABAB)),
                                            SizedBox(width: 7),
                                            Text(
                                              '1 - 3 January (3 days)',
                                              style: TextStyle(
                                                color: Color(0xFF9DABAB),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: const [
                                            Icon(Icons.location_on_outlined, size: 20, color: Color(0xFF9DABAB)),
                                            SizedBox(width: 7),
                                            Text(
                                              'Balishira Resort, Sreemangal,',
                                              style: TextStyle(
                                                color: Color(0xFF9DABAB),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 27.2),
                                          child: Text(
                                            'Herzegovina',
                                            style: TextStyle(
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
                                              children: const [
                                                Text(
                                                  '40',
                                                  style: TextStyle(
                                                    color: Color(0xFF274C4C),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13.4,
                                                  ),
                                                ),
                                                Text(
                                                  '/400 tickets available',
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
                                          children: const [
                                            Text(
                                              '\$50.00',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 27
                                              ),
                                            ),
                                            Text(
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
                                      onTap: () {},
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
}
