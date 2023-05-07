import 'package:firstapp/globalVariable/Global.dart';
import 'package:flutter/material.dart';

class DetailedRequest extends StatelessWidget {
  const DetailedRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberRequest = ModalRoute.of(context)!.settings.arguments as int;
    Map request = Global.requests.firstWhere((request) => request['numberRequest'] == numberRequest);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.09,
          backgroundColor: const Color.fromARGB(255, 51, 156, 255),
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Обращение №$numberRequest',
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              Text(
                Global.convertTime(
                    DateTime.fromMillisecondsSinceEpoch(request['dataTime'])),
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
                  Navigator.pushNamed(context, '/myRequestsWindow');
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
                      'Состояние',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                    Text(
                      "${request['status']}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    Service(numberRequest: numberRequest),
                    const Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    const Text(
                      'Инициатор',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                    Text(
                      "${request['surname']} ${request['name']} ${request['middleName']}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    const Text(
                      'Должность',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                    Text(
                      "${request['post']}",
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
                      "${request['organization']}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    Application(numberRequest: numberRequest),
                    const Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    const Text(
                      'Важность заявки',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                    Text(
                      "${request['importanceApplication']}",
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
            const ButtonsBottom(),
          ],
        ));
  }
}

class ButtonsBottom extends StatefulWidget {
  const ButtonsBottom({Key? key}) : super(key: key);

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
                Navigator.pushNamed(context, '');
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: const Color.fromARGB(255, 51, 156, 255),
                  foregroundColor: const Color.fromARGB(255, 9, 82, 150),
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
              setState(() {});
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
  const Service({Key? key, required this.numberRequest}) : super(key: key);
  final int numberRequest;

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  bool expend = false;
  bool textOverFlow = true;

  @override
  Widget build(BuildContext context) {
    Map request = Global.requests.firstWhere(
        (request) => request['numberRequest'] == widget.numberRequest);
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: width * 0.03, right: width * 0.08),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.04),
                    child: const Text(
                      'Услуга',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                  ),
                  Text(
                    request['service'],
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
        detailedDescription(width, request['compositionService']),
      ],
    );
  }

  Widget changingIcon(double width) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Positioned(
          left: width * 0.8,
          child: IconButton(
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
          padding: EdgeInsets.only(
            top: width * 0.02,
          ),
          child: Column(
            children: [
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
  const Application({Key? key, required this.numberRequest}) : super(key: key);
  final int numberRequest;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool expend = false;
  bool textOverFlow = true;

  @override
  Widget build(BuildContext context) {
    Map request = Global.requests.firstWhere(
        (request) => request['numberRequest'] == widget.numberRequest);
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: width * 0.03, right: width * 0.08),
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
                    request['application'],
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
                Navigator.pushNamed(context, '');
              },
              icon: Image.asset('assets/images/buttonIcon/relatedDocument.png'),
              iconSize: width * 0.1,
              alignment: Alignment.topRight,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
              icon:
                  Image.asset('assets/images/buttonIcon/relatedApprovals.png'),
              iconSize: width * 0.1,
              alignment: Alignment.topRight,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '');
              },
              icon: Image.asset('assets/images/buttonIcon/attachedFiles.png'),
              iconSize: width * 0.1,
              alignment: Alignment.topRight,
            ),
          ],
        ),
        detailedDescription(width, request['description']),
      ],
    );
  }

  Widget changingIcon(double width) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Positioned(
          left: width * 0.8,
          child: IconButton(
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

  Widget detailedDescription(double width, String description) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Padding(
          padding: EdgeInsets.only(top: width * 0.02),
          child: Column(
            children: [
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
