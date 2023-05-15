import 'dart:convert';

import 'package:xml_parser/xml_parser.dart';
import 'package:http/http.dart' as http;

/// API-класс, предоставляющий доступ к 1С Итилиум через web-сервис
class ItiliumAPI {
  /// Пространство имен XDTO-пакета
  String _namespace = '';

  /// URL-ссылка на web-сервис
  late Uri _url = Uri.parse('');

  /// Подключение к веб-сервису по IP-адресу
  static ItiliumAPI connect(String ip) {
    var api = ItiliumAPI();

    api._url = Uri.parse('http://$ip/itilium/ws/mobile.1cws');
    api._namespace = 'http://itilium/request';

    return api;
  }

  /// Перечень получаемых документов
  static const docName = {
    'Пользователь': 'User',
    'Обращение': 'Incident',
    'Наряд': 'Order',
    'Согласование': 'Approval',
    'Услуга': 'Service',
    'Состав услуг': 'ServiceContent',
    'Связанный документ': 'DocLink'
  };

  /// Получение заголовков
  Map<String, String> _getHeaders(String methodName) {
    return {
      'Access-Control_Allow_Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': '*',
      'Access-Control-Allow-Methods': '*',
      'Access-Control-Expose-Headers': 'Authorization, authenticated',
      'Access-Control-Max-Age': '1000',
      'SOAPAction': '$_namespace#mobile:$methodName',
      'Content-Type': 'text/xml; charset=utf-8',
    };
  }

  /// Получение параметров
  String _getParams(Map<String, dynamic> data) {
    var params = '', tab = '\t\t\t';

    data.forEach((key, value) {
      var lTab = data[key] == data[data.keys.first] ? '\n\t$tab' : '';
      var rTab = data[key] == data[data.keys.last] ? '\n$tab' : '\n\t$tab';

      params = '$params$lTab<req:$key>$value</req:$key>$rTab';
    });

    return params;
  }

  /// Получение тела запроса
  String _getSoap(String methodName, [String params = '']) {
    return """<x:Envelope
   xmlns:x="http://schemas.xmlsoap.org/soap/envelope/"
   xmlns:req="$_namespace">
   <x:Header/>
      <x:Body>
         <req:$methodName>$params</req:$methodName>
      </x:Body>
</x:Envelope>""";
  }

  /// Авторизация пользователя в системе
  Future<http.Response> authorize(String user) {
    var methodName = "GetUsers";

    var params = _getParams({'User': user});
    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Получение списка обращений
  Future<http.Response> getIncidents(String user,
      {String startDate = '',
      String endDate = '',
      List? states,
      List? divisions}) {
    var methodName = "GetIncidents";

    var params = _getParams({
      'User': user,
      'StartDate': startDate,
      'EndDate': endDate,
      'States': (states ?? []).join(','),
      'Divisions': (divisions ?? []).join(',')
    });

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Получение списка нарядов
  Future<http.Response> getOrders(String user,
      {String startDate = '',
      String endDate = '',
      List? states,
      List? divisions,
      bool isMyOrders = false}) {
    var methodName = "GetOrders";

    var params = _getParams({
      'User': user,
      'StartDate': startDate,
      'EndDate': endDate,
      'States': (states ?? []).join(','),
      'Divisions': (divisions ?? []).join(','),
      'IsMyOrders': isMyOrders
    });

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Получение списка согласований
  Future<http.Response> getApprovals(String user,
      {String startDate = '', String endDate = '', isGetApproved = false}) {
    var methodName = "GetApprovals";

    var params = _getParams({
      'User': user,
      'StartDate': startDate,
      'EndDate': endDate,
      'IsGetApproved': isGetApproved
    });

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Получение документов
  Future<http.Response> getDocuments(String user) {
    var methodName = "GetDocuments";

    var params = _getParams({'User': user});
    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Получение документов по номеру
  Future<http.Response> getDocsByNumber(
      {List? incidents, List? orders, List? approvals}) {
    var methodName = "GetDocsByNum";

    var params = _getParams({
      'Incidents': (incidents ?? []).join(','),
      'Orders': (orders ?? []).join(','),
      'Approvals': (approvals ?? []).join(',')
    });

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Получение списка пользователей
  Future<http.Response> getUsers() {
    var methodName = "GetUsers";

    var params = _getParams({'User': ''});
    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Получение полного списка услуг
  Future<http.Response> getServices({String serviceGroup = ''}) {
    var methodName = "GetServices";

    var params = _getParams({
      'Service': '',
      'IsGetContent': false,
      'ServiceGroup': serviceGroup,
    });

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Получение состава услуги
  Future<http.Response> getServiceContent(String service) {
    var methodName = "GetServices";

    var params = _getParams({
      'Service': service,
      'IsGetContent': true,
      'ServiceGroup': '',
    });

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Получение связанных документов
  Future<http.Response> getLinkedDocs({List? incidents, List? orders}) {
    var methodName = "GetLinkedDocs";

    var params = _getParams({
      'Incidents': (incidents ?? []).join(','),
      'Orders': (orders ?? []).join(',')
    });

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Изменение состояния наряда
  Future<http.Response> setOrderState(String number, {int statusCode = 0}) {
    var methodName = "UpdateOrder";

    var params = _getParams({
      'Number': number,
      'StatusCode': '$statusCode',
      'ClosingCode': '',
      'Solution': '',
      'Service': '',
      'ServiceContent': ''
    });

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Изменение услуги/ее состава для наряда
  Future<http.Response> setOrderService(String number,
      {String service = '', String serviceContent = ''}) {
    var methodName = "UpdateOrder";

    var params = _getParams({
      'Number': number,
      'StatusCode': '',
      'ClosingCode': '',
      'Solution': '',
      'Service': service,
      'ServiceContent': serviceContent
    });

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Закрытие (изменение кода закрытия) наряда
  Future<http.Response> closeOrder(String number,
      {int closingCode = 0, String solution = ''}) {
    var methodName = "UpdateOrder";

    var params = _getParams({
      'Number': number,
      'StatusCode': '',
      'ClosingCode': '$closingCode',
      'Solution': solution,
      'Service': '',
      'ServiceContent': ''
    });

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Изменение данных наряда
  Future<http.Response> updateOrder(String number,
      {String service = '',
      String statusCode = '0',
      String closingCode = '0',
      String solution = '',
      String serviceContent = ''}) {
    var methodName = "UpdateOrder";

    var params = _getParams({
      'Number': number,
      'StatusCode': statusCode,
      'ClosingCode': closingCode,
      'Solution': solution,
      'Service': service,
      'ServiceContent': serviceContent
    });

    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Утверждение/отклонение согласования
  Future<http.Response> updateApproval(String number,
      {bool isApproved = true}) {
    var methodName = "UpdateApproval";

    var params = _getParams({'Number': number, 'IsApproved': isApproved});
    var headers = _getHeaders(methodName);
    var body = utf8.encode(_getSoap(methodName, params));

    return http.post(_url, headers: headers, body: body);
  }

  /// Парсинг результата запроса
  List<Map<String, dynamic>> parseXml(String xml, String docName) {
    var elements = <Map<String, dynamic>>[];

    xml = xml.replaceAll('m:', '');
    var openTag = '<$docName>', closeTag = '</$docName>';

    if (xml.contains(openTag)) {
      var firstIndex = xml.indexOf(openTag);
      var lastIndex = xml.lastIndexOf(closeTag) + closeTag.length;

      var doc = XmlDocument.from(xml.substring(firstIndex, lastIndex));

      for (var child in doc!.children) {
        if (child is XmlElement && child.name == docName) {
          var element = <String, dynamic>{};

          for (var tag in child.children!) {
            if (tag is XmlElement) {
              element[tag.name] = tag.text ?? '';
            }
          }
          elements.add(element);
        }
      }
    }
    return elements;
  }
}
