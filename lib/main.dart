//import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScren(),
    );
  }
}

class HomeScren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          color: Colors.green,
          child: Center(
            child: Image(
              //image: NetworkImage('https://picsum.photos/200/300.jpg'),
              image: NetworkImage(
                  'https://live.staticflickr.com/65535/50461976988_58f4680bb3_o_d.jpg'),
              //image: AssetImage('assets/MBlue.jpg'),
              //image: FileImage(File(r'C:\Users\moham\Desktop\MS_Blue.jpg'),),
              repeat: ImageRepeat.noRepeat,
              frameBuilder: (
                BuildContext context,
                Widget cihld,
                int farme,
                bool wasSynchronouslyLoaded,
              ) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: cihld,
                );
              },
              loadingBuilder: (
                BuildContext context,
                Widget cihld,
                ImageChunkEvent imageChunkEvent,
              ) {
                if (imageChunkEvent == null) return cihld;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          Colors.white,
                        ),
                        value: imageChunkEvent.expectedTotalBytes != null
                            ? imageChunkEvent.cumulativeBytesLoaded /
                                imageChunkEvent.expectedTotalBytes
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      imageChunkEvent.expectedTotalBytes != null
                          ? '${(imageChunkEvent.cumulativeBytesLoaded / 1000000).floor()} / ${(imageChunkEvent.expectedTotalBytes / 100000).floor()}mb'
                          : '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    )
                  ],
                );
              },
              errorBuilder: (
                BuildContext context,
                Object exception,
                StackTrace stackTrace,
              ) {
                return Center(
                  child: Text(
                    'sorry for the inconveniece !',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
