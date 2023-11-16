import 'package:flutter/material.dart';

class CompassUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Pusula İle Yön Bulmak',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Divider(height: 20, thickness: 2),
            Text(
              'Pusulada Açı Ayarlamak: Bu işlem, pusulanın hedefe doğru yönlendirilmesini sağlayarak, kullanıcının belirli bir yönü takip etmesine olanak tanır. Pusuladaki döner halka, belirlenen açıya ayarlanır.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Harita Üzerinde Pusula Açısı Ayarlamak: Harita üzerindeki yönlerin pusuladaki açılarla eşleştirilmesi işlemidir. Haritanın manyetik kuzeyi pusulanın kuzeyi ile hizalanacak şekilde yerleştirilir ve ardından rotanız üzerindeki açı, pusula üzerinde ayarlanır.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Kerteriz Almak – Arazide Açı Ölçmek: Kerteriz almak, pusulanın görüş hattını kullanarak, belirli bir nesne veya noktaya doğru yönlendirilmesi işlemidir. Arazide bir nesneye doğru olan açıyı ölçmek için kullanılır.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Kerteriz Takip Etmek: Bir kerteriz hattı belirledikten sonra, bu hatta sadık kalarak hedefe doğru ilerlemeyi ifade eder. Pusulayı sabit tutarak ve hedef alınan nesneyi sürekli göz önünde bulundurarak doğru yolda kalınır.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
