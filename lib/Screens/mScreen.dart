import 'package:flutter/material.dart';
import 'package:kick/Controller/fetchMeme.dart';

class mScreen extends StatefulWidget {
  const mScreen({super.key});

  @override
  State<mScreen> createState() => _mScreenState();
}

class _mScreenState extends State<mScreen> {
  String ImgUrl =
      "https://www.mohenesh.com/wp-content/uploads/2021/11/Doge-meme-2.webp";

  void UpdateImg() async {
    String getImg = await FetchMeme.fetchNewMeme();
    setState(() {
      ImgUrl = getImg;
    });
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
              "Meme #01",
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
                    onPressed: () {
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
