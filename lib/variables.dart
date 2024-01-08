import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String ip = "147.102.200.253"; // "192.168.1.245";

String drive_path = 'https://drive.google.com/uc?export=view&id=';

List<String> greekGenres = [
  'Rock', 'Entechno', 'Rembetiko', 'Laiko'
];

List<String> englishGenres = [
  'Rock', 'Pop', 'Party', 'Disney'
];

List<String> greekGenreIcons = [
  'images/The Band Torso-1.png',
  'images/The Band Torso-4.png',
  'images/The Band Torso-3.png',
  'images/The Band Torso-2.png',
  'images/The Band Torso-5.png'
];

List<String> englishGenreIcons = [
  'images/The Band Torso-5.png',
  'images/The Band Torso-1.png',
  'images/The Band Torso-2.png',
  'images/The Band Torso-4.png',
  'images/The Band Torso-3.png'
];

List<String> pitchList = [
  'Default', 'C', 'D', 'E'
];

List<String> handshakePhrases = [
  "Compete with integrity, finish with a handshake.",
  "Fair play is our foundation—seal it with a handshake.",
  "Play hard, play fair, and extend a handshake in the end.",
  "In the game of life, fair play prevails. Conclude with a handshake.",
  "Compete fiercely, but remember the handshake of respect.",
  "True champions embody fair play. Seal your victories with a handshake.",
  "Every competition deserves fair play and a final handshake.",
  "Victory is sweetest when earned with fair play. End it with a handshake.",
  "Compete with honor, end with a handshake of sportsmanship.",
  "The essence of fair play—complete it with a handshake.",
];

class Song {
  final int id;
  final String title;
  final String artist;
  final String genre;
  final String lyrics;
  final String sound_path;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.genre,
    required this.lyrics,
    required this.sound_path,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] as int,
      title: json['title'] as String,
      artist: json['artist'] as String,
      genre: json['genre'] as String,
      lyrics: json['lyrics'] as String,
      sound_path: json['sound_path'] as String,
    );
  }
}

Future<List<Song>> fetchSongs({String? id, String? language, String? genre}) async {
  try {
    final response = await http.get(Uri.parse(
        'http://$ip:5000/api/getSongs?id=$id&language=$language&genre=$genre'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Song> songs = data.map((item) => Song.fromJson(item)).toList();
      return songs;
    } else {
      throw Exception('Failed to load data. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching songs: $e');
    return [];
  }
}

class AppColors {
  static const Color backgroundColor = Color(0xFFFDFBB9);
  static const Color mainColor = Color(0xFFD06ECC);
  static const Color whiteColor = Colors.white;
}

class AppStyles {
  static const TextStyle mainButtonText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle scoreText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle scorePoints = TextStyle(
    fontFamily: 'Inter',
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.mainColor,
  );

  static const TextStyle purpleBoxText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 23.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle listText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle listDesc = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  static const TextStyle backgroundText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 23.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle lyrics = TextStyle(
    fontFamily: 'Inter',
    fontStyle: FontStyle.italic,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle dailySongText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle dailySongDesc = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}