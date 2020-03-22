import 'package:demo_masterclass_balta/models/user.models.dart';
import 'package:demo_masterclass_balta/view-models/view-models.signup.viewmodel.dart';

class AccoutRepository {

  Future<UserModel> create(SignupViewModel model) async {
    await Future.delayed(new Duration(microseconds: 5000));

    return new UserModel(
      id: "1",
      name: "Thiago Gomes",
      email: "thiago@mail.com",
      picture: "https://picsum.photos/200/200",
      role: "student",
      token: "xpto",
    );
  }

}
