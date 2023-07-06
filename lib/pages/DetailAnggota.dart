import 'package:flutter/material.dart';
import 'package:stt_mobile/theme.dart';

class DetailAnggota extends StatefulWidget {
  const DetailAnggota({super.key});

  @override
  State<DetailAnggota> createState() => _DetailAnggotaState();
}

class _DetailAnggotaState extends State<DetailAnggota> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: hijau, actions: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 12),
          child: Text(
            'Data Anggota',
            style: bold.copyWith(fontSize: 16, color: Colors.white),
          ),
        ),
      ]),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    fillColor: Colors.grey,
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    hintText: "password"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(child: Image.asset("assets/icons/tambah.png")),
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                  color: hijau,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Warna bayangan
                      offset: const Offset(0, 3), // Posisi bayangan (x, y)
                      blurRadius: 6, // Jarak sebaran bayangan
                      spreadRadius: 0, // Meratakan bayangan (optional)
                    ),
                  ]),
              child: ListTile(
                leading: Icon(
                  Icons.person_pin,
                  size: 50,
                  color: Colors.black,
                ),
                title: Text(
                  "Nama made",
                  style: semibold.copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  "status",
                  style: regular.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
