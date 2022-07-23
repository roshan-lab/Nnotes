import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_notes/screens/note_reader.dart';
import 'package:n_notes/style/app_style.dart';
import 'package:n_notes/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      backgroundColor: AppStyle.maincolor,
      appBar: AppBar(
        backgroundColor: AppStyle.maincolor,
        //elevation: 0,
        centerTitle: true,
        title: Text("N notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Recent Notes",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context,AsyncSnapshot <QuerySnapshot> snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator(),);
                  if(snapshot.hasData){
                    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    children: snapshot.data!.docs
                        .map((note) => noteCard(() {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteReader(note)));

                    }, note))
                        .toList(),
                    );
                  }
                  return Text("No data Present ",
                  style: GoogleFonts.nunito(color: Colors.white),
                  );
                },

              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){

        },
        label: Text("Add Notes",),
        icon: Icon(Icons.add),
      ),
    );
  }
}
