import 'package:firstapp/globalVariable/Global.dart';
import 'package:flutter/material.dart';

class RelatedDocuments extends StatelessWidget {
  const RelatedDocuments(
      {Key? key, required this.numberDocument, required this.typeDocument})
      : super(key: key);
  final String numberDocument;
  final String typeDocument;

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
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        body: ListView(
          children: [
            Requests(numberRequest: numberDocument, typeDocument: typeDocument),
            Orders(numberOrder: numberDocument, typeDocument: typeDocument),
            Approvals(numberApprovals: numberDocument, typeDocument: typeDocument),
          ],
        ));
  }
}

class Requests extends StatefulWidget {
  const Requests({Key? key, required this.numberRequest, required this.typeDocument}) : super(key: key);
  final String numberRequest;
  final String typeDocument;

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  bool expend = false;
  bool textOverFlow = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Map> linkedRequests = getLinkedRequests();
    return Column(
        children: [
      Container(
          padding: EdgeInsets.only(
            top: width * 0.02,
            left: width * 0.03,
            right: width * 0.03,
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
                        '${linkedRequests.length}',
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
          height: linkedRequests.isNotEmpty ? height * 0.58 : null,
          width: width * 1,
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.02,
          ),
          child: linkedRequests.isNotEmpty
              ? ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(0),
            itemCount: linkedRequests.length,
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
                  },
                  highlightColor: const Color.fromARGB(130, 51, 156, 255),
                  child: Container(
                    width: width * 0.94,
                    padding: EdgeInsets.only(
                        left: width * 0.04,
                        top: width * 0.03,
                        bottom: width * 0.03,
                        right: width * 0.04),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children:  [
                                const Text(
                                  'Номер',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          Color.fromARGB(255, 163, 164, 174)),
                                ),
                                Text(
                                  '${linkedRequests[index]['numberRequest']}',
                                  style: const TextStyle(
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                            ),
                            Column(
                              children:  [
                                const Text(
                                  'Дата',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          Color.fromARGB(255, 163, 164, 174)),
                                ),
                                Text(
                                  Global.convertDate(DateTime.fromMillisecondsSinceEpoch(linkedRequests[index]['dataTime'])),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: width * 0.8,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.01),
                        ),
                        const Text(
                          'Тема обращения',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                         Text(
                          '${linkedRequests[index]['application']}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Container(
                          width: width * 0.8,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.01),
                        ),
                        const Text(
                          'Услуга',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                         Text(
                          '${linkedRequests[index]['service']}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Container(
                          width: width * 0.8,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.01),
                        ),
                        const Text(
                          'Состав услуги',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                         Text(
                          '${linkedRequests[index]['compositionService']}',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Container(
                          width: width * 0.8,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.01),
                        ),
                        const Text(
                          'Инициатор',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                         Text(
                          '${linkedRequests[index]['initiator']}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Container(
                          width: width * 0.8,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.01),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width*0.4,
                              child: Column(
                                children:  [
                                  const Text(
                                    'Должность',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color:
                                        Color.fromARGB(255, 163, 164, 174)),
                                  ),
                                  Text(
                                    '${linkedRequests[index]['post']}',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 0.5,
                              height: height * 0.05,
                              color: const Color.fromARGB(255, 163, 164, 174),
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                            ),
                            Container(
                              width: width*0.35,
                              child: Column(
                                children:  [
                                  const Text(
                                    'Организация',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color:
                                        Color.fromARGB(255, 163, 164, 174)),
                                  ),
                                  Text(
                                    '${linkedRequests[index]['organization']}',
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: width * 0.8,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.01),
                        ),
                        const Text('Важность заявки',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174),
                            )),
                         Text(
                          '${linkedRequests[index]['priority']}',
                          style: const TextStyle(
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
          )
              : Padding(
            padding: EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.03),
            child: const Text(
              'Связанные обращения отсутсвуют!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
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
  List<Map> getLinkedRequests() {
    List<Map> listRequests = [];
    if(Global.linkedRequests.isNotEmpty)
    {
      for (int i = 0; i < Global.linkedDocuments.length; i++) {
        if (Global.linkedDocuments[i]['typeLinkedDocument'] == widget.typeDocument && Global.linkedDocuments[i]['numberLinkedDocument'] == widget.numberRequest && Global.linkedRequests.where((element) => element.containsValue(Global.linkedDocuments[i]['numberDocument'])).isNotEmpty && Global.linkedDocuments[i]['typeDocument'] == "Обращение")
        {
          listRequests.add((Global.linkedRequests.where((request) => request['numberRequest'] == Global.linkedDocuments[i]['numberDocument'])).first);
        }
      }
    }
    return listRequests;
  }
}

class Orders extends StatefulWidget {
  const Orders({Key? key, required this.numberOrder, required this.typeDocument}) : super(key: key);
  final String numberOrder;
  final String typeDocument;

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  bool expend = false;
  bool textOverFlow = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Map> linkedOrders = getLinkedOrders();
    return Column(
        children: [
          Container(
          padding: EdgeInsets.only(
            top: width * 0.02,
            left: width * 0.03,
            right: width * 0.03,
          ),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 247, 147, 48),
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
                        '${linkedOrders.length}',
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
          height: linkedOrders.isNotEmpty ? height * 0.48 : null,
          width: width * 1,
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.02,
          ),
          child: linkedOrders.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(0),
                  itemCount: linkedOrders.length,
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
                              context, '/linkedDocuments/detailedLinkedOutfit',
                              arguments: linkedOrders[index]['numberOrder']);
                        },
                        highlightColor: const Color.fromARGB(110, 247, 147, 48),
                        child: Container(
                          width: width * 0.94,
                          padding: EdgeInsets.only(
                              left: width * 0.03,
                              top: width * 0.03,
                              bottom: width * 0.03,
                              right: width * 0.03),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Номер',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Color.fromARGB(
                                                255, 163, 164, 174)),
                                      ),
                                      Text(
                                        '№${linkedOrders[index]['numberOrder']}',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 0.5,
                                    height: height * 0.05,
                                    color: const Color.fromARGB(
                                        255, 163, 164, 174),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width * 0.03),
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Дата',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Color.fromARGB(
                                                255, 163, 164, 174)),
                                      ),
                                      Text(
                                        Global.convertDate(DateTime.fromMillisecondsSinceEpoch(linkedOrders[index]['dataTime'])),
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: width * 0.8,
                                height: height * 0.0005,
                                color: const Color.fromARGB(255, 163, 164, 174),
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.03,
                                    vertical: height * 0.01),
                              ),
                              const Text(
                                'Инициатор',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromARGB(255, 163, 164, 174)),
                              ),
                              Text(
                                '${linkedOrders[index]['initiator']}',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Container(
                                width: width * 0.8,
                                height: height * 0.0005,
                                color: const Color.fromARGB(255, 163, 164, 174),
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.03,
                                    vertical: height * 0.01),
                              ),
                              const Text(
                                'Услуга',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromARGB(255, 163, 164, 174)),
                              ),
                              Text(
                                '${linkedOrders[index]['service']}',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Container(
                                width: width * 0.8,
                                height: height * 0.0005,
                                color: const Color.fromARGB(255, 163, 164, 174),
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.03,
                                    vertical: height * 0.01),
                              ),
                              const Text(
                                'Состав услуги',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromARGB(255, 163, 164, 174)),
                              ),
                              Text(
                                '${linkedOrders[index]['compositionService']}',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Container(
                                width: width * 0.8,
                                height: height * 0.0005,
                                color: const Color.fromARGB(255, 163, 164, 174),
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.03,
                                    vertical: height * 0.01),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Статус наряда',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Color.fromARGB(
                                                255, 163, 164, 174)),
                                      ),
                                      Text(
                                        '${linkedOrders[index]['status']}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 0.5,
                                    height: height * 0.05,
                                    color: const Color.fromARGB(
                                        255, 163, 164, 174),
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Состояние',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Color.fromARGB(
                                                255, 163, 164, 174)),
                                      ),
                                      Text(
                                        '${linkedOrders[index]['executionStatus']}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: width * 0.8,
                                height: height * 0.0005,
                                color: const Color.fromARGB(255, 163, 164, 174),
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.03,
                                    vertical: height * 0.01),
                              ),
                              const Text('Важность заявки',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromARGB(255, 163, 164, 174),
                                  )),
                              Text(
                                '${linkedOrders[index]['priority']}',
                                style: const TextStyle(
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
                )
              :   Padding(
              padding: EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.03),
            child: const Text(
              'Связанные наряды отсутсвуют!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
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

  List<Map> getLinkedOrders() {
    List<Map> listOrders = [];
    if(Global.linkedOrders.isNotEmpty)
      {
        for (int i = 0; i < Global.linkedDocuments.length; i++) {
          if (Global.linkedDocuments[i]['typeLinkedDocument'] == widget.typeDocument && Global.linkedDocuments[i]['numberLinkedDocument'] == widget.numberOrder && Global.linkedOrders.where((element) => element.containsValue(Global.linkedDocuments[i]['numberDocument'])).isNotEmpty && Global.linkedDocuments[i]['typeDocument'] == "Наряд")
          {
            listOrders.add(Global.linkedOrders.where((order) => order['numberOrder'] == Global.linkedDocuments[i]['numberDocument']).first);
          }
        }
      }
    return listOrders;
  }
}

class Approvals extends StatefulWidget {
  const Approvals({Key? key, required this.numberApprovals, required this.typeDocument}) : super(key: key);
  final String numberApprovals;
  final String typeDocument;
  @override
  State<Approvals> createState() => _ApprovalsState();
}

class _ApprovalsState extends State<Approvals> {
  bool expend = false;
  bool textOverFlow = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Map> linkedApprovals = getLinkedApprovals();
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
                  "Согласования",
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
                        '${linkedApprovals.length}',
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
          height: linkedApprovals.isNotEmpty ? height * 0.35 : null,
          width: width * 1,
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.02,
          ),
          child: linkedApprovals.isNotEmpty ?
          ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(0),
            itemCount: linkedApprovals.length,
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
                    Navigator.pushNamed(context, '');
                  },
                  highlightColor: const Color.fromARGB(140, 60, 160, 50),
                  child: Container(
                    width: width * 0.94,
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
                              children:  [
                                const Text(
                                  'Номер',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          Color.fromARGB(255, 163, 164, 174)),
                                ),
                                Text(
                                  '№${linkedApprovals[index]['numberApproval']}',
                                  style: const TextStyle(
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                            ),
                            Column(
                              children:  [
                                const Text(
                                  'Дата',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          Color.fromARGB(255, 163, 164, 174)),
                                ),
                                Text(
                                  Global.convertDate(DateTime.fromMillisecondsSinceEpoch(linkedApprovals[index]['dataTime'])),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: width * 0.78,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.01),
                        ),
                        const Text(
                          'Тема обращения',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                         Text(
                          '${linkedApprovals[index]['application']}',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Container(
                          width: width * 0.8,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.01),
                        ),
                        const Text(
                          'Инициатор',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                         Text(
                          '${linkedApprovals[index]['initiator']}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Container(
                          width: width * 0.8,
                          height: height * 0.0005,
                          color: const Color.fromARGB(255, 163, 164, 174),
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.01),
                        ),
                        const Text(
                          'Статус согласования',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 163, 164, 174)),
                        ),
                         Text(
                          '${linkedApprovals[index]['approvalStatus']}',
                          style: const TextStyle(
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
          )
              :Padding(
            padding: EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.03),
            child: const Text(
              'Связанные согласования отсутсвуют!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
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
  List<Map> getLinkedApprovals() {
    List<Map> listApprovals = [];
    if(Global.linkedApprovals.isNotEmpty)
    {
      for (int i = 0; i < Global.linkedDocuments.length; i++) {
        if (Global.linkedDocuments[i]['typeLinkedDocument'] == widget.typeDocument && Global.linkedDocuments[i]['numberLinkedDocument'] == widget.numberApprovals && Global.linkedApprovals.where((element) => element.containsValue(Global.linkedDocuments[i]['numberDocument'])).isNotEmpty && Global.linkedDocuments[i]['typeDocument'] == "Согласование")
        {
          listApprovals.add(Global.linkedApprovals.where((approval) => approval['numberApproval'] == Global.linkedDocuments[i]['numberDocument']).first);
        }
      }
    }
    return listApprovals;
  }
}
