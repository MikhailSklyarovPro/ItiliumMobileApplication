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
                if(_loginController.text ==  (await dataBase.readData("SELECT login FROM 'user'")).first['login']&&_passwordController.text ==  (await dataBase.readData("SELECT password FROM 'user'")).first['password']){
                  Global.orders =  await dataBase.read("order");
                  Global.requests =  await dataBase.read("request");
                  Global.approvals =  await dataBase.read("approval");
                  //Global.files =  await dataBase.read("file");
                  print("${Global.orders}");// для отладки
                  print("${Global.requests}");// для отладки
                  print("${Global.approvals}");// для отладки
                  //print("${Global.files}");// для отладки
                  Navigator.pushNamed(context, '/myRequestsWindow');
                }
                else{
                  if(_passwordController.text ==  (await dataBase.readData("SELECT password FROM 'user'")).first['password']) {
                    setState(() {
                      _checkPassword = false;
                    });
                  }
                  else{
                    setState(() {
                      _checkPassword = true;
                    });
                  }
                  if(_loginController.text ==  (await dataBase.readData("SELECT login FROM 'user'")).first['login'])
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
    //int responseDelete = await dataBase.deleteData('DELETE FROM "approval" WHERE id = 1');
    //int responseInsert =  await dataBase.insertData(
    //    "INSERT INTO 'order' (numberOrder,dataTime,name,surname,middleName,organization,service,compositionService,application,description,solution,status,executionStatus,importanceApplication,belong)"
    //      " VALUES ('866754329','1683300000000','Ольга','Степанидина','Викторовна','Иркутскэнерго','Ребрендинг сайта','Разработать новую концепцию дизайна сайта','Доработка сайта','В связи с изменением логотипа компании и цветовой схемы необходимо изменить внешний вид сайта','На сайте были заменены логотип компании и цветовая схева в соотвествии с требованием заказчика','Приостановлен','Не выполнен','Высокая','0')"
    //);
    //int responseInsert =  await dataBase.insertData(
    //   "INSERT INTO 'request' (numberRequest,dataTime,name,surname,middleName,organization,service,compositionService,application,description,status,post,importanceApplication,belong)"
    //     " VALUES ('809564371','1683000000000','Михаил','Скляров','Дмитриевич','Эн+ диджитал','Корпоративная  услуга','Разработать ТЗ на разработку мобльного приложения для Итилиума','Составление ТЗ','Появилась потребность в разработки мобильного приложения для сотрудников для повышения их мобильности','В работе','Разработчик веб и мобильных приложений','Очень высокая','0')"
    //);
    //int responseInsert =  await dataBase.insertData(
    //  "INSERT INTO 'approval' (numberApproval,dataTime,name,surname,middleName,organization,application,description,approvalStatus,comment,belong)"
    //    " VALUES ('126358573','1681000000000','Михаил','Скляров','Дмитриевич','Эн+ диджитал','Разработка окна ваторизации','Необходимо разработать окно авторизации для мобильного приложения Итилиум','Не согласовано','Дизайн окна авторизации находится на утверждении','0')"
    //);
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


