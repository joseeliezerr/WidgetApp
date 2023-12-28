import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption:
          'eu sunt sit lorem irure labore aliquip et nisi nisi quis culpa cillum officia labore Excepteur ipsum incididunt laborum mollit occaecat ad officia irure cupidatat do reprehenderit eu consequat elit laboris amet fugiat aliqua amet aute Excepteur commodo sint eu aute pariatur mollit proident tempor sunt ad est ut esse',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega Rapida',
      caption:
          'qui mollit aute ea tempor laborum minim voluptate labore sit esse amet cupidatat tempor irure veniam aliquip labore pariatur nulla fugiat aliqua sed do proident exercitation veniam cillum sunt culpa laborum in consectetur do voluptate consequat reprehenderit dolor culpa enim quis magna nisi lorem tempor voluptate culpa commodo reprehenderit occaecat',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      caption:
          'nulla in lorem in do dolore elit dolor consequat est sint cupidatat sed sit Duis fugiat non qui consequat mollit fugiat officia ipsum aliqua amet nisi tempor aute culpa fugiat elit culpa esse qui labore incididunt ea labore nulla mollit sint est eiusmod consequat esse qui nostrud adipiscing nisi dolore',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        children: slides.map((slideData) =>
            _Slide(
              title: slideData.title, 
              caption: slideData.caption, 
              imageUrl: slideData.imageUrl
              )
              ).toList()
              ,
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image(image: AssetImage(imageUrl)),
    SizedBox(height: 20), // Espacio entre la imagen y el texto
    Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    SizedBox(height: 10), // Espacio entre el título y el subtítulo
    Text(caption),
  ],
),

      ),
      );
  }
}
