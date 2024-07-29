import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../theme/colors.dart';

class MyArts extends StatefulWidget {
  const MyArts({super.key});

  @override
  State<MyArts> createState() => _MyArtsState();
}

class _MyArtsState extends State<MyArts> {
  List imgList = [];
  getImages() async {
    final directory = await getExternalStorageDirectory();
    final path = directory!.path;
    setState(() {
      imgList = directory.listSync();
      print(imgList);
    });
  }
  popimg(int index) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: whiteclr,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.file(
            imgList[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  SafeArea(child: Scaffold(
      appBar: AppBar(
  iconTheme: IconThemeData(color: whiteclr),
        centerTitle: true,
        title: Text(
          'My Arts',
          style: TextStyle(
            fontSize: width * 0.04,
            fontWeight: FontWeight.bold,
            color: whiteclr,
          ),
        ),
      ),
      body:   Padding(

        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount ( crossAxisCount: 2, ),
        itemCount: imgList.length,
        itemBuilder: (BuildContext context, int index) { return GestureDetector(
          onTap: (){
            popimg(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container (
              clipBehavior: Clip.antiAlias, decoration: BoxDecoration( borderRadius: BorderRadius.circular (12), ),
              child: Image.file(imgList[index],fit: BoxFit.cover,), ),
          ),
        ); }, ),
      ), ),
       );


  }
}
