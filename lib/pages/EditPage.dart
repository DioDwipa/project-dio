import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stt_mobile/api/Posting.dart';
import 'package:stt_mobile/pages/InfoPage.dart';
import 'package:stt_mobile/theme.dart';
import 'package:image_picker/image_picker.dart';

class UpdateData extends StatefulWidget {
  final int idPosting;
  const UpdateData({Key? key, required this.idPosting});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _selectedImage;
  TextEditingController _judulController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  PostingController _postingController= PostingController();

  int pid=0;

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

   Future getPosting(id)async  {
    try {
      Map<String, dynamic> posting = await _postingController.getDetail(id);
      print(posting);
      if (posting != null) {
        setState(() {
          _judulController.text = posting["title"];
          _descController.text = posting["description"];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getPosting(widget.idPosting);
    pid = widget.idPosting;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Update Postingan',
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
                onPressed: () {
                   String title = _judulController.text;
                   String desc = _descController.text;
                   File? image = _selectedImage;

                   String imagePath = image?.path ?? '';
                  _postingController.updatePosting(pid, title, desc, imagePath).then((value) {
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Data berhasil diupdate'),
                      ),
                    );
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)  {
                      return InfoPage();
                    }));
                  });
                 
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
