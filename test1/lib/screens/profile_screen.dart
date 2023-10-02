import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8.0,
                )
              ],
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24.0),
              ),
            ),
            child: SafeArea(
                child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/images/wave.svg',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings_outlined,
                                color: Colors.white70,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share_outlined,
                                  color: Colors.white70)),
                        ],
                      ),

                      ///-----
                      CircleAvatar(
                        radius: 50.0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.asset('assets/images/img.png')),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Ahmad Alhariri',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'SoftWare Engineer | Flutter Devloper',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          [FontAwesomeIcons.whatsapp, Colors.green],
                          [FontAwesomeIcons.facebookF, Colors.blueAccent],
                          [FontAwesomeIcons.github, Colors.black],
                          [FontAwesomeIcons.twitter, Colors.blue],
                          [Icons.phone, Colors.grey],
                        ]
                            .map((e) => CircleAvatar(
                          backgroundColor: Colors.white,
                              child: IconButton(
                                tooltip: e.toString(),
                                  onPressed: () {},
                                  icon: Icon(
                                    e.first as IconData?,
                                    color: e.last as Color,
                                  )),
                            ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ],
            )),
          ),
          Expanded(child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const Text('Full Name',style: TextStyle(fontWeight: FontWeight.bold,),),
              const SizedBox(height: 10.0,),
              TextFormField(
                initialValue: 'Ahmad Alhariri',
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                      vertical: 12.0

                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),

              //-------------
              const Text('Email Address',style: TextStyle(fontWeight: FontWeight.bold,),),
              const SizedBox(height: 10.0,),
              TextFormField(
                initialValue: 'mr.ahmed.alhariri@gmail.com',
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),

                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 12.0

                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),

              //-------------
              const Text('Date of Birth',style: TextStyle(fontWeight: FontWeight.bold,),),
              const SizedBox(height: 10.0,),
              TextFormField(
                initialValue: '2001/13/1',
                decoration: InputDecoration(
                  prefixIcon: Icon(FontAwesomeIcons.cakeCandles),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 12.0

                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),

              //-------------
              const Text('Gender',style: TextStyle(fontWeight: FontWeight.bold,),),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 12.0

                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.circle,color: Colors.orangeAccent,),
                          Spacer(),
                          Text('Male',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          Spacer(),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 12.0

                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0)
                      ),
                      child:  Row(
                        children: [
                          Icon(Icons.circle_outlined,color: Colors.orangeAccent,),
                          Spacer(),
                          Text('Female',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          Spacer(),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),

              //-------------
              const Text('About',style: TextStyle(fontWeight: FontWeight.bold,),),
              const SizedBox(height: 10.0,),
              TextFormField(
                initialValue: 'Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm '
                    'Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm '
                    'Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm Lorme ipusm ',
                maxLines: 6,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.description),
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                    vertical: 12.0
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
            ],
          ))
        ],
      ),
    );
  }
}
