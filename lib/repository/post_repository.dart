import '../../data/network/network_api_services.dart';
import '../../resources/app_url/app_url.dart';
import '../model/post_model.dart';

class PostRepository {
  final _apiService  = NetworkApiServices() ;

  Future<PostModel> getPostApi() async{
    dynamic response = await _apiService.getApi(AppUrl.postUrlEndPoint);
    return PostModel.fromJson(response) ;
  }
}