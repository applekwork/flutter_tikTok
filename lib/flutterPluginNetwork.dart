import 'package:flutter/services.dart';

const _channal = MethodChannel('samples.guo/navigation');

class FlutterPluginNetwork {
  static Future<String> doRequest(url, params) async {
    final String result =
        await _channal.invokeMethod('doRequest', {"url": url, "param": params});
    return result;
  }
}
