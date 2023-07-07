import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stt_mobile/api/Posting.dart';
import 'package:stt_mobile/pages/InfoPage.dart';
import 'package:stt_mobile/theme.dart';
import 'package:image_picker/image_picker.dart';

class TambahData extends StatefulWidget {
  const TambahData({Key? key});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PostingController _postingController = PostingController();

  File? _selectedImage;
  TextEditingController _judulController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  Future<void> _pickImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path);
        });
      }
    } on PlatformException catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Tambah Postingan',
          style: bold.copyWith(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 222,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: biru, width: 2),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          const SizedBox(height: 8),
                          Text(
                            "Tambah Gambar",
                            style: semibold.copyWith(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _judulController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Data tidak boleh kosong';
                  }
                  return null; // Return null jika valid
                },
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  hintText: 'Buatlah judul yang mudah dipahami',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: biru),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: _descController,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Data tidak boleh kosong';
                  }
                  return null; // Return null jika valid
                },
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  hintText: 'Ketuk untuk menambahkan teks keterangan',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: biru
                    )
                ),
              ),),
              const SizedBox(
                height: 25,
              ),
              FilledButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    String title = _judulController.text;
                    String desc = _descController.text;
                    File? image = _selectedImage;

                     String imagePath = image?.path ?? '';

                     _postingController.createPosting(title, desc, imagePath).then((value) {
                       ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Data berhasil ditambah'),
                          ),
                        );
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)  {
                          return InfoPage();
                        }));
                     });
                  }
                },
                child: Text('Submit'),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(biru),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
