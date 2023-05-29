import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optuae/Functions/validation.dart';
import 'package:optuae/Widget/appbar.dart';
import 'package:optuae/services/Customloader.dart';
import 'package:optuae/services/api_urls.dart';
import 'package:optuae/services/webservices.dart';
import '../constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/round_edged_button.dart';
import '../services/custom_circular_image.dart';

class notification extends StatefulWidget {
  final String? noti_id;
   notification({Key? key,this.noti_id='0',}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  TextEditingController ConfirmPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController NewPassword = TextEditingController();
  List lists = [];
  bool load = false;

  @override
  void initState() {
    // TODO: implement initState
    get_lists();
    super.initState();
  }

  get_lists() async{
    setState(() {
      load = true;
    });
    lists = await Webservices.getList(ApiUrls.get_notificatin+userData.id.toString());
    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: appBar(
        context: context,
        title: 'Notification',
        titleStyle: MyStyle.black50016,
      ),
      body: load?CustomLoader():Container(
        height: MediaQuery.of(context).size.height,
        child: lists.length>0?ListView.builder(
            itemCount: lists.length,
            itemBuilder: (context,Index){
              return Container(
                margin: EdgeInsets.symmetric(vertical: 2.0,horizontal: 5.0),
                child: ListTile(
                  tileColor: Colors.grey.withOpacity(.1),
                  selected:widget.noti_id==lists[Index]['id'].toString()?true:false,
                  trailing: widget.noti_id==lists[Index]['id'].toString()?
                  Icon(Icons.circle_rounded,size: 5,color: MyColors.red,):null,
                  selectedTileColor: MyColors.primaryColor.withOpacity(0.5),
                  selectedColor: MyColors.black,
                  contentPadding: EdgeInsets.all(5.0),
                  // style: ListTileStyle.values,
                  minLeadingWidth: 10.0,
                  minVerticalPadding: 10.0,
                  horizontalTitleGap: 10.0,
                  // trailing: Text('ksdf'),
                  subtitle: Text('${lists[Index]['human_time']}'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  leading: CustomCircularImage(
                    imageUrl: lists[Index]['profile'],
                    fileType: CustomFileType.network,
                    fit: BoxFit.cover,
                  ),
                  // style:ListTileStyle.values<ListTile>[],
                  title: Text('${lists[Index]['message']}'),
                  onTap: () {
                    // Handle notification tap
                  },
                ),
              );
        }):Center(
          child: Text('No data found.',style: TextStyle(color: MyColors.black),),
        ),
      )
    );
  }
}
