import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/widgets/circlevatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class add_cart extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;

  void deleteDocument(String name) {
    FirebaseFirestore.instance.collection("Data of User "+user!.email.toString()).doc(name).delete();
    Get.snackbar('sucess',"data deleted sucessfully",colorText: Colors.white,backgroundColor: Colors.green.shade600);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("Data of User "+user!.email.toString()).where('email',isEqualTo: user!.email).snapshots(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                        return Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                          ),
                          child:ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount:snapshot.data!.docs.length,
                              itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        circleavatar(snapshot.data!.docs[index]['image'], 70, snapshot.data!.docs[index]['name'], Colors.black87),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 4.0, top: 24, bottom: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data!.docs[index]['name'],
                                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                snapshot.data!.docs[index]['price'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                    color: Colors.green
                                                ),
                                              ),
                                              Text( snapshot.data!.docs[index]['email'] ,
                                                  style: TextStyle(fontSize: 14, color: Colors.blueAccent)),
                                              SizedBox(
                                                height: 18,
                                              ),
                                              Text("No of Products: "+snapshot.data!.docs[index]['no of product'],
                                                  style: TextStyle(fontSize: 17, color: Colors.blueAccent)),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                    },
                                                    child: Text("Buy Now"),
                                                  ),
                                                  SizedBox(
                                                    width: 9,
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: ()
                                                    {
                                                     deleteDocument(snapshot.data!.docs[index]['name']);
                                                    },
                                                    child: Text("Remove",style: TextStyle(color: Colors.white),),
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all(Colors.red.shade800),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                        );
              }
              else
                {
                  return Container(
                    child: Center(
                      child: Text("NO DATA FOUND",style: TextStyle(fontSize: 20,color: Colors.white),),
                    ),
                  );
                }
            },
        ),
    );
  }
}
