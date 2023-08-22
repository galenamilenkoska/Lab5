import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListItem {
  final String id;
  final String naslov;
  final String opis;
  final DateTime datum;
  final TimeOfDay vreme;

  ListItem({
    @required this.id,
    @required this.naslov,
    this.opis = "Ova e default opis",
    this.datum,
    this.vreme,
  });
}
