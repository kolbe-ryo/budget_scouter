// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Admob {
  static String _getBannerAdUnitId() {
    String? bannerUnitId;
    if (Platform.isAndroid) {
      // Android のとき（テスト用広告）
      bannerUnitId = "ca-app-pub-3940256099942544/6300978111";
    } else if (Platform.isIOS) {
      // iOSのとき
      bannerUnitId = "ca-app-pub-4793779857582845/6824830701";
      // iOSのとき（テスト用広告）
      // bannerUnitId = "ca-app-pub-3940256099942544/2934735716";
    }
    return bannerUnitId ?? '';
  }

  static Future<void> _updateRequestConfig(bool isSimulator) async {
    await MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(
        testDeviceIds: [isSimulator ? '6C7C4087-223C-44A3-B167-EFF0E69CD532' : '00008030-000125641491802E'],
      ),
    );
  }

  static Future<Widget> getBannerWidget({
    required BuildContext context,
  }) async {
    BannerAd bannerAd = BannerAd(
      adUnitId: _getBannerAdUnitId(),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );

    await _updateRequestConfig(false);

    await bannerAd.load();

    return Container(
      // height: 50,
      child: AdWidget(ad: bannerAd),
      constraints: BoxConstraints(
        maxHeight: AdSize.banner.height.toDouble(),
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: MediaQuery.of(context).size.width,
      ),
    );
  }
}
