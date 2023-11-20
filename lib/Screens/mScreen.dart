import 'package:flutter/material.dart';
import 'package:kick/Controller/fetchMeme.dart';
import 'package:kick/Controller/saveMyData.dart';

class mScreen extends StatefulWidget {
  const mScreen({super.key});

  @override
  State<mScreen> createState() => _mScreenState();
}

class _mScreenState extends State<mScreen> {
  String ImgUrl = " ";
  int? memeNo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetInitMemeNo();
    UpdateImg();
  }

  void UpdateImg() async {
    String getImg = await FetchMeme.fetchNewMeme();
    setState(() {
      ImgUrl = getImg;
    });
  }

  GetInitMemeNo() async {
    memeNo = await SaveMyData.fetchData() ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Meme # ${memeNo}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Target Memes 140!",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 70,
            ),
            Image.network(ImgUrl),
            SizedBox(
              height: 150,
            ),
            Container(
                height: 50,
                width: 150,
                child: ElevatedButton(
                    onPressed: () async {
                      await SaveMyData.saveData(memeNo! + 1);
                      GetInitMemeNo();
                      UpdateImg();
                    },
                    child: Text(
                      "More Fun-->",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ))),
            Spacer(),
            Text(
              "App Created By",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "MOHD KASHIF",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
