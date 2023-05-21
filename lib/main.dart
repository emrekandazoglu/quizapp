import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> cevaplarListesi = [];
  final Map<int, String> sorular = {
    1: "İletişim kurabildiğiniz biri var mı?",
    2: "Hareket edebiliyor musunuz?",
    3: "Hava alabiliyor musunuz?",
  };
  final Map<int, String> evetCevaplari = {
    1: "Kendinizi nerede oldukları hakkında en fazla bilgi vermesini ve yardım talebinde bulunmasını önerin.",
    2: "Yaralanmaları artırmamak için gerektiği kadar ve dikkatlice hareket etmelerini önerin.",
    3: "Sığınacakları alanı kaplayan toz veya dumanın solunmasını önlemek için bir bez parçası veya giysiyi kullanarak ağızlarını ve burunlarını örtmelerini tavsiye edin.",
  };
  final Map<int, String> hayirCevaplari = {
    1: "Yakınlarına ulaşmaya çalışmalarını veya yakındaki bir güvenli bölgeye hareket etmelerini tavsiye edin.",
    2: "Sakin kalmalarını ve bulundukları yerde kalıp yardım gelmesini beklemelerini önerin. Kendilerini güvende hissetmeleri önemlidir ve mümkünse enerjilerini korumaları gerekmektedir.",
    3: "Nefes almayı zorlaştıracak bir durumdaysalar, ağızlarını ve burunlarını kapatarak solunumlarını korumalarını tavsiye edin. Bunun yanı sıra, mümkünse çevrelerindeki havayı temizlemeye çalışmalarını önerin.",
  };

  int soruIndex = 0;

  void cevapEkle(String cevap) {
    setState(() {
      if (soruIndex >= 1 && soruIndex <= sorular.length) {
        int index = soruIndex;
        if (cevap == 'Evet') {
          cevaplarListesi.add(evetCevaplari[index] ?? '');
        } else if (cevap == 'Hayır') {
          cevaplarListesi.add(hayirCevaplari[index] ?? '');
        }
      }
      soruIndex++;
    });
  }

  void resetle() {
    setState(() {
      cevaplarListesi.clear();
      soruIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soru Cevap Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Soru Cevap Uygulaması'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (soruIndex == 0)
                ElevatedButton(
                  onPressed: () => cevapEkle('Başla'),
                  child: Text('Teste Başla'),
                ),
              if (soruIndex > 0 && soruIndex <= sorular.length)
                Text(
                  sorular[soruIndex] ?? '',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              if (soruIndex > 0 && soruIndex <= sorular.length)
                SizedBox(height: 20.0),
              if (soruIndex > 0 && soruIndex <= sorular.length)
                ElevatedButton(
                  onPressed: () => cevapEkle('Evet'),
                  child: Text('Evet'),
                ),
              if (soruIndex > 0 && soruIndex <= sorular.length)
                SizedBox(height: 10.0),
              if (soruIndex > 0 && soruIndex <= sorular.length)
                ElevatedButton(
                  onPressed: () => cevapEkle('Hayır'),
                  child: Text('Hayır'),
                ),
              if (soruIndex > sorular.length)
                Text(
                  cevaplarListesi.join('\n'),
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              if (soruIndex > sorular.length)
                SizedBox(height: 20.0),
              if (soruIndex > sorular.length)
                ElevatedButton(
                  onPressed: resetle,
                  child: Text('Tekrar Başlat'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
