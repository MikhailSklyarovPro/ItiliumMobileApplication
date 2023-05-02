import 'package:flutter/material.dart';

class RelatedDocuments extends StatelessWidget {
  const RelatedDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.09,
          backgroundColor: const Color.fromARGB(255, 200, 200, 200),
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Связанные документы',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
          actions: [
            IconButton(
                padding: EdgeInsets.only(right: width * 0.05),
                icon: Icon(
                  Icons.close,
                  size: width * 0.1,
                  color:  Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/myApprovalsWindow/detailedApprovals');
                }),
          ],
        ),
        body: ListView(
          children: const [
            Requests(),
             Orders(),
            Approvals(),
          ],
        ));
  }
}

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  bool expend = false;
  bool textOverFlow = true;
  int numberNotifications = 3;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(children: [
      Container(
          padding: EdgeInsets.only(
            top: width * 0.02,
            left: width * 0.03,
            right: width * 0.03,
            //bottom: width * 0.03
          ),
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 51, 156, 255),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            padding: EdgeInsets.symmetric(
                vertical: width * 0.01, horizontal: width * 0.03),
            width: width * 0.94,
            child: Row(
              children: [
                Text(
                  "Обращения",
                  textAlign: TextAlign.center,
                  overflow: textOverFlow ? TextOverflow.ellipsis : null,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                Container(
                    margin: EdgeInsets.only(left: width * 0.03),
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        right: width * 0.02,
                        top: width * 0.01,
                        bottom: width * 0.01),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            width: 1.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                    child: Center(
                      child: Text(
                        '$numberNotifications',
                        style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    )),
                Expanded(
                  child: changingIcon(width),
                ),
              ],
            ),
          )),
      if (expend)
        Container(
          height: height*0.54,
          width: width*1,
          margin: EdgeInsets.symmetric(horizontal: width*0.02,),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(0),
            itemCount: numberNotifications,
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
                child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, "");
                      },
                      highlightColor: const Color.fromARGB(130, 51, 156, 255),
                      child: Container(
                        padding: EdgeInsets.only(left: width * 0.04, top: width * 0.03, bottom: width * 0.03, right:width * 0.04),
                        height: height * 0.52,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: const [
                                    Text('Номер', style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Color.fromARGB(255, 163, 164, 174)),),
                                    Text('№030304567',style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0)),),
                                  ],
                                ),
                                Container(
                                    width: 0.5,
                                    height: height*0.05,
                                    color:const Color.fromARGB(255, 163, 164, 174),
                                    margin: EdgeInsets.symmetric(horizontal: width*0.03),
                                  ),
                                Column(
                                  children: const [
                                    Text('Дата', style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Color.fromARGB(255, 163, 164, 174)),),
                                    Text('01.03.2030',style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0)),),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              width: width*0.8,
                              height: height * 0.0005,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                            ),
                            const Text('Тема обращения',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 163, 164, 174)),),
                            const Text(
                              'Тема обращения',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Container(
                              width: width*0.8,
                              height: height * 0.0005,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                            ),
                            const Text('Услуга',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 163, 164, 174)),),
                            const Text(
                              'Название услуги',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Container(
                              width: width*0.8,
                              height: height * 0.0005,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                            ),
                            const Text('Состав услуги',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 163, 164, 174)),),
                            const Text(
                              'Состав услуги',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Container(
                              width: width*0.8,
                              height: height * 0.0005,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                            ),
                            const Text('Инициатор',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 163, 164, 174)),),
                            const Text(
                              'ФИО Инициатора',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Container(
                              width: width*0.8,
                              height: height * 0.0005,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: const [
                                    Text('Должность', style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Color.fromARGB(255, 163, 164, 174)),),
                                    Text('Должность',style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0)),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 0.5,
                                  height: height*0.05,
                                  color:const Color.fromARGB(255, 163, 164, 174),
                                  margin: EdgeInsets.symmetric(horizontal: width*0.03),
                                ),
                                Column(
                                  children: const [
                                    Text('Организация', style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Color.fromARGB(255, 163, 164, 174)),),
                                    Text('Организация',style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0)),),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              width: width*0.8,
                              height: height * 0.0005,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                            ),
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
                    ),
              );
            },
          ),
        )
    ]);
  }

  Widget changingIcon(double width) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: width * 0.15,
            onPressed: () {
              setState(() {
                expend = false;
                textOverFlow = true;
              });
            },
            icon: const Icon(
              Icons.arrow_drop_up,
            ),
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
        );
        break;
      case false:
        widget = Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: width * 0.15,
            onPressed: () {
              setState(() {
                expend = true;
                textOverFlow = false;
              });
            },
            icon: const Icon(
              Icons.arrow_drop_down,
            ),
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }
}



class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  bool expend = false;
  bool textOverFlow = true;
  int numberNotifications = 2;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(children: [
      Container(
          padding: EdgeInsets.only(
            top: width * 0.02,
            left: width * 0.03,
            right: width * 0.03,
            //bottom: width * 0.03
          ),
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 247, 147, 48),
                //Color.fromARGB(255, 217, 217, 217),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            padding: EdgeInsets.symmetric(
                vertical: width * 0.01, horizontal: width * 0.03),
            width: width * 0.94,
            child: Row(
              children: [
                Text(
                  "Наряды",
                  textAlign: TextAlign.center,
                  overflow: textOverFlow ? TextOverflow.ellipsis : null,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                Container(
                    margin: EdgeInsets.only(left: width * 0.03),
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        right: width * 0.02,
                        top: width * 0.01,
                        bottom: width * 0.01),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            width: 1.2),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(4))),
                    child: Center(
                      child: Text(
                        '$numberNotifications',
                        style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    )),
                Expanded(
                  child: changingIcon(width),
                ),
              ],
            ),
          )),
      if (expend)
        Container(
          height: height*0.465,
          width: width*1,
          margin: EdgeInsets.symmetric(horizontal: width*0.02,),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(0),
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
                child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, '');
                      },
                      highlightColor: Color.fromARGB(110, 247, 147, 48),
                      child: Container(
                        width: width*0.94,
                        padding: EdgeInsets.only(
                            left: width * 0.03,
                            top: width * 0.03,
                            bottom: width * 0.03,
                            right: width * 0.03),
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
                                  margin: EdgeInsets.symmetric(horizontal: width*0.03),
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
                            Container(
                              width: width*0.8,
                              height: height * 0.0005,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                            ),
                            const Text(
                              'Инициатор',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 163, 164, 174)),
                            ),
                            Text(
                              'Скляров Михаил Дмитриеивич',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Container(
                              width: width*0.8,
                              height: height * 0.0005,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                            ),
                            const Text(
                              'Услуга',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 163, 164, 174)),
                            ),
                            const Text(
                              'Название услуги',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Container(
                              width: width*0.8,
                              height: height * 0.0005,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                            ),
                            const Text(
                              'Состав услуги',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 163, 164, 174)),
                            ),
                            const Text(
                              'Состав услуги',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Container(
                              width: width*0.8,
                              height: height * 0.0005,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
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
                            Container(
                              width: width*0.8,
                              height: height * 0.0005,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                            ),
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
              );
            },
          ),
        )
    ]);
  }

  Widget changingIcon(double width) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: width * 0.15,
            onPressed: () {
              setState(() {
                expend = false;
                textOverFlow = true;
              });
            },
            icon: const Icon(
              Icons.arrow_drop_up,
            ),
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
        );
        break;
      case false:
        widget = Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: width * 0.15,
            onPressed: () {
              setState(() {
                expend = true;
                textOverFlow = false;
              });
            },
            icon: const Icon(
              Icons.arrow_drop_down,
            ),
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }
}



class Approvals extends StatefulWidget {
  const Approvals({Key? key}) : super(key: key);

  @override
  State<Approvals> createState() => _ApprovalsState();
}

class _ApprovalsState extends State<Approvals> {
  bool expend = false;
  bool textOverFlow = true;
  int numberNotifications = 4;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(children: [
      Container(
          padding: EdgeInsets.only(
            top: width * 0.02,
            left: width * 0.03,
            right: width * 0.03,
            //bottom: width * 0.03
          ),
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 51, 156, 48),
                // Color.fromARGB(255, 217, 217, 217),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            padding: EdgeInsets.symmetric(
                vertical: width * 0.01, horizontal: width * 0.03),
            width: width * 0.94,
            child: Row(
              children: [
                Text(
                  "Обращения",
                  textAlign: TextAlign.center,
                  overflow: textOverFlow ? TextOverflow.ellipsis : null,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                Container(
                    margin: EdgeInsets.only(left: width * 0.03),
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        right: width * 0.02,
                        top: width * 0.01,
                        bottom: width * 0.01),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            width: 1.2),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(4))),
                    child: Center(
                      child: Text(
                        '$numberNotifications',
                        style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    )),
                Expanded(
                  child: changingIcon(width),
                ),
              ],
            ),
          )),
      if (expend)
        Container(
          height: height*0.32,
          width: width*1,
          margin: EdgeInsets.symmetric(horizontal: width*0.02,),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(0),
            itemCount: numberNotifications,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 51, 156, 48),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '');
                  },
                  highlightColor: const Color.fromARGB(140, 60, 160, 50),
                  child: Container(
                    width: width*0.94,
                    padding: EdgeInsets.only(
                        left: width * 0.03,
                        top: width * 0.03,
                        bottom: width * 0.03,
                        right: width * 0.03),
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
                              margin: EdgeInsets.symmetric(horizontal: width*0.03),
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
                        Container(
                          width: width*0.78,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                        ),
                        const Text(
                          'Тема обращения',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                        const Text(
                          'Тема обращения',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Container(
                          width: width*0.8,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
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
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Container(
                          width: width*0.8,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(horizontal: width*0.03, vertical: height*0.01),
                        ),
                        const Text(
                          'Статус согласования',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
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
              );
            },
          ),
        )
    ]);
  }

  Widget changingIcon(double width) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: width * 0.15,
            onPressed: () {
              setState(() {
                expend = false;
                textOverFlow = true;
              });
            },
            icon: const Icon(
              Icons.arrow_drop_up,
            ),
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
        );
        break;
      case false:
        widget = Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: width * 0.15,
            onPressed: () {
              setState(() {
                expend = true;
                textOverFlow = false;
              });
            },
            icon: const Icon(
              Icons.arrow_drop_down,
            ),
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }
}
