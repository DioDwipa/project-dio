import 'package:flutter/material.dart';
import 'package:stt_mobile/pages/index.dart';
import 'package:stt_mobile/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: height * 0.20 + 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/Logo My Daily-01 6.png"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Selamat ',
                        style:
                            regular.copyWith(fontSize: 16, color: Colors.black),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Datang Kembali!',
                        style:
                            regular.copyWith(fontSize: 16, color: Colors.black),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: 500,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "username"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.black),
                          filled: true,
                          hintText: "password"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lupa password ?',
                            style: regular.copyWith(
                                fontSize: 12, color: Colors.black),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 238,
                      height: 57,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) {
                            return MainPage();
                          }));
                        },
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(biru)),
                        child: Text(
                          'Masuk',
                          style: semibold.copyWith(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){
                      
                    }, child: Text('Belum punya akun ?', style: regular.copyWith(color: biru),)),
                    const SizedBox(
                      height: 15,
                    ),
                   
                  ],
                ),
              ),
              const SizedBox(
                height: 69,
              ),
               Image.asset("assets/icons/A-05 2.png",fit: BoxFit.cover,width: 1000,),
            ],
          ),
        ),
      ),
    );
  }
}
