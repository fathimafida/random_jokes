import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String jokes = "";
  bool _isLoading = false;
  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          jokes,
                          style: GoogleFonts.nunito(fontSize: 20),
                        ),
                      ),
                    ),
              Center(
                  child: ElevatedButton(
                      onPressed: getJokes, child: const Text('Get Jokes'))),
            ],
          ),
        ),
      ),
    );
  }
}
