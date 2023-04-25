import 'package:flutter/material.dart';

//всю форму авторизации делаем statefull так как там будут изменяться все поля
class AuthorizationForm extends StatefulWidget {
  const AuthorizationForm({Key? key}) : super(key: key);

  @override
  State<AuthorizationForm> createState() => _AuthorizationFormState();
}

class _AuthorizationFormState extends State<AuthorizationForm> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 370,
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),//заливка контейнера
        border:
        Border.all(color: Colors.black.withOpacity(0.5), width: 1), //цвет и ширина рамки контейнера
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)),
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

             const TextField(
              decoration: InputDecoration(
                counterText: "", //отключаем счетчик символов
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                ),
                hintStyle: TextStyle(color: Color.fromARGB(127, 0, 0, 0)),
                hintText: "Логин",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color.fromARGB(255, 247, 147, 48)),
                ),
                focusColor: Color.fromARGB(255, 247, 147, 48),
              ),
              cursorColor: Color.fromARGB(255, 247, 147, 48),
              maxLength: 15,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 20),

                SizedBox(
                  height: 60,
child:
TextField(
  obscureText: _obscurePassword,
  decoration: InputDecoration(
    counterText: "", //отключаем счетчик символов
    border:  const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(9.0)),
    ),
    hintStyle: const TextStyle(color: Color.fromARGB(127, 0, 0, 0)),
    hintText: "Пароль",
    focusedBorder:  const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: Color.fromARGB(255, 247, 147, 48)),
    ),
    focusColor:  const Color.fromARGB(255, 247, 147, 48),

    suffix: IconButton(    padding: const EdgeInsets.all(0),
      iconSize: 20.0,
      icon: _obscurePassword ?   const Icon(Icons.visibility_off, color: Colors.grey) :  const Icon(Icons.visibility, color: Colors.black,),
      onPressed: () {
        setState(() {_obscurePassword = !_obscurePassword;});},
    ),

  ),
  cursorColor: const Color.fromARGB(255, 247, 147, 48),
  maxLength: 15,
  style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 0, 0, 0)),

),
                ),

            const SizedBox(height: 25),


               ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/myOutfitsWindow');
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)),
                      backgroundColor:
                      const Color.fromARGB(255, 247, 147, 48),
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
              onPressed: (){},
              child:   const Text(
                'Забыли пароль?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    fontFamily: "Segue",
                    color: Color.fromARGB(255, 253, 147, 48),
                    fontWeight: FontWeight.w400
                ),
              ),
          ),
          ],
        ),
    );
  }
}

//все окно авторизации делаем stateless
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

