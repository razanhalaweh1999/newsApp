import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/News_controller.dart';
import '../../model/nes_moel.dart';
class Sports extends GetWidget{
  @override
  Widget build(BuildContext context) {

    NewsController controller=Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(title: Text("news App"),
      backgroundColor:  Color(0xff700303)),
      body: FutureBuilder(
          future: controller.getData("sport"),
          builder: (context,AsyncSnapshot snapshot)
          {
            //Articles data=snapshot.data;
            if(snapshot.hasData)
            {
              List<Article> list = snapshot.data.articles;
              return ListView.builder(
                  itemCount: snapshot.data!.articles.length,
                  itemBuilder:(context,int index)

                  {
                    Article user = list[index];
                    return InkWell(
                      onTap:(){
                        launchURL(user.url);
                      },
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 350.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: user.urlToImage == null ? Image.asset("images/OIP.jpeg")
                                    : Image.network(
                                  user.urlToImage!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Text(
                              user.title.toString(),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              user.author.toString(),
                              style: TextStyle(
                                  fontSize: 15,color: Colors.grey),
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      ),
                    );
                  } );
            }
            else{
              return const Center(child: CircularProgressIndicator(color: Colors.red,));
            }
          })
      ,

    );

  }
  launchURL(String ss)  async {
    String url = ss;
    if (await canLaunch(url)) {
      await launch(url,
        forceSafariVC: true,
        enableJavaScript: true,);
    } else {
      throw 'Could not launch $url';
    }
  }
}