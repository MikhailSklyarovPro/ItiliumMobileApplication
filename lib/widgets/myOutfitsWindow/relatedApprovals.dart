import 'package:flutter/material.dart';

class RelatedApprovals extends StatelessWidget {
  const RelatedApprovals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height*0.08,
        backgroundColor: const Color.fromARGB(255, 247, 147, 48),
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
                Text(
                  'Связанные согласования',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
          ],
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: width * 0.05),
              icon: Icon(
                Icons.close,
                size: width * 0.1,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/myOutfitsWindow/detailedOutfit');
              }),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 8,
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
                    //Navigator.pushNamed(context, '/myApprovalsWindow/detailedApprovals');
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
                          'Тема',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                        const Text(
                          'Тема обращения',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 163, 164, 174),
                        ),

                        const Text(
                          'Инициатор',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                        const Text(
                          'ФИО Инициатора',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        const Divider(
                            color: Color.fromARGB(255, 163, 164, 174)),

                        const Text('Статус согласования',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174),
                            )),
                        const Text(
                          'Согласовано',
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
    );
  }
}
