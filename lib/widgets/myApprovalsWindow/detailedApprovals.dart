import 'package:flutter/material.dart';

class DetailedApprovals extends StatelessWidget {
  const DetailedApprovals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.09,
        backgroundColor: const Color.fromARGB(255, 51, 156, 48),
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Согласование №030304567',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Text(
              'от 01.03.2030 00:00:02',
              style: TextStyle(
                  fontSize: 24,
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
                Navigator.pushNamed(context, '/myApprovalsWindow');
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(child:SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Column(
                  children: const [
                    Text(
                      'Инициатор',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                    Text(
                      'ФИО Инициатора',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    Text(
                      'Организация',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                    Text(
                      'Организация',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    Application(),
                    Divider(color: Color.fromARGB(255, 163, 164, 174)),
                    Text(
                      'Коментарий',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(185, 0, 0, 0)),
                    ),
                    Service(),
                    Divider(color: Color.fromARGB(255, 163, 164, 174)),
                  ],
                ),
              )),),
          const ButtonsBottom(),
        ],
      )
    );
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
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: height*0.02, top: height*0.02,),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/myOutfitsWindow');
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor:
                    const Color.fromARGB(255, 51, 156, 48),
                    foregroundColor: const Color.fromARGB(255, 11, 59, 12),
                    padding: const EdgeInsets.symmetric(vertical: 14)),
                child:  SizedBox(
                    width: width*0.4,
                    child: const Center(
                      child: Text(
                        'Записать',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Segue",
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w400),
                      ),
                    )
                )),
            SizedBox(
              width: width*0.06,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {

                });
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor:
                  const Color.fromARGB(255, 230, 235, 240),
                  foregroundColor: const Color.fromARGB(255, 190, 195, 200),
                  padding: const EdgeInsets.symmetric(vertical: 14)),
              child: SizedBox(
                  width: width*0.4,
                  child: const Center(
                    child: Text(
                      'Отмена',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Segue",
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w400),
                    ),
                  )
              ),),
          ],
        ),
    );
  }
}

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  bool expend = false;
  bool textOverFlow = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Flexible(child: Container(
              padding: EdgeInsets.only(bottom: width * 0.02),
              width: width,
              alignment: AlignmentDirectional.center,
              child: Column(
                children:  [
                  textOverFlow
                      ? Text(
                    'Коментарий к заявке очень большой настолько большой что его даже никто никогда не будет читать',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  )
                      : Text(
                    'Коментарий к заявке очень большой настолько большой что его даже никто никогда не будет читать Коментарий к заявке очень большой настолько большой что его даже никто никогда не будет Коментарий к заявке очень большой настолько большой что его даже никто никогда не будет читатьКоментарий к заявке очень большой настолько большой что его даже никто никогда не будет читатьКоментарий к заявке очень большой настолько большой что его даже никто никогда не будет читать',
                    //overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),),
            changingIcon(width),
          ],
        ),
      ],
    );
  }

  Widget changingIcon(double width,) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Container(child:Positioned(
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
            alignment: Alignment.topRight,
            color: const Color.fromARGB(200, 0, 0, 0),
          ),
        ));
        break;
      case false:
        widget = Container(child: Positioned(
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
            alignment: Alignment.topRight,
            color: const Color.fromARGB(200, 0, 0, 0),
          ),
        ));
        break;
      default:
        widget = Container();
    }
    return widget;
  }

}


class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool expend = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: width * 0.02),
              width: width,
              alignment: AlignmentDirectional.center,
              child: Column(
                children: [
                  const Text(
                    'Заявка',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(185, 0, 0, 0)),
                  ),
                  const Text(
                    'Тема обращения',
                    style: TextStyle(
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
                          Navigator.pushNamed(
                              context, '/myOutfitsWindow/detailedOutfit');
                        },
                        icon: Image.asset(
                            'assets/images/buttonIcon/relatedDocument.png'),
                        iconSize: width * 0.1,
                        alignment: Alignment.topRight,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/myOutfitsWindow/detailedOutfit');
                        },
                        icon: Image.asset(
                            'assets/images/buttonIcon/attachedFiles.png'),
                        iconSize: width * 0.1,
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            changingIcon(width),
          ],
        ),
        detailedDescription(width),
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
              });
            },
            icon: Icon(
              Icons.arrow_drop_up,
              size: width * 0.1,
            ),
            alignment: Alignment.topRight,
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
              });
            },
            icon: Icon(
              Icons.arrow_drop_down,
              size: width * 0.1,
            ),
            alignment: Alignment.topRight,
            color: const Color.fromARGB(200, 0, 0, 0),
          ),
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }

  Widget detailedDescription(double width) {
    Widget widget;
    switch (expend) {
      case true:
        widget = Column(
          children: const [
            Text(
              'Описание',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(185, 0, 0, 0)),
            ),
            Text(
              "Описание заявки",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
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
