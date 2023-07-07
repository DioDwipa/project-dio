import 'package:flutter/material.dart';
import 'package:stt_mobile/api/Posting.dart';
import 'package:stt_mobile/theme.dart';

class DetailKonten extends StatefulWidget {
  final int idPosting;
  const DetailKonten({super.key, required this.idPosting});

  @override
  State<DetailKonten> createState() => _DetailKontenState();
}



class _DetailKontenState extends State<DetailKonten> {
  String judul = '';
  String desc = '';
  String image =  '';
  int pid=0;

  final PostingController  _postingController  = PostingController();

  Future getPosting(id)async  {
    try {
      Map<String, dynamic> posting = await _postingController.getDetail(id);
      print(posting);
      if (posting != null) {
        setState(() {
          judul = posting["title"];
          desc = posting["description"];
          image = posting["image"];
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
         iconTheme: IconThemeData(
          color: Colors.black, // Ubah warna menjadi putih
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/icons/image.png"),
            ),
            const SizedBox(
              width: 12,
            ),
            Text("nama",style: semibold.copyWith(fontSize: 12,color: Colors.black),)
          ],
        ),  
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("https://apimdl.000webhostapp.com/api/postings/image/$pid",fit: BoxFit.cover,height: 400,width: width,),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage("assets/icons/image.png"),radius: 20,),
                  const SizedBox(width: 12,),
                  Text("admin",style: semibold.copyWith(fontSize: 12),),
                  const SizedBox(width: 230,),
                  Icon(Icons.favorite_border,size: 20,),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('12',style: regular.copyWith(fontSize: 12),)
                ],
              ),
              const SizedBox(height: 6,),
              Text(judul,style: bold.copyWith(fontSize: 23),),
              const SizedBox(
                height: 10,
              ),
              Text(desc,style: regular.copyWith(fontSize: 12),)
            ],
          ),
        ),
      ),
    );
  }
}