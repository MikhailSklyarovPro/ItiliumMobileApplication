import 'package:firstapp/globalVariable/Global.dart';
import 'package:firstapp/widgets/attachedFiles/attachedFiles.dart';
import 'package:firstapp/widgets/relatedDocuments/relatedDocuments.dart';
import 'package:flutter/material.dart';

class DetailedOutfit extends StatelessWidget {
  const DetailedOutfit({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final numberOrder = ModalRoute.of(context)!.settings.arguments as String; //Получаем аргументы с предыдущего окна
    Map order = Global.orders.firstWhere((order) => order['numberOrder'] == numberOrder);
    _StatusState.newStatus = order['status'];
    _StatusState.newExecutionStatus = order['executionStatus'];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.09,
          backgroundColor: const Color.fromARGB(255, 247, 147, 48),
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                'Наряд №$numberOrder',
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
               Text(
                "от ${Global.convertTime(DateTime.fromMillisecondsSinceEpoch(order["dataTime"]))}",
                style: const TextStyle(
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
                  Navigator.pushNamed(context, '/myOutfitsWindow');
                }),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.all(width * 0.04),
                child: Column(
                  children: [
                    const Text(
                      'Инициатор',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                    Text(
                      '${order['initiator']}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    const Text(
                      'Организация',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                    Text(
                      '${order['organization']}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    Service(numberOrder: numberOrder),
                    const Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    Application(numberOrder: numberOrder),
                    const Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    const Status(),
                    const Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    const Text(
                      'Важность заявки',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                    Text(
                      order['priority'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const Divider(color: Color.fromARGB(255, 163, 164, 174)),
                  ],
                ),
              )),
            ),
             ButtonsBottom(numberOrder: order['numberOrder'],),
          ],
        ));
  }
}

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);
  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  static late String newStatus;
  static late String newExecutionStatus;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Состояние',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Color.fromARGB(185, 0, 0, 0)),
        ),
        Text(
          newStatus,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: newStatus != "Закрыт" ? () {
                newStatus = 'В работе';
                setState(() {
                });
              } : null,
              icon:
              Image.asset('assets/images/buttonIcon/play.png'),
              iconSize: Global.width * 0.06,
              alignment: Alignment.topRight,
            ),
            IconButton(
              onPressed: newStatus != "Закрыт" ? () {
                newStatus = 'Приостановлен';
                setState(() {
                });
              } : null,
              icon:
              Image.asset('assets/images/buttonIcon/pause.png'),
              iconSize: Global.width * 0.05,
              alignment: Alignment.topRight,
            ),
          ],
        ),
        const Divider(color: Color.fromARGB(255, 163, 164, 174)),
        const Text(
          'Статус выполнения',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Color.fromARGB(185, 0, 0, 0)),
        ),
        Text(
          newExecutionStatus,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                newExecutionStatus = "Выполнен";
                newStatus = "Закрыт";
                setState(() {
                });
              } ,
              icon: Image.asset(
                  'assets/images/buttonIcon/checkMark.png'),
              iconSize: Global.width * 0.06,
              alignment: Alignment.topRight,
            ),
            IconButton(
              onPressed: () {
                newExecutionStatus = "Отклонен";
                newStatus = "Закрыт";
                setState(() {

                });
              },
              icon: Image.asset(
                  'assets/images/buttonIcon/redClose.png'),
              iconSize: Global.width * 0.055,
              alignment: Alignment.topRight,
            ),
            IconButton(
              onPressed: () {
                newExecutionStatus = "Не может быть реализован";
                newStatus = "Закрыт";
                setState(() {

                });
              },
              icon: Image.asset(
                  'assets/images/buttonIcon/blueClose.png'),
              iconSize: Global.width * 0.055,
              alignment: Alignment.topRight,
            ),
            IconButton(
              onPressed: () {
                newExecutionStatus = "-";
                newStatus = "Приостановлен";
                setState(() {

                });
              },
              icon: Image.asset(
                  'assets/images/buttonIcon/eraser.png'),
              iconSize: Global.width * 0.055,
              alignment: Alignment.topRight,
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonsBottom extends StatefulWidget {
  const ButtonsBottom({Key? key, required this.numberOrder}) : super(key: key);
  final String numberOrder;
  @override
  State<ButtonsBottom> createState() => _ButtonsBottomState();
}

class _ButtonsBottomState extends State<ButtonsBottom> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: const Color.fromARGB(255, 247, 147, 48),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                  ),
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: height*0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: height*0.01),
                            child: const Text(
                              "Изменение наряда",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                          Container(
                            height: height*0.33,
                            margin: EdgeInsets.only(left: width*0.03, right: width* 0.03),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text('Модальное окошечко'),
                                  ElevatedButton(
                                    child: const Text('Закрыть модальное окошечко'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
/*
                Global.dataBase.update('order', {'status': _StatusState.newStatus}, "numberOrder = ${widget.numberOrder}");
                Global.dataBase.update('order', {'executionStatus': _StatusState.newExecutionStatus}, "numberOrder = ${widget.numberOrder}");
                Global.orders =  await Global.dataBase.readData("SELECT * FROM 'order' WHERE linked='false'");
 */
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: const Color.fromARGB(255, 247, 147, 48),
                  foregroundColor: const Color.fromARGB(255, 128, 53, 4),
                  padding: const EdgeInsets.symmetric(vertical: 14)),
              child: SizedBox(
                  width: width * 0.4,
                  child: const Center(
                    child: Text(
                      'Записать',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Segue",
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w400),
                    ),
                  ))),
          SizedBox(
            width: width * 0.06,
          ),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: const Color.fromARGB(255, 230, 235, 240),
                foregroundColor: const Color.fromARGB(255, 190, 195, 200),
                padding: const EdgeInsets.symmetric(vertical: 14)),
            child: SizedBox(
                width: width * 0.4,
                child: const Center(
                  child: Text(
                    'Отмена',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Segue",
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class Service extends StatefulWidget {
  const Service({Key? key, required this.numberOrder}):super(key: key);
  final String numberOrder;
  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  bool expend = false;
  bool textOverFlow = true;
  @override
  Widget build(BuildContext context) {
    Map order = Global.orders.firstWhere((order) => order['numberOrder'] == widget.numberOrder);
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
      Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: width*0.03, right: width*0.08),
          child: Column(
            children: [
               Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child:  const Text(
                  'Услуга',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(185, 0, 0, 0)),
                ),
              ),
             Text(
                order['service'],
                textAlign: TextAlign.center,
                overflow: textOverFlow ? TextOverflow.ellipsis : null,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        ),
        changingIcon(width),
      ],
    ),
      detailedDescription(width,order['compositionService']),
      ],
    );
  }

  Widget changingIcon(double width) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Positioned(
          left: width*0.8,
            child:
            IconButton(
              onPressed: () {
                setState(() {
                  expend = false;
                  textOverFlow = true;
                });
              },
              icon: Icon(
                Icons.arrow_drop_up,
                size: width * 0.1,
              ),
              alignment: Alignment.centerRight,
              color: const Color.fromARGB(200, 0, 0, 0),
            ),
        );
        break;
      case false:
        widget = Positioned(
          left: width * 0.8,
          child: IconButton(
            onPressed: () {
              setState(() {
                expend = true;
                textOverFlow = false;
              });
            },
            icon: Icon(
              Icons.arrow_drop_down,
              size: width * 0.1,
            ),
            alignment: Alignment.centerRight,
            color: const Color.fromARGB(200, 0, 0, 0),
          ),
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }

  Widget detailedDescription(double width, String compositionService) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Container(
          padding: EdgeInsets.only(top: width*0.02),
          child: Column(
            children:  [
              const Text(
                'Состав услуги',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(185, 0, 0, 0)),
              ),
              Text(
                compositionService,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        );
        break;
      case false:
        widget = const SizedBox(
          width: 0,
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }
}

class Application extends StatefulWidget {
  const Application({Key? key, required this.numberOrder}) : super(key: key);
  final String numberOrder;
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool expend = false;
  bool textOverFlow = true;

  @override
  Widget build(BuildContext context) {
    Map order = Global.orders.firstWhere((order) => order['numberOrder'] == widget.numberOrder);
    final width = MediaQuery.of(context).size.width;
    return  Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: width*0.03, right: width*0.08),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.04),
                    child: const Text(
                      'Заявка',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                  ),
                  Text(
                    order['application'],
                    textAlign: TextAlign.center,
                    overflow: textOverFlow ? TextOverflow.ellipsis : null,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),
            changingIcon(width),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                  MaterialPageRoute(
                      builder: (context) =>  RelatedDocuments(
                        numberDocument: widget.numberOrder,
                        typeDocument: "Наряд",
                      ),
                  ),
                );
              },
              icon: Image.asset(
                  'assets/images/buttonIcon/relatedDocument.png'),
              iconSize: width * 0.1,
              alignment: Alignment.topRight,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  AttachedFiles(
                      id: order['id'],
                      typeDocument: "Наряд",
                    ),
                  ),
                );
              },
              icon: Image.asset(
                  'assets/images/buttonIcon/attachedFiles.png'),
              iconSize: width * 0.1,
              alignment: Alignment.topRight,
            ),
          ],
        ),
        detailedDescription(width, order['description'], order['solution']),
      ],
    );
  }

  Widget changingIcon(double width) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Positioned(
          left: width*0.8,
          child:
          IconButton(
            onPressed: () {
              setState(() {
                expend = false;
                textOverFlow = true;
              });
            },
            icon: Icon(
              Icons.arrow_drop_up,
              size: width * 0.1,
            ),
            alignment: Alignment.centerRight,
            color: const Color.fromARGB(200, 0, 0, 0),
          ),
        );
        break;
      case false:
        widget = Positioned(
          left: width * 0.8,
          child: IconButton(
            onPressed: () {
              setState(() {
                expend = true;
                textOverFlow = false;
              });
            },
            icon: Icon(
              Icons.arrow_drop_down,
              size: width * 0.1,
            ),
            alignment: Alignment.centerRight,
            color: const Color.fromARGB(200, 0, 0, 0),
          ),
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }

  Widget detailedDescription(double width, String description, String solution) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Padding(
          padding: EdgeInsets.only(top: width*0.02),
          child: Column(
            children:  [
              const Text(
                'Описание',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(185, 0, 0, 0)),
              ),
               Text(
                 description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              Padding(
                  padding: EdgeInsets.only(top: width*0.02),
                child:  const Text(
                  'Решение',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(185, 0, 0, 0)),
                ),
              ),
               Text(
                solution,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        );
        break;
      case false:
        widget = const SizedBox(
          width: 0,
        );
        break;
      default:
        widget = Container();
    }

    return widget;
  }
}
