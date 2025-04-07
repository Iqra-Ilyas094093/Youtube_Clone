import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/repo/userDataService.dart';
import 'package:youtube_clone/utilities/colors.dart';

class userNamePage extends ConsumerStatefulWidget {
  String displayName;
  String email;
  String profilePic;

  userNamePage({
    super.key,
    required this.email,
    required this.displayName,
    required this.profilePic,
  });

  @override
  ConsumerState<userNamePage> createState() => _userNamePageState();
}

class _userNamePageState extends ConsumerState<userNamePage> {
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  bool isValidate = true;

  validateUserName() async {
    final userMap = await FirebaseFirestore.instance.collection('users').get();
    final users = userMap.docs.map((user) => user).toList();
    String? targetName;
    for (var user in users) {
      if (usernameController.text == user.data()['username']) {
        targetName = user.data()['username'];
        isValidate = false;
        setState(() {});
      }
      if (usernameController.text != targetName) {
        isValidate = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 90),
            Container(
              height: 100,
              width: 150,
              child: Image.asset('assets/images/youtube-logo.jpg'),
            ),
            SizedBox(height: 80),
            Text(
              'Enter your username',
              style: TextStyle(
                color: kAssistingColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 12),
            //add form herre
            Form(
                key: formKey,
                child: TextFormField(
                  controller: usernameController,
                  onChanged: (username){
                    validateUserName();
                  },
                  autovalidateMode: AutovalidateMode.always,
                  validator: (username){
                    return isValidate? null: 'username already taken';
                  },
                  decoration: InputDecoration(
                    suffixIcon: isValidate? Icon(Icons.verified):Icon(Icons.cancel),
                    suffixIconColor: isValidate ? Colors.green:Colors.red,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide(
                        color: Colors.green,
                      )
                    )
                  ),
                )),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                ref
                    .read(userDataServiceProvider)
                    .addUserDatatoFirebase(
                      displayName: widget.displayName,
                      username: usernameController.text,
                      email: widget.email,
                      profilePic: widget.profilePic,
                      description: '',
                    );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(19)
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
