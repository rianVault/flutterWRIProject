import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Tugas"),
        centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Judul Tugas",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
              ),

              SizedBox(height: 20.0,),

              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Deskripsi Tugas",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
              ),

              SizedBox(height: 20.0,),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 124, 225),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                ),
                child: Text("Save"),
                ),
                
              )
            ],
          ),
          ),
    );
  }
}