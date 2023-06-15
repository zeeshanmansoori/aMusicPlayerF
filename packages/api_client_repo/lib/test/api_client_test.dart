import 'package:api_client_repo/api_client.dart';
import 'package:test/test.dart';
import 'package:shared_repo/models/request_status.dart';

void main() {
  var client = ApiClient();

  test("getCategories", () async {
    var result = await client.getGenres();
    assert(result.status == RequestStatus.SUCCESS);
  });

  // test(
  //   "getAccessToken",
  //   () => client.getAccessToken(),
  // );
}
