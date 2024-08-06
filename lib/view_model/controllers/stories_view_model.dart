import 'package:get/get.dart';

import '../../model/stories_model.dart';

class StoriesViewModel extends GetxController{

  RxList<StoriesModel> storiesList = <StoriesModel>[
    StoriesModel(title: 'Add Listing', image: 'assets/icons/Add.svg'),
    StoriesModel(title: 'Search', image: 'assets/icons/Search.svg'),
    StoriesModel(title: 'Notification', image: 'assets/icons/Notification.svg'),
    StoriesModel(title: 'Electronic', image: 'assets/images/story 1.png'),
    StoriesModel(title: 'Appliances', image: 'assets/images/story 2.png'),
    StoriesModel(title: 'Mobiles', image: 'assets/images/story 2.png'),
  ].obs;

}