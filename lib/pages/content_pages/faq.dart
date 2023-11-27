import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text('Oryantiring nedir?'),
            children: <Widget>[
              ListTile(
                  title: Text(
                      'Oryantiring, harita ve pusula kullanarak belirlenmiş kontrol noktalarını en kısa sürede bulmayı hedefleyen bir doğa sporudur. Hem fiziksel hem de zihinsel becerileri geliştirir.')),
            ],
          ),
          ExpansionTile(
            title: Text('Oryantiring için ne tür ekipmanlara ihtiyaç vardır?'),
            children: <Widget>[
              ListTile(
                  title: Text(
                      'Oryantiring için temel ekipmanlar arasında özel olarak hazırlanmış oryantiring haritası, pusula, uygun spor kıyafetleri ve ayakkabılar yer alır. Ayrıca, yarışmaya bağlı olarak zaman ölçüm cihazı (SI kartı) gerekebilir.')),
            ],
          ),
          ExpansionTile(
            title: Text('Oryantiringe nasıl başlayabilirim?'),
            children: <Widget>[
              ListTile(
                  title: Text(
                      'Oryantiringe başlamak için, yerel oryantiring kulüplerine katılabilir veya oryantiring etkinliklerine katılarak başlayabilirsiniz. İlk adım olarak, basit parkurlarla ve eğitim etkinlikleriyle deneyim kazanmak yararlı olacaktır.')),
            ],
          ),
          ExpansionTile(
            title: Text('Oryantiring hangi yaş grupları için uygundur?'),
            children: <Widget>[
              ListTile(
                  title: Text(
                      'Oryantiring, tüm yaş grupları için uygundur. Çocuklar için eğitici parkurlar, yetişkinler için rekabetçi yarışlar ve yaşlılar için daha az zorlayıcı rotalar bulunmaktadır')),
            ],
          ),
          ExpansionTile(
            title: Text('Oryantiring yarışmaları ne kadar sürer?'),
            children: <Widget>[
              ListTile(
                  title: Text(
                      'Oryantiring yarışmalarının süresi düzenlenen parkurun uzunluğuna ve zorluk derecesine bağlı olarak değişir. Kısa parkurlar 20-30 dakika sürebilirken, uzun mesafe yarışmaları 1 saatten fazla sürebilir.')),
            ],
          ),
          ExpansionTile(
            title: Text('Oryantiring sadece ormanda mı yapılır?'),
            children: <Widget>[
              ListTile(
                  title: Text(
                      'Hayır, oryantiring ormanlık alanların yanı sıra parklar, kentsel alanlar ve dağlık bölgeler gibi farklı ortamlarda da yapılabilir. Harita ve parkur düzenlemesi yapılan alana göre farklılık gösterir.')),
            ],
          ),
        ],
      ),
    );
  }
}
