import 'package:flutter/material.dart';
import 'package:http_class/screen/page_three.dart';
import 'package:http_class/screen/page_two.dart';
import 'view_model/view_model.dart';
import 'model/model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetch Data Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// [late]は変数の初期を遅らせる。nullでない変数を宣言する。
  late Future<Album> futureAlbum;

  /// Widgetの初期化時に一度だけ呼ばれるメソッド
  @override
  void initState() {
    super.initState();
    // 画面にHTTPでGETしたデータを表示するクラスをインスタンス化する。
    futureAlbum = new UrlOne().fetchAlbum();
    // futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('HTTP GET1'),
      ),
      // 他のページに移動するDrawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('他のページへ移動'),
            ),
            ListTile(
              title: const Text('HomePageTwoへ移動'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageTwo()));
              },
            ),
            ListTile(
              title: const Text('HomePageThreeへ移動'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageThree()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        // FutureBuilderを使って画面にListのデータを描画する
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
