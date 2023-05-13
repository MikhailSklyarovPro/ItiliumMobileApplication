import 'dart:convert';
import 'package:http/http.dart' as http;

class ItiliumApi {
  static const _host = 'http://192.168.139.224/'; //Свой апи посмотреть
  static const _namespace = 'http://localhost/request';

  static final _url = Uri.parse('$_host/itilium/ws/mobile.1cws');

  static Map<String, String> _getHeaders(String methodName) {
    var headers = {
      'Access-Control_Allow_Origin': '',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': '',
      'Access-Control-Allow-Methods': '*',
      'Access-Control-Expose-Headers': 'Authorization, authenticated',
      'Access-Control-Max-Age': '1000',
      'SOAPAction': '$_namespace#mobile:$methodName',
      'Content-Type': 'text/xml; charset=utf-8',
    };

    return headers;
  }

  static String _getEnvelope(String methodName, [String parameters = '']) {
    var envelope = """<x:Envelope
      xmlns:x="http://schemas.xmlsoap.org/soap/envelope/"
      xmlns:req="$_namespace">
      <x:Header/>
      <x:Body>
          <req:$methodName>
              $parameters
          </req:$methodName>
      </x:Body>
      </x:Envelope>""";

    return envelope;
  }

  static Future<http.Response> getOrders(String user,
      {String startDate = '',
      String endDate = '',
      String states = '',
      String divisions = '',
      bool isMyOrders = false}) {
    var methodName = "GetOrders";

    var pars = """<req:User>$user</req:User>
    <req:StartDate>$startDate</req:StartDate>
    <req:EndDate>$endDate</req:EndDate>
    <req:States>$states</req:States>
    <req:Divisions>$divisions</req:Divisions>
    <req:IsMyOrders>$isMyOrders</req:IsMyOrders>""";

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getEnvelope(methodName, pars));

    return http.post(_url, headers: headers, body: body);
  }
}
