import 'package:flutter/material.dart';

class MyRequestsWindow extends StatefulWidget {
  const MyRequestsWindow({Key? key}) : super(key: key);

  @override
  State<MyRequestsWindow> createState() => _MyRequestsWindowState();
}

class _MyRequestsWindowState extends State<MyRequestsWindow> {
  @override
  Widget build(BuildContext context) {
    int selectedTab = 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    void onSelectTab(int index) {
      switch (index){
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
        backgroundColor: const Color.fromARGB(255, 51, 156, 255),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              'Мои обращения',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Container(
                margin: EdgeInsets.only(left: width * 0.03),
                width: width * 0.07,
                height: width * 0.07,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255), width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: const Center(
                  child: Text(
                    '1',
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
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3,
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                width: 2,
                color: Color.fromARGB(255, 51, 156, 255),
              ),
            ),
            child:    Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  padding: EdgeInsets.only(left: width * 0.06, top: width * 0.03, bottom: width * 0.03, right:width * 0.06 ),
                  height: height * 0.52,
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text('Номер', style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 163, 164, 174)),),
                              const Text('№030304567',style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),),
                            ],
                          ),
                          Container(
                            width: 0.5,
                            height: height*0.05,
                            color:const Color.fromARGB(255, 163, 164, 174),
                          ),
                          Column(
                            children: [
                              const Text('Дата', style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 163, 164, 174)),),
                              const Text('01.03.2030',style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),),
                            ],
                          ),
                        ],
                      ),
                      const Divider(color:Color.fromARGB(255, 163, 164, 174)),

                      const Text('Тема обращения',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 163, 164, 174)),),
                      const Text(
                        'Тема обращения',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const Divider(color:Color.fromARGB(255, 163, 164, 174)),

                      const Text('Услуга',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 163, 164, 174)),),
                      const Text(
                        'Название услуги',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const Divider(color: Color.fromARGB(255, 163, 164, 174)),

                      const Text('Состав услуги',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 163, 164, 174)),),
                      const Text(
                        'Состав услуги',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const Divider(color: Color.fromARGB(255, 163, 164, 174),),

                      const Text('Инициатор',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 163, 164, 174)),),
                      const Text(
                        'ФИО Инициатора',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const Divider(color: Color.fromARGB(255, 163, 164, 174),),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text('Должность', style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 163, 164, 174)),),
                              const Text('Должность',style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),),
                            ],
                          ),
                          Container(
                            width: 0.5,
                            height: height*0.05,
                            color:const Color.fromARGB(255, 163, 164, 174),
                          ),
                          Column(
                            children: [
                              const Text('Организация', style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 163, 164, 174)),),
                              const Text('Организация',style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),),
                            ],
                          ),
                        ],
                      ),
                      const Divider(color:Color.fromARGB(255, 163, 164, 174)),

                      const Text('Важность заявки',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 163, 164, 174),)),
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
                IconButton(onPressed: (){}, icon: Icon(Icons.push_pin_outlined, size: width*0.1,), alignment: Alignment.topRight,color: const Color.fromARGB(200  , 163, 164, 174),),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 51, 156, 255),
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        currentIndex: selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
                Icons.report_gmailerrorred_sharp,
                size: width * 0.08),
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
            icon: Icon(
                Icons.check_box_outlined,
                size: width * 0.08),
            label: 'Согласования',
          ),
        ],
        onTap :  onSelectTab,
      ),
    );
  }
}
