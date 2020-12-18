import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/scan_list_provider.dart';
import 'package:qr_reader/src/providers/ui_provider.dart';
import 'package:qr_reader/src/widgets/custom_navigation-bar.dart';
import 'package:qr_reader/src/widgets/scan_button.dart';
import 'package:qr_reader/src/widgets/scan_tiles.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever), 
            onPressed: (){
              final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
              scanListProvider.deleteAll();
            }
          )
        ],
      ),
      body: _HomePageBody(),

      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currenteIndex = uiProvider.selectedMenuOpt;

    //Use ScanListProvider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch (currenteIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return ScanTiles(
          type: 'geo'
        );
      case 1:
        scanListProvider.loadScansByType('http');
        return ScanTiles(
          type: 'http'
        );
      default: 
        return ScanTiles(
          type: 'geo'
        );
    }
  }
}