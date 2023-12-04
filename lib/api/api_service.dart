import 'package:dio/dio.dart';
import 'package:market/api/api_endpoints.dart';
import 'package:market/routes/route_names.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'product.dart';
part 'category.dart';

const String appKey =
    "phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF";

class ApiService {
  late Product product;
  late Category category;

  static const String _baseUrl = 'http://ostest.whitetigersoft.ru/api/common';

  final Dio dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      queryParameters: {
        "appKey": appKey
      },
      headers: {
        'Content-Type': 'application/json',
      }))..interceptors.add(PrettyDioLogger());

  ApiService() {
    product = Product(dio_: dio);
    category = Category(dio_: dio);
  }
}
