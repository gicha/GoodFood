part of api;

class ShopApi {
  static Future<List<Shop>> all() async {
    List<Shop> items = [];
    await Api.dio.get("/store").then((res) {
      items.addAll(List.from(res.data.map((item) => serializers.deserializeWith(Shop.serializer, item)).toList()));
    }, onError: (e) {});
    return items;
  }
}
