import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
  
}

class _BannerWidgetState extends State<BannerWidget> {

  final _firestore = FirebaseFirestore.instance;
  final List _banneList = []; 

  getBanner() {  //Coleccion en Firestore
    return _firestore.collection('Banner').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) { 
        setState(() {
          _banneList.add(doc['image']);
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.yellow.shade900,
          borderRadius: BorderRadius.circular(10), 
        ),
        child: PageView.builder(
          itemCount: _banneList.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(_banneList[index],
              fit: BoxFit.cover,
              ),
            );
          },
        ),  
      ),
    );
  }
}