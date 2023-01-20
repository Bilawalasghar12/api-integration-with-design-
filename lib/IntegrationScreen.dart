import 'package:api_integration_with_design/modelclass.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'modelclass.dart';

class IntegrationScreen extends StatefulWidget {
  const IntegrationScreen({Key? key}) : super(key: key);

  @override
  State<IntegrationScreen> createState() => _IntegrationScreenState();
}

class _IntegrationScreenState extends State<IntegrationScreen> {
  late SWPJobSearch Jobsinfo;

  @override
  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        leading: Icon(
          Icons.location_on_rounded,
          color: Colors.grey,
        ),
        title: Text(
          'Jobs within 30 miles\n from London N11 3Gx,Uk',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<SWPJobSearch>(
          future: getJob(),
          builder: (context, AsyncSnapshot<SWPJobSearch> snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 22,
                      ),
                      Text(
                        '13 jobs',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Text('showing', style: TextStyle(color: Colors.grey)),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'latest jobs first',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black54),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.userSearchDataParse
                            ?.jobSearchDetailedData?.jobSearchList?.length ??
                        0,
                    padding: EdgeInsets.all(10),
                    separatorBuilder: (BuildContext context, index) => SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      JobSearchData? jobSearchList = snapshot.data!.userSearchDataParse!
                          .jobSearchDetailedData!.jobSearchList! [index];

                      return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          height: 260,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(jobSearchList!.city!, style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFF812E),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.flash_on,
                                            size: 15,
                                            color: Color(0xffFFC723),
                                          ),
                                          Text('IMMEDIATE START'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.bookmark)
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'less than a mile away',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Icon(Icons.arrow_circle_right_rounded)
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'testing 1234',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text('Testing admin')
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.location_on_rounded,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'London',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        height: 26,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Color(0xff3BD55A),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Text(
                                            '£15 per hour',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Icon(
                                        Icons.flash_on,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        'Be an early applicant',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 14),
                                      Text(
                                        'Just posted',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ));
                    },
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Future<SWPJobSearch> getJob() async {
    final token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3N0YWdpbmcuZ2V0LWxpY2Vuc2VkLmNvLnVrL2d1YXJkcGFzcy9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY3MzUxMzI2MCwibmJmIjoxNjczNTEzMjYwLCJqdGkiOiJZMmF6TFpIUUZ1aTZRdnczIiwic3ViIjoiNTkzNTQiLCJwcnYiOiIyZTE2YThmMGRmMzcxNTZkNTkxMzJjZDk5NGEzMjY1OTdhNWMzZDViIiwiaWQiOjU5MzU0LCJ0eXBlIjoiSk9CU0VFS0VSIn0.rW7KB82QrX678M7TgfeuyB9mBvT2PNftBfwS0UQGhn0';
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Accept": "application/json"
    };

    Map<String, dynamic> body = {
      "postcode": "London N11 3GX, UK",
      };
    try {
      final response = await http.post(
          Uri.parse(
              'https://staging.get-licensed.co.uk/guardpass/api/job/search'),
          headers: headers,
          body: body);
      print(response.body);

       var data = jsonDecode(response.body);
       return SWPJobSearch.fromMap(data);
      return SWPJobSearch();
    } catch (e) {
      print('Catch Error: ${e}');
      return SWPJobSearch();
    }
  }
}
