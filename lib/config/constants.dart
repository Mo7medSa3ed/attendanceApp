import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

const BASEURL = 'https://attendance-appasjid.herokuapp.com';

const kdefultpadding = 16.0;
const kdefultradius = 25.0;

const kwhite = Colors.white;
const kblack = Color(0xff2D2D2D);
const kgrey = Color(0xff5A5A5A);
const kbold = Color(0xff383E56);
const kprimary = Color(0xff5AE4A7);

const headerFontSize = 18.0;
const fontSize = 18.0;

setHeaders() {
  return {'x-auth-token': GetStorage().read('token') ?? ''};
}
