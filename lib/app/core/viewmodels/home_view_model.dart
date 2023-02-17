import 'package:aventude_assignment/app/core/datamodels/base_model.dart';
import 'package:aventude_assignment/app/core/services/authentication_service.dart';
import 'package:aventude_assignment/app/router/locator.dart';

class HomeViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  bool status = false;
  Future init() async {
    // await loadDashboardData();
  }

  Future<bool> getComments(int id) async {
    var list = await _authenticationService.getCommentsData(id);
    if (list.isNotEmpty) {
      status = true;
    }
    return status;
    //first qa release
    // second qa release
    // last qa release
  }
}
