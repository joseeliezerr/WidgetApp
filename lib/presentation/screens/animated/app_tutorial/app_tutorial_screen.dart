import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController PageviewController = PageController();
  bool endReached=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PageviewController.addListener(() {
      final page=PageviewController.page??0;

      if (!endReached&&page>=(slides.length-1.5)){
        setState(() {
          endReached=true;
        });
      }
      print('${PageviewController.page}');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: PageviewController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
           
              right: 20,
              top: 50,
              child: TextButton(
                  onPressed: () => context.pop(), child: Text('Salir'))),
          endReached?Positioned(
             bottom: 30,
             right: 30,
              child: FadeInRight(
                from:15,
                delay: Duration(seconds: 1),
                child: FilledButton(
                onPressed: () => context.pop(),
                child: Text('Comenzar')),
              )):const SizedBox(),
        ],
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
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),

            SizedBox(height: 20), // Espacio entre la imagen y el texto
            Text(title, style: titleStyle),
            SizedBox(height: 10), // Espacio entre el título y el subtítulo
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
