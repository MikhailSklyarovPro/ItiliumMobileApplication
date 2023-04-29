import 'package:flutter/material.dart';

class MyOutfitsWindow extends StatefulWidget {
  const MyOutfitsWindow({Key? key}) : super(key: key);

  @override
  State<MyOutfitsWindow> createState() => _MyOutfitsWindowState();
}

class _MyOutfitsWindowState extends State<MyOutfitsWindow> {

  @override
  Widget build(BuildContext context) {
    int selectedTab = 1;
    int numberNotifications = 2;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    void onSelectTab(int index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/myRequestsWindow');
          break;
        case 1:
          Navigator.pushNamed(context, '/myOutfitsWindow');
          break;
        case 2:
          Navigator.pushNamed(context, '/myApprovalsWindow');
          break;
      }
      if (selectedTab != index) {
        setState(() {
          selectedTab = index;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height*0.08,
        backgroundColor: const Color.fromARGB(255, 247, 147, 48),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              'Мои наряды',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Container(
                margin: EdgeInsets.only(left: width * 0.03),
                padding: EdgeInsets.only(left: width * 0.02, right: width*0.02, top: width*0.01, bottom: width*0.01),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child:  Center(
                  child: Text(
                    '${numberNotifications}',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                )),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                size: width * 0.1,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.filter_alt_rounded,
                size: width * 0.1,
              ),
              onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: numberNotifications,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3,
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                width: 2,
                color: Color.fromARGB(255, 247, 147, 48),
              ),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/myOutfitsWindow/detailedOutfit');
                  },
                  highlightColor: Color.fromARGB(110, 247, 147, 48),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: width * 0.06,
                        top: width * 0.03,
                        bottom: width * 0.03,
                        right: width * 0.06),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  'Номер',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          Color.fromARGB(255, 163, 164, 174)),
                                ),
                                Text(
                                  '№030304567',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ],
                            ),
                            Container(
                              width: 0.5,
                              height: height * 0.05,
                              color: const Color.fromARGB(255, 163, 164, 174),
                            ),
                            Column(
                              children: const [
                                Text(
                                  'Дата',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          Color.fromARGB(255, 163, 164, 174)),
                                ),
                                Text(
                                  '01.03.2030',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                            color: Color.fromARGB(255, 163, 164, 174)),
                        const Text(
                          'Инициатор',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                        Text(
                          'Скляров Михаил Дмитриеивич',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        const Divider(
                            color: Color.fromARGB(255, 163, 164, 174)),
                        const Text(
                          'Услуга',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                        const Text(
                          'Название услуги',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        const Divider(
                            color: Color.fromARGB(255, 163, 164, 174)),
                        const Text(
                          'Состав услуги',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                        const Text(
                          'Состав услуги',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 163, 164, 174),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  'Статус наряда',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          Color.fromARGB(255, 163, 164, 174)),
                                ),
                                Text(
                                  'Статус наряда',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ],
                            ),
                            Container(
                              width: 0.5,
                              height: height * 0.05,
                              color: const Color.fromARGB(255, 163, 164, 174),
                            ),
                            Column(
                              children: const [
                                Text(
                                  'Состояние',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          Color.fromARGB(255, 163, 164, 174)),
                                ),
                                Text(
                                  'Состояние',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                            color: Color.fromARGB(255, 163, 164, 174)),
                        const Text('Важность заявки',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174),
                            )),
                        const Text(
                          'Низкая',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.push_pin_outlined,
                    size: width * 0.1,
                  ),
                  alignment: Alignment.topRight,
                  color: const Color.fromARGB(200, 163, 164, 174),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 247, 147, 48),
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: const Color.fromARGB(150, 255, 255, 255),
        currentIndex: selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.report_gmailerrorred_sharp, size: width * 0.08),
            label: 'Обращения',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_circle_down,
              size: width * 0.08,
            ),
            label: 'Наряды',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.check_box_outlined, size: width * 0.08),
            label: 'Согласования',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
