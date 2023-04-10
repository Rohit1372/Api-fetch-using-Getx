import 'package:app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  var controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products List"),
      ),
      body: Obx(() {
        if (controller.isloading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          controller.listOfProducts[index].imageLink,
                          width: 150,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.listOfProducts[index].name,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            controller.listOfProducts[index].brand,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            controller.listOfProducts[index].category,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: controller.listOfProducts.length,
          );
        }
      }),
    );
  }
}
