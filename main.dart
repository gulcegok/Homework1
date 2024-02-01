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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int aktifButon = 0;
  String istenmeyenYazi = '';

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool checkliMi = false;
  String text = '';
  var sinif = 5;
  var baslik = 'Öğrenciler';
  var ogrenciler = {'Ege', 'Efe', 'Berk'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            YaziYazmaYeri(istenenYazi: istenenYazi),
            Text(text),
            Checkbox(
                value: checkliMi,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    if (value != null) {
                      checkliMi = value;
                    }
                  });
                }),
            ElevatedButton(
              onPressed: aktifButon == 0
                  ? () {
                      print('0');
                      setState(() {
                        aktifButon = (aktifButon + 1) % 4;
                        istenmeyenYazi = 'SIFIR';
                      });
                    }
                  : null,
              child: Text('0'),
            ),
            ElevatedButton(
              onPressed: aktifButon == 1
                  ? () {
                      print('1');
                      setState(() {
                        aktifButon = (aktifButon + 1) % 4;
                        istenmeyenYazi = 'BİR';
                      });
                    }
                  : null,
              child: Text('1'),
            ),
            ElevatedButton(
              onPressed: aktifButon == 2
                  ? () {
                      print('2');
                      setState(() {
                        aktifButon = (aktifButon + 1) % 4;
                        istenmeyenYazi = 'İKİ';
                      });
                    }
                  : null,
              child: Text('2'),
            ),
            ElevatedButton(
              onPressed: aktifButon == 3
                  ? () {
                      print('3');
                      setState(() {
                        aktifButon = (aktifButon + 1) % 4;
                        istenmeyenYazi = 'ÜÇ';
                      });
                    }
                  : null,
              child: Text('3'),
            ),
            Text(
              '$sinif . Sınıf',
              textScaleFactor: 2,
            ),
            Text(
              baslik,
              textScaleFactor: 1.5,
            ),
            for (final o in ogrenciler) Text(o),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ogrenciler.add('yeni');
                });
              },
              child: Text('Ekle'),
            ),
            Yazi('Şu anki değer: $_counter'),
            Sayac(
              'Dışarıdaki değer: $_counter',
              ilkDeger: 3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class YaziYazmaYeri extends StatefulWidget {
  final String istenenYazi;
  const YaziYazmaYeri({
    super.key,
    required this.istenenYazi,
  });

  @override
  State<YaziYazmaYeri> createState() => _YaziYazmaYeriState();
}

class _YaziYazmaYeriState extends State<YaziYazmaYeri> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      print('Yeni Değer: ${controller.text}');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YaziYazmaYeri oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.istenenYazi != widget.istenenYazi) {
      controller.text = widget.istenenYazi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
          suffixIcon: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          controller.text = '';
        },
      )),
    );
  }
}

class Yazi extends StatelessWidget {
  final String icerik;
  const Yazi(this.icerik, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(icerik);
  }
}

class Sayac extends StatefulWidget {
  final String baslik;
  final int ilkDeger;
  const Sayac(this.baslik, {super.key, required this.ilkDeger});

  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int sayi = 0;
  @override
  void initState() {
    super.initState();
    sayi = widget.ilkDeger;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          sayi++;
        });
      },
      child: Text('${widget.baslik}, İçerideki değer: $sayi'),
    );
  }
}
