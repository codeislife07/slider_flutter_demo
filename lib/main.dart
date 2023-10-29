import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaler Slider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>HomePageSTate();

}

class HomePageSTate extends State<HomePage> {
  List<String> images = [
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.bircyBDvJOcKd3mkR6ramwHaEK%26pid%3DApi&f=1&ipt=5909f3cdfdc42fb7effd2baabc4312074c2866f899860a96cf501dc9d1f51cf4&ipo=images"',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OjNHJL6A-Lzw_jLJfFgtMwHaEK%26pid%3DApi&f=1&ipt=9f19fe8349e515790867030de18da3ba6f4cae0548d5195b66004453fb7916d0&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.hdwallpaper.nu%2Fwp-content%2Fuploads%2F2015%2F09%2Ftropical_beach_blue_summer_sea_emerald_sand_hd-wallpaper-1701606.jpg&f=1&nofb=1&ipt=6eb95fc58404f4ef582fa656596438a8313acf27a78c036f2657e601cba7be53&ipo=images'
        'http://allpicts.in/wp-content/uploads/2018/03/Natural-Images-HD-1080p-Download-with-Keyhole-Arch-at-Pfeiffer-Beach.jpg',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.rvSWtRd_oPRTwDoTCmkP5gAAAA%26pid%3DApi&f=1&ipt=4eff9a5d7d22249208e9472e985283aee53c7c785e9265810c51f0f39de585bc&ipo=images'
  ];
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaler Slider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: List.generate(
                images.length,
                    (index) => Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          images[index]
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                onPageChanged: (int page,_){
                    setState(() {
              currentIndex=page;
                    });
                },
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            //show indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 15,width: 15,
                  decoration: BoxDecoration(
                    color: currentIndex==index?Colors.grey:Colors.grey[300],
                    shape: BoxShape.circle
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
