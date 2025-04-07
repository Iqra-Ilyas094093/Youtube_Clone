import 'package:flutter/material.dart';

class userChannelPage extends StatelessWidget {
  const userChannelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'assets/images/newBackground.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
            child: Row(

              children: [
                CircleAvatar(radius: 38, backgroundColor: Colors.grey),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Iqra Ilyas',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '@iqrailyas094',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    RichText(text: TextSpan(
                      style: TextStyle(fontSize: 13,color: Colors.grey.shade600),
                      children: [
                        TextSpan(text: 'No Subscriptions'),
                        TextSpan(text: 'No Videos'),
                      ]
                    ))
                  ],
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(19)
              ),
              child: Center(child: Text('Subscribe',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)),
            ),
          ),
          SizedBox(height: 150,),
          Text('No Videos',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
        ],
      ),
    );
  }
}
