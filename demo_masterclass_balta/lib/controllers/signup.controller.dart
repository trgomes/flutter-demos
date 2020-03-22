import 'package:demo_masterclass_balta/models/user.models.dart';
import 'package:demo_masterclass_balta/repositories/account.repository.dart';
import 'package:demo_masterclass_balta/view-models/view-models.signup.viewmodel.dart';

class SignupController {
  AccoutRepository repository;

  SignupController() {
    repository = new AccoutRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.busy = true;
    var user = await repository.create(model);
    model.busy = false;
    return user;
  }
}
