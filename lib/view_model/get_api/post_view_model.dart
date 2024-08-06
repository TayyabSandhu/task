import 'package:get/get.dart';
import '../../../../data/response/status.dart';
import '../../model/post_model.dart';
import '../../repository/post_repository.dart';

class PostViewModel extends GetxController {


  @override
  void onInit() {
    postListApi();
    super.onInit();
  }

  final _api = PostRepository();
  final rxRequestStatus = Status.LOADING.obs ;
  final postList =PostModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setPostList(PostModel value) => postList.value = value ;
  void setError(String value) => error.value = value ;


  void postListApi(){
    _api.getPostApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setPostList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi(){
    setRxRequestStatus(Status.LOADING);
    _api.getPostApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setPostList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}