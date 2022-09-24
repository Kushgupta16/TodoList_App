import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/Screen/note_editor.dart';
import 'package:todoapp/Screen/note_reader.dart';
import 'package:todoapp/Widget/note_card.dart';
import '../Style/appstyle.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("Notes",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 27
        ),),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your recent notes",
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData){
                    return GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                    children: snapshot.data!.docs
                        .map((note) => noteCard(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                            builder: (context) =>
                                NoteReaderScreen(note),
                              ));
                    }, note))
                        .toList(),
                    );
                  }
                  return Text("No Notes",
                  style: GoogleFonts.nunito(
                      color:Colors.black ),
                  );
                },
              ),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteEditorScreen()));
        },
        label:Text("Add Note"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.black,),

    );
  }
}
