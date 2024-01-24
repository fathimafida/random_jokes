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

  void getJokes() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final resp =
          await Dio().get("https://official-joke-api.appspot.com/random_joke");

      setState(() {
        jokes = resp.data["setup"] + "\n" + resp.data["punchline"];
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      _isLoading = false;
    }
  }

  @override
  void initState() {
    getJokes();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random jokes"),
        backgroundColor: Color.fromARGB(255, 189, 232, 134),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Want Some Jokes ?",
                style: GoogleFonts.nunito(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Center(
                      child: Card(
                        color: Color.fromARGB(255, 111, 207, 114),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            jokes,
                            style: GoogleFonts.nunito(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                onPressed: getJokes,
                child: Text(
                  'Get Jokes',
                  style: GoogleFonts.nunito(fontSize: 20, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 111, 207, 114)),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
