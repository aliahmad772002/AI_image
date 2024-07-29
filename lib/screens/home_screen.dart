import 'package:ai_image/class/api_class.dart';
import 'package:ai_image/theme/colors.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  String? dropvalue;
  String? image = '';
  var textcontroller = TextEditingController();
  var isloading = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(8), backgroundColor: btnclr),
                    onPressed: () {},
                    child: Text(
                      'My Arts',
                      style: TextStyle(
                          color: whiteclr,
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ],
            centerTitle: true,
            title: Text(
              'AI Image Generator',
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.bold,
                color: whiteclr,
              ),
            ),
          ),
          body: Container(
            color: bgcolor,
            child: Column(children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width * 0.8,
                        height: height * 0.055,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: whiteclr,
                        ),
                        child: TextFormField(
                          controller: textcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter text',
                            prefixIcon: Icon(
                              Icons.search,
                              size: width * 0.05,
                            ),
                            hintStyle: TextStyle(fontSize: width * 0.04),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      GestureDetector(
                        onTap: () async {
                          print('done');

                          if (textcontroller.text.isNotEmpty) {
                            setState(() {
                              isloading = false;
                            });
                            image =
                                await Api.generateImage(textcontroller.text);

                            setState(() {
                              isloading = true;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please enter text')));
                          }
                        },
                        child: Container(
                          height: height * 0.07,
                          width: width * 0.7,
                          decoration: BoxDecoration(
                              color: btnclr,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            'Generate',
                            style: TextStyle(
                                color: whiteclr, fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Expanded(
                  flex: 3,
                  child: isloading
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.network(
                                  image!,
                                )),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton.icon(
                                      icon: Icon(
                                        Icons.download_for_offline_rounded,
                                        color: whiteclr,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(8),
                                        backgroundColor: btnclr,
                                      ),
                                      onPressed: () async {
                                        if (image != null &&
                                            image!.isNotEmpty) {
                                          // Call the downloadImage method from the Api class
                                          await Api.downloadImage(image!);

                                          // Optional: Show a message or perform other actions after downloading the image
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                'Image downloaded successfully'),
                                          ));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                'Please generate an image first'),
                                          ));
                                        }
                                      },
                                      label: Text(
                                        'Download',
                                        style: TextStyle(
                                          color: whiteclr,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  ElevatedButton.icon(
                                      icon: Icon(
                                        Icons.download_for_offline_rounded,
                                        color: whiteclr,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(8),
                                          backgroundColor: btnclr),
                                      onPressed: () {
                                        if (image != null &&
                                            image!.isNotEmpty) {
                                          // Call the downloadImage method from the Api class
                                          Api.shareImage(image!);

                                          // Optional: Show a message or perform other actions after downloading the image
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('wait'),
                                          ));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('Failed to share'),
                                          ));
                                        }
                                      },
                                      label: Text(
                                        'Share',
                                        style: TextStyle(
                                            color: whiteclr,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: whiteclr,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/load.gif',
                                width: width * 0.4,
                              ),
                            ],
                          ),
                        )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Developed by Waqas Asghar",
                  style: TextStyle(
                    color: whiteclr,
                    fontSize: width * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ]),
          )),
    );
  }
}
