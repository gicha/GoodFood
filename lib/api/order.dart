part of api;

class OrderApi {
  static Future<List<Order>> all() async {
    List<Order> items = [];
    await Api.dio.get("/order").then((res) {
      items.addAll(List.from(res.data.map((item) => serializers.deserializeWith(Order.serializer, item)).toList()));
    }, onError: (e) {});
    return items;
  }

  static Future<void> delete(id) async {
    await Api.dio.get("/order_delete/$id/").then((res) {}, onError: (e) {
      print(e);
    });
  }

  static Future<void> add(String name, String count) async {
    await Api.dio.get("/add_order/$name/${count.toString()}/").then((res) {}, onError: (e) {
      print(e);
    });
  }
}
