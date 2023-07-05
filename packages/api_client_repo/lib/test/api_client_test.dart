import 'package:api_client_repo/api_client.dart';
import 'package:test/test.dart';


void main() {
  var client = ApiClient();
  //
  // test("getCategories", () async {
  //   var result = await client.getGenres();
  //   assert(result.status == RequestStatus.SUCCESS);
  // });

  test(
    "getAccessToken",
    () => client.getAccessToken(),
  );
}
