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
  int targetMeme = 049;
  bool isLoading = true;
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
      isLoading = false;
    });
  }

  GetInitMemeNo() async {
    memeNo = await SaveMyData.fetchData() ?? 0;
    if (memeNo! > 049) {
      targetMeme = 0149;
    } else if (memeNo! > 0149) {
      targetMeme = 0449;
    } else if (memeNo! > 0449) {
      targetMeme = 0949;
    }
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
              "Target Memes $targetMeme",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 70,
            ),
            isLoading
                ? Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Image.network(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    // fit: BoxFit.fitHeight,
                    ImgUrl),
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
              "🤩MKS🤩",
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
