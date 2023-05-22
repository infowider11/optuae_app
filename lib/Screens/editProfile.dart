import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optuae/Widget/appbar.dart';
import 'package:optuae/modal/user_modal.dart';
import 'package:optuae/services/api_urls.dart';
import 'package:optuae/services/auth.dart';
import 'package:optuae/services/validation.dart';
import 'package:optuae/services/webservices.dart';
import '../constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../Widget/custom_text_field.dart';
import '../Widget/round_edged_button.dart';
import '../services/custom_circular_image.dart';




class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController email=TextEditingController();
  TextEditingController firstName=TextEditingController();
  TextEditingController lastName=TextEditingController();
  TextEditingController mobile=TextEditingController();
  TextEditingController address=TextEditingController();
  late File imgFile;
  final imgPicker = ImagePicker();
  var selectedimage;
  @override
  void initState() {
    // TODO: implement initState
    email.text=userData.email.toString();
    firstName.text=userData.fName.toString();
    lastName.text=userData.lName.toString();
    mobile.text=userData.phone.toString();
    address.text=userData.address??'';
    super.initState();
  }

  ///image upload code
  void _image_camera_dialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(
          'Select an Image',
          style: GoogleFonts.openSans(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black54),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
              onPressed: () {
                openGallery();
                Navigator.pop(context);
              },
              child: Text(
                'Select a photo from Gallery',
                style: GoogleFonts.openSans(color: Colors.grey, fontSize: 15),
              )),
          CupertinoActionSheetAction(
              onPressed: () {
                openCamera();
                Navigator.pop(context);
              },
              child: Text(
                'Take a photo with the camera',
                style: GoogleFonts.openSans(color: Colors.grey, fontSize: 15),
              )),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel',
              style: GoogleFonts.openSans(fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  void openCamera() async {
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(imgCamera!.path);
      selectedimage = imgFile;
      print('image upload$imgFile');
    });
  }

  void openGallery() async {
    var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    setState(() {
      imgFile = File(imgGallery!.path);
      selectedimage = imgFile;
      print('image upload$imgFile');

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: appBar(context: context, title: 'Edit Profile', titleStyle: MyStyle.black50016,),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: size_width*0.04, right: size_width*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size_height*0.02,),
              Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 45,
                        child:
                              selectedimage!=null?
                              Image.file(height: 120.0, width: 120.0, File(selectedimage!.path,), fit: BoxFit.cover,) :
                              CustomCircularImage(
                                imageUrl: userData.profileImage.toString(),
                                fit: BoxFit.cover,
                                height: 120,
                                width: 120,
                                fileType: CustomFileType.network,
                              ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=> _image_camera_dialog(context),
                    child: Padding(
                      padding: EdgeInsets.only(left: size_width*.5, top: size_height*0.075),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: MyColors.primaryColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset( MyImages.camera, fit: BoxFit.cover,  height: size_height*0.025, ),
                            ))),
                  ),
                ],
              ),
              SizedBox(height: size_height*0.01,),
              Align(
                  alignment: Alignment.center,
                  child: Text('Edit Profile Picture', style: MyStyle.black50015,)),
              SizedBox(height: size_height*0.03,),
              CustomTextField(
                controller: firstName,
                hintText: 'First Name',
                bgColor: MyColors.white,
                contentBottomPadding: 5,
                suffix: Image.asset(MyImages.user, height: size_height*0.03),
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(height: size_height*0.01,),
              CustomTextField(
                controller: lastName,
                hintText: 'Last Name',
                bgColor: MyColors.white,
                contentBottomPadding: 5,
                suffix: Image.asset(MyImages.user, height: size_height*0.03),
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(height: size_height*0.01,),
              CustomTextField(
                controller: email,
                hintText: 'Email Address',
                enabled: false,
                bgColor: MyColors.white,
                contentBottomPadding: 5,
                keyboardType: TextInputType.emailAddress,
                suffix: Image.asset(MyImages.mail, height: size_height*0.03),
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(height: size_height*0.01,),
              CustomTextField(
                controller: mobile,
                hintText: 'Mobile',
                bgColor: MyColors.white,
                contentBottomPadding: 5,
                keyboardType: TextInputType.number,
                suffix: Image.asset(MyImages.phone, height: size_height*0.03),
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(height: size_height*0.01,),
              CustomTextField(
                controller: address,
                hintText: 'Address',
                bgColor: MyColors.white,
                contentTopPadding: 5,
                maxLines: 10,
                myheight: size_height*0.15,
                hintcolor: MyColors.lightblack.withOpacity(0.45),
              ),
              SizedBox(height: size_height*0.04,),

              RoundEdgedButton(
                text: 'Update',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: size_height*0.07,
                onTap: ()async{
                  if(validateString(firstName.text,'Please enter first name.', context)==null&&
                      validateString(lastName.text,'Please enter last name.', context)==null&&
                      validateString(mobile.text,'Please enter phone number.', context)==null
                  ){
                    Map<String,dynamic> files = {};
                    Map<String,dynamic> data = {
                      'id':userData.id.toString(),
                      'f_name':firstName.text,
                      'l_name':lastName.text,
                      'phone':mobile.text,
                      'address':address.text,
                    };
                    if(selectedimage!=null){
                      files['profile_image']=imgFile;
                    }
                    loadingShow(context);
                    var res = await Webservices.postDataWithImageFunction(body:data, files: files, apiUrl:ApiUrls.edit_profile);
                    loadingHide(context);
                    print('update profile $res');
                    if(res['status'].toString()=='1'){
                      userData = UserModal.fromJson(res['data']);
                      updateUserDetails(res['data']);
                      showSnackbar('Profile successfully updated.');
                    }
                  }
                }
              ),



            ],
          ),
        ),
      ),

    );

  }
}
