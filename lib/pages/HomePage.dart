import 'package:flutter/material.dart';
import 'package:stt_mobile/pages/DetailAnggota.dart';
import 'package:stt_mobile/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, right: 12),
            height: 260,
            color: hijau,
            width: width,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'OM SUASTIASTU',
                        style: bold.copyWith(
                          fontSize: 24,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: const Offset(
                                  2, 2), // Menentukan posisi bayangan (x, y)
                              blurRadius:
                                  3, // Menentukan jarak sebaran bayangan
                              color: Colors.black.withOpacity(
                                  0.5), // Menentukan warna bayangan
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Selamat Datang',
                        style: bold.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: const Offset(
                                  2, 2), // Menentukan posisi bayangan (x, y)
                              blurRadius:
                                  3, // Menentukan jarak sebaran bayangan
                              color: Colors.black.withOpacity(
                                  0.5), // Menentukan warna bayangan
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        width: width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.person_pin,
                                  size: 36,
                                  color: Colors.black,
                                ),
                                label: Text(
                                  'Made Kembar',
                                  style: semibold.copyWith(
                                      fontSize: 14, color: Colors.black),
                                )),
                            const Icon(
                              Icons.notification_add_rounded,
                              size: 36,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 200,
            width: width,
            child: Image.asset("assets/icons/image.png"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 29),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            width: width,
            child: Text(
              'Menu',
              style: bold.copyWith(fontSize: 22, color: Colors.amber),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: hijau,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Warna bayangan
                            offset:
                                const Offset(0, 3), // Posisi bayangan (x, y)
                            blurRadius: 6, // Jarak sebaran bayangan
                            spreadRadius: 0, // Meratakan bayangan (optional)
                          ),
                        ],
                      ),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.calendar_month,
                            size: 28,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Agenda',
                            style: semibold.copyWith(
                                fontSize: 12, color: Colors.white),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: hijau,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Warna bayangan
                            offset:
                                const Offset(0, 3), // Posisi bayangan (x, y)
                            blurRadius: 6, // Jarak sebaran bayangan
                            spreadRadius: 0, // Meratakan bayangan (optional)
                          ),
                        ],
                      ),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.book_sharp,
                            size: 28,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Absen',
                            style: semibold.copyWith(
                                fontSize: 12, color: Colors.white),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: hijau,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Warna bayangan
                            offset:
                                const Offset(0, 3), // Posisi bayangan (x, y)
                            blurRadius: 6, // Jarak sebaran bayangan
                            spreadRadius: 0, // Meratakan bayangan (optional)
                          ),
                        ],
                      ),
                      child: TextButton.icon(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const DetailAnggota();
                            }));
                          },
                          icon: const Icon(
                            Icons.people,
                            size: 28,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Data Anggota',
                            style: semibold.copyWith(
                                fontSize: 12, color: Colors.white),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: hijau,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Warna bayangan
                            offset:
                                const Offset(0, 3), // Posisi bayangan (x, y)
                            blurRadius: 6, // Jarak sebaran bayangan
                            spreadRadius: 0, // Meratakan bayangan (optional)
                          ),
                        ],
                      ),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.attach_money_outlined,
                            size: 28,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Pembayaran',
                            style: semibold.copyWith(
                                fontSize: 12, color: Colors.white),
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
