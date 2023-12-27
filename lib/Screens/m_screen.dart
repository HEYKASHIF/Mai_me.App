import 'package:flutter/material.dart';
import 'package:kick/Controller/fetch_meme.dart';
import 'package:kick/Controller/save_mydata.dart';

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
            const SizedBox(
              height: 100,
            ),
            Text(
              "Meme # $memeNo",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Target Memes $targetMeme",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 70,
            ),
            isLoading
                ? SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
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
            const SizedBox(
              height: 150,
            ),
            SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                    onPressed: () async {
                      await SaveMyData.saveData(memeNo! + 1);
                      GetInitMemeNo();
                      UpdateImg();
                    },
                    child: const Text(
                      "More Fun-->",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ))),
            const Spacer(),
            const Text(
              "App Created By",
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              "🤩MKS🤩",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
