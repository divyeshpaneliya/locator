import 'package:flutter/material.dart';
import 'package:locator/Screens/home_screen/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Geo Location"),
          actions: [
            IconButton(onPressed: () async {
              Map<Permission, PermissionStatus>map =
              await[Permission.location, Permission.camera].request();

              if (await Permission.camera.isDenied) {
                print("Camera Deny");
              }
              if (await Permission.location.isDenied) {
                print("location");
              }
            }, icon: Icon(Icons.settings)),
          ],
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: (){
              Provider.of<Class_Provider>(context,listen: false).getPositon();
            }, child: Text("Locations")),
            SizedBox(height: 12,),
            Text("latitude: ${Provider.of<Class_Provider>(context,listen: true).lat}"),
            SizedBox(height: 5,),
            Text("longitude: ${Provider.of<Class_Provider>(context,listen: true).lon}"),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(itemCount: Provider
                  .of<Class_Provider>(context, listen: false)
                  .l1
                  .length,
                  itemBuilder: (Context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Text("Address:- ${Provider.of<Class_Provider>(context,listen: true).l1[0]}"),
                      ],
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }


}
