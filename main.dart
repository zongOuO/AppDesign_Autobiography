import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: currentIndex==0? Image.asset('images/user.png',width:35,height:35): Image.asset('images/user.png',width:30,height:30), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='　　從小，父母就沒有給我太多的限制，我做的每個決定，他們都不會反'
                  '對，反而非常支持我，因為他們認為不應該限制我太多，我的人生必須由'
                  '自己決定。雖然我擁有自由，但我不是一個會亂下決定的人，我再決定之'
                  '前，會蒐集很多資料，從資料中去選擇是否要這樣做，因此這也讓我愈來'
                  '愈成熟，不會隨意就做選擇。';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('關於我', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.blueAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child:Image.asset('images/img39.jpg'),
            height: 175,
            width: 246,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 170,
                height:210,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.indigo, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/img24.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 170,
                height:210,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/img9.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('　　證照'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height:150,
                width: 200,
                child: ListView(
                  children: [
                    Text('MTA Networking Fundamentals'),
                    Text('丙級電腦軟體應用技術士'),
                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('　　競賽獲獎'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height:270,
                width: 200,
                child: ListView(
                  children: [
                    Text('全國高級中等學校小論文'),
                    Text('寫作比賽　甲等\n'),
                    Text('全國高級中等學校閱讀心得'),
                    Text('寫作比賽　優等\n'),
                    Text('eClass英文線上閱讀競賽'),
                    Text('校內賽　成績優異\n'),
                    Text('品德教育『負責』　優良'),
                    Text('品德教育『整潔』　優良'),
                    Text('國際運算思維挑戰賽　PR 92'),
                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('　　校外活動及研習'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height:150,
                width: 200,
                child: ListView(
                  children: [
                    Text('2020高雄教育節我的簡報力'),
                    Text('跨校小論文營'),
                    Text('建構工業4.0科普學習平台'),
                    Text('2019飆機器人全國智能創新運用大賽'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 170,
                height:210,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.indigo, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/MTA.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 170,
                height:210,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/img14.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
          ],
        ),
      );
  }
}
class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('　　大一時期'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好大一英文'),
                  Text('2. 學習程式語言'),
                  Text('3. 了解計算機概論'),
                  Text('4. 必修課程All Pass'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('　　大二時期'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好大二英文'),
                  Text('2. 學習JAVA程式語言'),
                  Text('3. 了解網路結構'),
                  Text('4. 必修課程All Pass'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('　　大三時期'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 考完多益'),
                  Text('2. 學習資料庫的應用'),
                  Text('3. 了解app程式設計'),
                  Text('4. 必修課程All Pass'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('　　大四時期'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:200,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 練習國考題目'),
                  Text('2. 完成畢業門檻'),
                  Text('3. 必修課程All Pass'),
                ],
              ),
            ),
          ],
        ),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 300,),
          Text('程式設計：Java',style: TextStyle(fontSize: 30),),
          Text('                    Python',style: TextStyle(fontSize: 30),),
        ],
      )
    );
  }
}