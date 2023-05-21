import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_github/data/shared_pref.dart';

import 'login_page.dart';

class KesanPesanPage extends StatefulWidget {
  const KesanPesanPage({Key? key}) : super(key: key);

  @override
  _KesanPesanPageState createState() => _KesanPesanPageState();
}

class _KesanPesanPageState extends State<KesanPesanPage> {
  TextEditingController senderNameController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    senderNameController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kesan Pesan'),
        actions: [
          IconButton(
            onPressed: () {
              SharedPref().setLogout();
              final snackbar = SnackBar(
                content: Text('Berhasil Logout'),
                backgroundColor: Colors.redAccent,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: senderNameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Pengirim',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    labelText: 'Pesan',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    String senderName = senderNameController.text;
                    String message = messageController.text;
                    setState(() {
                      kesanPesanList.add(
                        KesanPesan(senderName: senderName, message: message),
                      );
                    });
                    senderNameController.clear();
                    messageController.clear();
                  },
                  child: Text('Tambah Kesan Pesan'),
                ),
              ],
            ),
          ),
        ],
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
        'Saya sangat senang mendapatkan pembelajaran Teknologi Pemrograman Mobile dari Pak Bagus, Karena dengan tugas-tugas yang diberikan dapat mengasah kemampuan saya untuk berkreatifitas termasuk dalam mempelajari bahasa Dart.',
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
