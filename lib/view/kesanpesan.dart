import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_github/data/shared_pref.dart';

import 'login_page.dart';

class KesanPesanPage extends StatelessWidget {
  const KesanPesanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kesan Pesan'),
        actions: [
          IconButton(
            onPressed: () {
              SharedPref().setLogout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: kesanPesanList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  kesanPesanList[index].senderName[0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(kesanPesanList[index].senderName),
              subtitle: Text(kesanPesanList[index].message),
            ),
          );
        },
      ),
    );
  }
}

class KesanPesan {
  final String senderName;
  final String message;

  KesanPesan({required this.senderName, required this.message});
}

final List<KesanPesan> kesanPesanList = [
  KesanPesan(
    senderName: 'Kesan',
    message:
        'Saya sangat senang mendapatkan pembelajaran Teknologi Pemrograman Mobile dari Pak Bagus, Karena dengan tugas tugas yang diberikan dapat mengasah kemampuan saya untuk berkreatifitas termasuk dalam mempelajari bahasa dart',
  ),
  KesanPesan(
    senderName: 'Kesan',
    message:
        'Kesan terhadap pembelajaran yang mengajarkan disiplin mahasiswanya, saya sangat setuju. Dapat meningkatkan kedisiplinan mahasiswa yang pemalas seperti saya.',
  ),
  KesanPesan(
    senderName: 'Pesan',
    message:
        'Sedikit pesan dari saya, Terimakasih Pak Bagus telah memberikan ilmu yang semoga dapat berguna dan bermanfaat dunia akhirat. Aamiin YRA',
  ),
];
