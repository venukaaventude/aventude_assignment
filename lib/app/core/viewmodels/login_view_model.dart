import 'package:aventude_assignment/app/core/datamodels/base_model.dart';
import 'package:aventude_assignment/app/core/services/authentication_service.dart';
import 'package:aventude_assignment/app/core/services/dialog_service.dart';
import 'package:aventude_assignment/app/router/locator.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  bool isPasswordVisible = false;
  final DialogService _dialogService = locator<DialogService>();
  bool isLoginInprogress = false;
  bool isCompanyLoginInprogress = false;
  bool isServerEndpointSelectorVisible = false;

  Future<bool> login(String? email, String password) async {
    setBusy(true);
    isLoginInprogress = busy;
    bool success = false;
    String loginInfo = '';

    if (email == null || password == '') {
      loginInfo = 'You must enter an Email and Password before you can login!';
    } else {
      try {
        if (email == 'venuka@gmail.com' && password == '1234') {
          // loginInfo = 'valid username or password!';

          await _authenticationService.getPostData();
          await _authenticationService.getAlbumData();
          success = true;
        }

        if (!success) {
          loginInfo = 'Invalid username or password!';
        }
      } catch (e) {
        if (e.toString().contains('Exception:')) {
          loginInfo =
              'Communication failure. Please check your internet connectivity!';
        } else {
          loginInfo = e.toString();
        }
      }
    }

    if (!success || loginInfo.isNotEmpty) {
      await _dialogService.showDialog(
          title: 'Login Failed', description: loginInfo);
    }

    setBusy(false);
    isLoginInprogress = busy;
    return success;
  }
}
