import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../Constants/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final ImagePicker _BannerPicker = ImagePicker();
  File? selfieIMG;

  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios,size: MediaQuery.sizeOf(context).height*0.025,color: black.withOpacity(0.8),),
        ),
        backgroundColor: white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Edit Profile",
          style: TextStyle(
            fontFamily: "OpenSans_SemiBold",
            fontWeight: FontWeight.bold,
            color: black,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.sizeOf(context).height * 0.025),
                        width: MediaQuery.sizeOf(context).height * 0.15,
                        height: MediaQuery.sizeOf(context).height * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: NetworkImage(
                                    selfieIMG != null ? "$selfieIMG" :
                                    "https://i.stack.imgur.com/l60Hf.png"),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.125),
                                  offset: Offset(0, 0),
                                  blurRadius: 1,
                                  spreadRadius: 0)
                            ]),
                      ),
                    ],
                  ),

                  //Upload Photo Button
                  InkWell(
                    onTap: ()
                    {
                      showCupertinoModalPopup(
                          context: context, builder: (BuildContext context)
                      {
                        return CupertinoActionSheet(
                          title: const Text("Edit Photo"),
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: ()
                            {
                              Navigator.pop(context);
                            }, child: const Text("Cancel"),
                          ),
                          actions: [
                            CupertinoActionSheetAction(
                                onPressed: () async {
                                  final XFile? image = await _BannerPicker.pickImage(source: ImageSource.gallery);
                                  if (image == null) return;

                                  // Convert XFile to File
                                  final imageTemp = File(image.path);

                                  setState(() {
                                    selfieIMG = imageTemp; // Assign to the File variable
                                  });
                                  Navigator.pop(context);

                                },
                                child: const Text("Choose Photo")),

                            CupertinoActionSheetAction(
                                onPressed: () async {
                                  final XFile? image = await _BannerPicker.pickImage(source: ImageSource.camera);
                                  if (image == null) return;

                                  // Convert XFile to File
                                  final imageTemp = File(image.path);

                                  setState(() {
                                    selfieIMG = imageTemp; // Assign to the File variable
                                  });
                                  Navigator.pop(context);

                                },
                                child: const Text("Take Photo")),

                          ],
                        );
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height * 0.015,
                          vertical: MediaQuery.of(context).size.height * 0.015),
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 0,
                                blurRadius: 1,
                                offset: const Offset(0,0)
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Icon(CupertinoIcons.camera,size: 20,color: Colors.black.withOpacity(0.6),),

                          const SizedBox(width: 10,),

                          Text("Upload photo",style: TextStyle(
                              color: Colors.black.withOpacity(0.8),fontSize: 12,fontFamily: "Helvetica_Bold"
                          ),)
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                    ),
                    child: TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontFamily: "OpenSans",
                          color: black,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.height * 0.015,
                            vertical: MediaQuery.of(context).size.height * 0.015),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                    ),
                    child: TextField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontFamily: "OpenSans",
                          color: black,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.height * 0.015,
                            vertical: MediaQuery.of(context).size.height * 0.015),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontFamily: "OpenSans",
                          color: black,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.height * 0.015,
                            vertical: MediaQuery.of(context).size.height * 0.015),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  Container(
                    //padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                    ),
                    child:  DOBInputField(
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        fontFamily: "OpenSans",
                        color: black,
                      ),
                      inputDecoration: InputDecoration(
                          fillColor: white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: primaryColor)),
                          contentPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.015,
                        vertical: MediaQuery.of(context).size.height * 0.015),
                        filled: true
                      ),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      showLabel: true,
                      dateFormatType: DateFormatType.DDMMYYYY,
                      autovalidateMode: AutovalidateMode.disabled,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                ],
              ),

              Positioned(
                  left: 0,right: 0,
                  bottom: 0,
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator(color: primaryColor,)) : SizedBox())
            ]
        ),
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [


          InkWell(
            onTap: ()
            async {

            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height * 0.025
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height * 0.02,
                  vertical: MediaQuery.sizeOf(context).height * 0.0125),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: black, width: 1),
                  color: black,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: Offset(0, 0),
                      blurRadius: 1.5,
                    )
                  ]),
              child: Text(
                "Save Changes",
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * 0.018,
                    fontFamily: "OpenSans_SemiBold",
                    color: Colors.white),
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
          ),

        ],
      ),
    );
  }
}
