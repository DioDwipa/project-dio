import 'package:flutter/material.dart';
import 'package:stt_mobile/api/Posting.dart';
import 'package:stt_mobile/pages/EditPage.dart';
import 'package:stt_mobile/pages/TambahData.dart';
import 'package:stt_mobile/theme.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final PostingController _postingController = PostingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
       appBar: AppBar(
        backgroundColor: biru.withOpacity(0.5),
        title: Text('Kelola konten',style: bold.copyWith(fontSize: 20,color: Colors.black),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: height - 150,
          width: width,
          child: FutureBuilder(
            future: _postingController.getPostings(),
            builder: (BuildContext context,snapshot) {
               if(snapshot.data == null) {
                  return Center(
                  child: CircularProgressIndicator(color: hijau,),
                );
              }else {
                var postings = snapshot.data!;
                return ListView.builder(
                      itemCount: postings.length, 
                      itemBuilder: (BuildContext contex,index){
                        var posting = postings[index];
                        return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.network("https://apimdl.000webhostapp.com/api/postings/image/${posting["id"]}",  width: 60,height: 60,fit: BoxFit.cover,),
                                  const SizedBox(width: 12,),
                                  Text(posting["title"],style: semibold.copyWith(fontSize: 14,color: Colors.black),),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        IconButton(onPressed: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                            return UpdateData(idPosting: posting["id"],);
                                          }));
                                        }, icon: Icon(Icons.edit,color: Colors.amber,)),
                                        IconButton(onPressed: (){
                                          _postingController.deletePosting(posting["id"]).then((value){
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text('Data berhasil dihapus'),
                                                ),
                                              );
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)  {
                                                return InfoPage();
                                              }));
                                          });
                                        }, icon: Icon(Icons.delete,color: Colors.red,))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                      }
                    );
              }
            }
          )
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor:biru,
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return TambahData();
          }));
        },
        child: Icon(Icons.add,color:Colors.white,)),
    );
  }
}


