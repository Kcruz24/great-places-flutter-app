import 'dart:convert';

import 'package:http/http.dart' as http;

const STATIC_MAPS_API_KEY = 'AIzaSyA_Ifowb7FLpf4mdXaWzelc-ljtjyXj2X8';
const GEOCODING_API_KEY = 'AIzaSyCVbPTtZLjt1w6ncrs5uBH-6Rih0b99xfk';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$STATIC_MAPS_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GEOCODING_API_KEY');

    final response = await http.get(url);

    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
