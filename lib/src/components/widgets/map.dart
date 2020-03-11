import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:shelters/shelf.dart';

class MapScreen extends StatelessWidget {
  MapScreen({
    this.state
  });

  final AnimalsNotifier state;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': MAP_TOKEN,
            'id': 'mapbox.streets',
          },
          // For example purposes. It is recommended to use
          // TileProvider with a caching and retry strategy, like
          // NetworkTileProvider or CachedNetworkTileProvider
          tileProvider: NonCachingNetworkTileProvider(),
        ),
      ],
    );
  }
}