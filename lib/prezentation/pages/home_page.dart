import 'package:currency_convertor/domain/model/data_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/api.dart';
import '../../data/network_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data> list = [];
  bool isselected1=false;
  String image1="assets/images/flag_1.png";
  String image2="assets/images/flag_2.png";
  String country1 = "SGD";
  String rate1 = "8736.76";
  String rate2 = "11618.15";
  String country2 = "USD";
  String rate3="";
  String flag1="SGD";
  String flag2="USD";
  convertorlanguage()async{
    final db=await SharedPreferences.getInstance();
    db.setStringList("uzb words",[
      "Valyuta almashtirish",
      
      
    ]);


  }

  fetchConvertor() async {
    final data = await Network.getMethod(api: Apis.apiconvertor);
    list = Network.parsedataList(data!);
    
    setState(() {});
   
    
   

      
  }

  @override
  void initState() {
    fetchConvertor();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAEAFE).withOpacity(0.93),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (value){
              debugPrint(value.toString());
              context.setLocale(value);
            },
            itemBuilder: (context){

             return  [
                PopupMenuItem(
                  
                  value: Locale("uz","UZ"),child: Text("🇺🇿 UZ",style: const TextStyle(fontSize: 20)),onTap: (){
                    
                  
                },),
                PopupMenuItem(value: Locale("ru","RU"),child: Text("🇷🇺 RU",style:const TextStyle(fontSize: 20)),),
                PopupMenuItem(value: Locale("en","US"),child: Text("🇺🇸 EN",style: const TextStyle(fontSize: 20))),
              ];
              
          },icon: const Icon(Icons.language_rounded,size: 30,color: Colors.blue,),color: Colors.white, )
        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "currency Converter".tr(),
          style: TextStyle(
              color: Color(0xff1F2261),
              fontSize: 28,
              fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child:  Text(
                "check live rates, set rate alerts, receive\nnotifications and more.".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff808080)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 380,
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "amount".tr(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    
                   Padding(
                    padding: EdgeInsets.only(top: 5),
                     child: Transform.scale(
                     scale:2,
                       child: Image.network("https://flagcdn.com/w20/${flag1.substring(0, 2).toLowerCase()}.png",
                       height: 50,
                       width: 50,
                        ),
                     ),
                   ),
                      Text(
                        country1,
                        style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Color(0xfff26278D)),
                      ),
                      IconButton(
                          onPressed: () {
                           
                         showModalBottomSheet(
                            backgroundColor: Colors.grey,
                            context: context, builder: (BuildContext context){
                              return ListView.builder(
                                itemCount: list.length,
                                itemBuilder: (context,index){
                                 final data=list[index];
                                return Builder(
                                  builder: (context) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                      child: ListTile(
                                        trailing: Container(
                                          // color:Colors.primaries [index%Colors.primaries.length],
                                          child: Image.asset("assets/images/money1.png")),
                                        onTap: () {
                                          flag1=data.ccy;
                                          country1=data.ccy;
                                          rate1=data.rate;

                                          setState(() {
                                            
                                          });
                                          Navigator.pop(context);
                                        },
                                        minVerticalPadding: 10,
                                        tileColor: Colors.primaries[index%Colors.primaries.length],
                                        leading: Text(data.ccyNmUZ,style: TextStyle(
                                          fontSize: 23,
                            fontWeight: FontWeight.w900,
                            color: Colors.white
                                        ),),
                                      ),
                                    );
                                  }
                                );
                              });

                            });
                           
      
                        
                            setState(() {
                              
                            });
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 27,
                            color: Colors.black.withOpacity(0.5),
                          )),
                SizedBox(
                  height: 60,
                  width: 180,
                  child: TextField(
                    
                    scrollPadding: EdgeInsets.only(bottom: 10),
                    
                    style: TextStyle(fontSize: 20),
                     keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onSubmitted: (value){
                      debugPrint(rate1);
                      debugPrint(rate2);
                     
                      rate3=(double.parse(value)*(double.parse(rate1)/double.parse(rate2))).toString().length>8?(double.parse(value)*(double.parse(rate1)/double.parse(rate2))).toString().substring(0,8):(double.parse(value)*(double.parse(rate1)/double.parse(rate2))).toString();
                      setState(() {
                        debugPrint(rate3);
                      });
                    },
                    
                    
                    decoration: InputDecoration(
                      

                      focusedBorder: OutlineInputBorder(

                        borderSide: BorderSide(color: Colors.black
                      ,  width: 0.1)
                      ),
                      
                      
                      filled: true,
                      fillColor: Color(0xffEFEFEF),
                    border: OutlineInputBorder(
                      

                    )),
                  ),
                ) ],
                  ),
               
                  Row(
                    children: [
                      Expanded(child: Container(height: 1,
                      color: Color(0xffE7E7EE),)),
                      GestureDetector(
                        onTap: (){
                          final country=country1;
                          final rate=rate1;
                          final image=image1;
                          final flag=flag1;
                          flag1=flag2;
                          flag2=flag;

                          rate1=rate2;
                          rate2=rate;
                          country1=country2;
                          country2=country;
                          image1=image2;
                          image2=image;
                          setState(() {
                            
                          });
                          
                        },
                        child: CircleAvatar(radius: 30,backgroundColor: Color(0xff26278D),
                        child: Image.asset("assets/icons/icon_swap.png",height: 30,),),
                      ),
                      
                       Expanded(child: Container(height: 1,
                      color: Color(0xffE7E7EE),)),
                    ],
                  )
               , Text(
                    "converted Amount".tr(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.scale(
                        scale: 2.2,
                        child: Image.network(
                                           "https://flagcdn.com/w20/${flag2.substring(0, 2).toLowerCase()}.png",
                          height: 60,
                          width: 60,
                        ),
                      ),
                      Text(
                        country2,
                        style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Color(0xfff26278D)),
                      ),
                       IconButton(
                          onPressed: () {
                           
                         showModalBottomSheet(
                            backgroundColor: Colors.grey,
                            context: context, builder: (BuildContext context){
                              return ListView.builder(
                                itemCount: list.length,
                                itemBuilder: (context,index){
                                 final data2=list[index];
                                
                                return Builder(
                                  builder: (context) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.all(10),
                                        trailing: Image.asset("assets/images/money1.png"),
                                        onTap: () {
                                           flag2=data2.ccy;
                                          country2=data2.ccy;
                                          rate2=data2.rate;

                                          setState(() {
                                            
                                          });
                                          Navigator.pop(context);
                                        },
                                        minVerticalPadding: 10,
                                        tileColor: Colors.white,
                                        leading: Text(data2.ccyNmUZ,style: TextStyle(
                                          fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Color(0xfff26278D)
                                        ),),
                                      ),
                                    );
                                  }
                                );
                              });

                            });
                           
      
                        
                            setState(() {
                              
                            });
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 27,
                            color: Colors.black.withOpacity(0.5),
                          )),
                     
                      Container(
                     
                       padding: EdgeInsets.all(10),
                        alignment: Alignment.centerRight,
                        child: Center(
                          child: Text(
                            rate3,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff3C3C3C)),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffEFEFEF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        width: 160,
                      )
                    ],
                  ),
                ],
              ),
            ),
       const     SizedBox(height: 20,),
    Padding(
      padding:const EdgeInsets.symmetric(horizontal: 20),
      child:    Text("indicative Exchange Rate".tr(),
      style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,
      color: Color(0xffA1A1A1)),),
    ),
    SizedBox(height: 30,),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text("1 $country1=${(double.parse(rate1)/double.parse(rate2)).toString().substring(0,6)} $country2",
      style: TextStyle(fontSize: 20,
      fontWeight: FontWeight.w700),),
    ),
          ],
        ),
      ),
    );
  }
}
