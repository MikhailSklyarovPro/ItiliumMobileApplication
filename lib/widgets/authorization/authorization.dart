import 'package:firstapp/database/database.dart';
import 'package:firstapp/globalVariable/Global.dart';
import 'package:flutter/material.dart';

class AuthorizationForm extends StatefulWidget {
  const AuthorizationForm({Key? key}) : super(key: key);

  @override
  State<AuthorizationForm> createState() => _AuthorizationFormState();
}

class _AuthorizationFormState extends State<AuthorizationForm> {
  DataBase dataBase = DataBase();
  bool _obscurePassword = true;
  bool _checkLogin = false;
  bool _checkPassword = false;
  final  _loginController = TextEditingController();
  final  _passwordController = TextEditingController();

  @override
  void initState() {
    initField();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(color: Colors.black.withOpacity(0.5), width: 1),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 7,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "SD Итилиум",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Segoe",
              fontSize: 34,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 15),
           TextField(
            controller: _loginController,
            decoration:  InputDecoration(
              enabledBorder:  OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(9.0)),
                borderSide: BorderSide(
                  color: _checkLogin ? const Color.fromARGB(255, 191, 0, 0): const Color.fromARGB(127, 0, 0, 0),
                )
              ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide:
                BorderSide(color: _checkLogin ? const Color.fromARGB(255, 191, 0, 0): const Color.fromARGB(255, 247, 147, 48),),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                borderSide:
                BorderSide(color: _checkLogin ? const Color.fromARGB(255, 191, 0, 0): const Color.fromARGB(127, 0, 0, 0),),
              ),
              counterText: "",
              hintStyle: const TextStyle(color: Color.fromARGB(127, 0, 0, 0)),
              hintText: "Логин",
            ),
            cursorColor: const Color.fromARGB(255, 247, 147, 48),
            maxLength: 40,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
          _checkLogin ? checkLogin() : const SizedBox(height: 20),
          SizedBox(
            height: 60,
            child: TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                enabledBorder:  OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(9.0)),
                    borderSide: BorderSide(
                      color: _checkPassword ? const Color.fromARGB(255, 191, 0, 0): const Color.fromARGB(127, 0, 0, 0),
                    )
                ),
                focusedBorder:  OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  borderSide:
                  BorderSide(color: _checkPassword ? const Color.fromARGB(255, 191, 0, 0): const Color.fromARGB(255, 247, 147, 48),),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(9)),
                  borderSide:
                  BorderSide(color: _checkPassword ? const Color.fromARGB(255, 191, 0, 0): const Color.fromARGB(127, 0, 0, 0),),
                ),
                counterText: "",
                hintStyle: const TextStyle(color: Color.fromARGB(127, 0, 0, 0)),
                hintText: "Пароль",
                suffix: IconButton(
                  padding: const EdgeInsets.all(0),
                  iconSize: 20.0,
                  icon: _obscurePassword
                      ? const Icon(Icons.visibility_off, color: Colors.grey)
                      : const Icon(Icons.visibility, color: Colors.black,),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              cursorColor: const Color.fromARGB(255, 247, 147, 48),
              maxLength: 20,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          _checkPassword ? checkPassword() : const SizedBox(height: 25),
          ElevatedButton(
              onPressed: () async{
                if(_loginController.text ==  (await Global.dataBase.readData("SELECT login FROM 'user'")).first['login']&&_passwordController.text ==  (await Global.dataBase.readData("SELECT password FROM 'user'")).first['password']){
                  Global.orders =  await Global.dataBase.readData("SELECT * FROM 'order' WHERE linked='false'");
                  Global.linkedOrders =  await Global.dataBase.readData("SELECT * FROM 'order'");

                  Global.requests =  await Global.dataBase.readData("SELECT * FROM 'request' WHERE linked='false'");
                  Global.linkedRequests =  await Global.dataBase.readData("SELECT * FROM 'request'");

                  Global.approvals =  await Global.dataBase.readData("SELECT * FROM 'approval' WHERE linked='false'");
                  Global.linkedApprovals =  await Global.dataBase.readData("SELECT * FROM 'approval'");

                  Global.linkedDocuments =  await Global.dataBase.read("linkedDocuments");

                  Global.width = MediaQuery.of(context).size.width;
                  Global.width = MediaQuery.of(context).size.height;

                  //Global.files =  await dataBase.read("file");
                  //print("${Global.orders}");// для отладки
                  //print("Количество нарядов:${Global.linkedOrders.length}");// для отладки
                  //print("${Global.linkedOrders}");
                  //print("${Global.linkedDocuments}");
                  //print("${Global.requests}");// для отладки
                  //print("${Global.approvals}");// для отладки
                  //print("${Global.files}");// для отладки
                  Navigator.pushNamed(context, '/myRequestsWindow');
                }
                else{
                  if(_passwordController.text ==  (await Global.dataBase.readData("SELECT password FROM 'user'")).first['password']) {
                    setState(() {
                      _checkPassword = false;
                    });
                  }
                  else{
                    setState(() {
                      _checkPassword = true;
                    });
                  }
                  if(_loginController.text ==  (await Global.dataBase.readData("SELECT login FROM 'user'")).first['login'])
                  {
                    setState(() {
                      _checkLogin = false;
                    });
                  }
                  else{
                    setState(() {
                      _checkLogin = true;
                    });
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                  backgroundColor: const Color.fromARGB(255, 247, 147, 48),
                  foregroundColor: const Color.fromARGB(255, 128, 53, 4),
                  padding: const EdgeInsets.symmetric(vertical: 14)),
              child: const Text(
                'Войти',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Segue",
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w400),
              )),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Забыли пароль?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontFamily: "Segue",
                  color: Color.fromARGB(255, 253, 147, 48),
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  initField() async{
    //dataBase.deleteDataBase();

    //int responseDelete = await dataBase.deleteData('DELETE FROM "order" WHERE id = 2');
    //int responseDelete1 = await dataBase.deleteData('DELETE FROM "order" WHERE id = 3');
    //int responseInsert =  await dataBase.insertData(
    //    "INSERT INTO 'order' (numberOrder,dataTime,initiator,organization,service,compositionService,application,description,solution,status,executionStatus,priority,linked)"
    //     " VALUES ('122236004','1682990000000','Ланцов Прохор Николаевич','Русал','Интеграция ПО','Интегрировать ПО с установкой','Необходимо поставить связать ПО и установку','Для установки было разработано дополнительное ПО, которое необходимо интегрировать с установкой','ПО было интегрировано с установкой','В работе','Не выполнен','Высокая', 'true')"
    //);

    //int responseInsert2 =  await dataBase.insertData(
    //    "INSERT INTO 'order' (numberOrder,dataTime,initiator,organization,service,compositionService,application,description,solution,status,executionStatus,priority,linked)"
    //        " VALUES ('666661111','1682588000000','Иванов Иванович','Эн+ диджитал','Ремонт сетей','Устранение неполадок в работе сети','Комьютеры не видят сеть','После установки новых маршрутизаторов пропала сеть','Настроил маршрутизаторы и подключил компьютеры к сети','В работе','Не выполнен','Средняя', 'false')"
    //);

    //print("$responseInsert");
    //int responseUser=  await dataBase.insertData(
    // "INSERT INTO 'user' (password,login,role)"
    //     " VALUES ('12345','Скляров Михаил Дмитриевич','Исполнитель')"
    //);
    //print("$responseUser");

   // int responseInsert =  await dataBase.insertData(
   //    "INSERT INTO 'request' (numberRequest,dataTime,initiator,organization,service,compositionService,application,description,status,post,priority,linked)"
   //      " VALUES ('009564371','1683000000000','Храмцов Константин Иванович','Эн+ диджитал','Корпоративная  услуга','Разработать ТЗ на разработку мобльного приложения для Итилиума','Составление ТЗ','Появилась потребность в разработки мобильного приложения для сотрудников для повышения их мобильности','В работе','Разработчик веб и мобильных приложений','Очень высокая','false')"
   // );

    //int response =  await dataBase.insertData(
    //  "INSERT INTO 'approval' (numberApproval,dataTime,initiator,organization,application,description,approvalStatus,comment,linked)"
    //    " VALUES ('126358573','1681000000000','Прихода Виталий Анатольевич','Эн+ диджитал','Разработка окна ваторизации','Необходимо разработать окно авторизации для мобильного приложения Итилиум','Не согласовано','Дизайн окна авторизации находится на утверждении','false')"
    //);

    //int response =  await dataBase.insertData(
    //  "INSERT INTO 'linkedDocuments' (typeDocument,numberDocument,typeLinkedDocument,numberLinkedDocument)"
    //    " VALUES ('Согласование','126358573','Обращение','009564371')"
    //);

    Global.dataBase = dataBase;
    List<Map> responseAuthorization =  await dataBase.read("user");
   _loginController.text = responseAuthorization.first['login'];
    _passwordController.text = responseAuthorization.first['password'];
    print("$responseAuthorization");
  }

  Widget checkLogin() {
    return const Padding(
        padding: EdgeInsets.only(bottom: 15),
      child: Text(
        'Пользователь не найден!',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14,
            fontFamily: "Segue",
            color: Color.fromARGB(191, 200, 0, 0),
            fontWeight: FontWeight.w400),
      ),
    );
  }
  Widget checkPassword() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Text(
        'Неверный пароль!',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14,
            fontFamily: "Segue",
            color: Color.fromARGB(255, 191, 0, 0),
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

class AuthorizationWindow extends StatelessWidget {
  const AuthorizationWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 280),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Image.asset(
                "assets/images/logoEnplus.png",
                color: const Color.fromARGB(255, 247, 147, 48),
              ),
            ),
          ),
          const AuthorizationForm(),
        ],
      ),
    );
  }
}


