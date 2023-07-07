import 'package:flutter/material.dart';
import 'package:stt_mobile/api/Posting.dart';
import 'package:stt_mobile/pages/DetailAnggota.dart';
import 'package:stt_mobile/pages/DetailPostingan.dart';
import 'package:stt_mobile/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PostingController _postingController = PostingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: biru.withOpacity(0.5),
        title: Text('Untuk Anda',style: bold.copyWith(fontSize: 20,color: Colors.black),),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 9),
        width: width,
        height: height - 100,
        child: FutureBuilder(
          future: _postingController.getPostings(), 
          builder: (context,snapshot)  {
            if(snapshot.data == null) {
                return Center(
                child: CircularProgressIndicator(color: hijau,),
              );
            }else {
              var postings =  snapshot.data!;
              return GridView.builder(
                      itemCount: postings.length, 
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3/4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ), 
                      itemBuilder: ((BuildContext context, index){
                        var posting = postings[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return DetailKonten(idPosting: posting["id"],);
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network("https://apimdl.000webhostapp.com/api/postings/image/${posting["id"]}",height: 180,width: width,fit: BoxFit.cover,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  child: Text(posting["title"],style: semibold.copyWith(fontSize: 12),),
                                ),
                                const SizedBox(
                                      height: 10,
                                      ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  child: Row(
                                    children: [
                                      CircleAvatar(backgroundImage: AssetImage("assets/icons/image.png"),radius: 12,),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text('nama pengguna',style: regular.copyWith(fontSize: 8,color: Colors.black),),
                                      const  SizedBox(
                                        width: 32,
                                      ),
                                      Icon(Icons.favorite_border,size: 12,),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text('12',style: regular.copyWith(fontSize: 10),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                    );
            }
          }
        )
      )
    ));
  }
}



