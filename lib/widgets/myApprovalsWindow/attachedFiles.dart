import 'package:flutter/material.dart';

class AttachedFiles extends StatelessWidget {
  const AttachedFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberFiles = 6;
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
              'Прикрепленные файлы',
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
                Navigator.pushNamed(
                    context, '/myApprovalsWindow/detailedApprovals');
              }),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: numberFiles,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(width: 0.2),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.pushNamed(context, '');
                  },
                  highlightColor: const Color.fromARGB(140, 60, 160, 50),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: width * 0.06,
                        top: width * 0.03,
                        bottom: width * 0.03,
                        right: width * 0.06),
                    child: Column(
                      children: [
                        const Text(
                          'Название файла',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(180, 0, 0, 0)),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            bottom: height * 0.022,
                            top: height * 0.022,
                          ),
                          child: const Center(
                            child: Text(
                              'Картинка.png',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.restore_from_trash,
                    size: width * 0.1,
                  ),
                  alignment: Alignment.bottomRight,
                  color: const Color.fromARGB( 255, 249, 90, 91,),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: const AddButton(),
    );
  }
}

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translateButton;
  bool _isExpanded = false;

  @override
  initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600)
    )
      ..addListener(() {
        setState(() {});
      });


    _translateButton = Tween<double>(
      begin: 120,
      end: -10,
    ).animate(
        CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    )
    );
    super.initState();
  }

  // dispose the animation controller
  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _toggle() {
    if (_isExpanded) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    _isExpanded = !_isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 1.9,
            0.0,
          ),
          child: FloatingActionButton(
            backgroundColor:  const Color.fromARGB(255, 247, 147, 48),
            onPressed: () {
              /* Do something */
            },
            child: const Icon(
              Icons.photo_camera,
              color: Color.fromARGB(255,255,255,255,),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0,
            _translateButton.value * 1.3,
            0,
          ),
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 247, 147, 48),
            onPressed: () {
              /* Do something */
            },
            child: const Icon(
              Icons.folder,
              color:  Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: _toggle,
          backgroundColor: const Color.fromARGB(255, 51, 156, 48),
          child: _isExpanded ? Icon(Icons.close, size: width*0.1,) : Icon(Icons.add,size: width*0.1),
        ),
      ],
    );
  }
}
