

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color.dart';


class InterNetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress ;
  const InterNetExceptionWidget({Key? key , required this.onPress}) : super(key: key);

  @override
  State<InterNetExceptionWidget> createState() => _InterNetExceptionWidgetState();
}

class _InterNetExceptionWidgetState extends State<InterNetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    return  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height * .15 ,),
          const Icon(Icons.cloud_off , color: Colors.red,size: 50,),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: Text('There might have some technical issue or check your internet connection and try again'.tr , textAlign: TextAlign.center,style: const TextStyle(
              color: Colors.white
            ),)),
          ),
          SizedBox(height: height * .15 ,),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.buttonColor ,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Text('Retry' , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)),
            ),
          )
        ],
      ),
    );
  }
}
