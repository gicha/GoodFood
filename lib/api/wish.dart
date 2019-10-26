part of api;

class WishApi {
  static Future<List<Wish>> all() async {
    List<Wish> items = [];
    await Api.dio.get("/wish").then((res) {
      items.addAll(List.from(res.data.map((item) => serializers.deserializeWith(Wish.serializer, item)).toList()));
    }, onError: (e) {});
    return items;
  }

  static Future<void> delete(id) async {
    await Api.dio.get("/wish_delete/$id/").then((res) {}, onError: (e) {});
  }
}
