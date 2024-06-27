import 'package:cancer/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  /* appBar: AppBar(
     foregroundColor: Colors.white,
     backgroundColor: Kpimary,
    
     title:
     Text("Information about App ",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w600),),
   ),*/
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 22,
            top: 30
          ),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              buildInformation(
              text:'Design Status',
              title: "This is a prototype."
            ),
              SizedBox(height: 30,),
              buildInformation(
                  text:'Purpose',
                  title: "This app uses computer vision to identify the three highest probability diagnoses for a skin lesion. A more advanced version could be used to identify cancerous skin lesions early."
              ),
  SizedBox(height: 30,),
                 buildNavigator(
              ),
              SizedBox(height: 20,),

              Divider(height: 20,endIndent: 13,color: Colors.black,),
              buildPrediction(text: "nv",
                  title: "Melanocytic nevi are benign neoplasms of melanocytes and appear in a myriad of variants, which all are included in our series. The variants may differ significantly from a dermatoscopic point of view."
              ),
              SizedBox(height: 12,),
              buildPrediction(text: "mel",
                  title: "Melanoma is a malignant neoplasm derived from melanocytes that may appear in different variants. If excised in an early stage it can be cured by simple surgical excision. Melanomas can be invasive or non-invasive (in situ). We included all variants of melanoma including melanoma in situ, but did exclude non-pigmented, subungual, ocular or mucosal melanoma."
              ),
              SizedBox(height: 12,),
              buildPrediction(text: "bkl",
                  title: '"Benign keratosis" is a generic class that includes seborrheic ker- atoses ("senile wart"), solar lentigo - which can be regarded a flat variant of seborrheic keratosis - and lichen-planus like keratoses (LPLK), which corresponds to a seborrheic keratosis or a solar lentigo with inflammation and regression [22]. The three subgroups may look different dermatoscop- ically, but we grouped them together because they are similar biologically and often reported under the same generic term histopathologically. From a dermatoscopic view, lichen planus-like keratoses are especially challeng- ing because they can show morphologic features mimicking melanoma [23] and are often biopsied or excised for diagnostic reasons.'  ),
              SizedBox(height: 12,),
              buildPrediction(text: "bcc",
                  title: "Basal cell carcinoma is a common variant of epithelial skin cancer that rarely metastasizes but grows destructively if untreated. It appears in different morphologic variants (flat, nodular, pigmented, cystic, etc) [21], which are all included in this set."    ),

        SizedBox(height: 12,),
              buildPrediction(text: "akiec",
            title: "Actinic Keratoses (Solar Keratoses) and intraepithelial Carcinoma (Bowen’s disease) are common non-invasive, variants of squamous cell car- cinoma that can be treated locally without surgery. Some authors regard them as precursors of squamous cell carcinomas and not as actual carci- nomas. There is, however, agreement that these lesions may progress to invasive squamous cell carcinoma - which is usually not pigmented. Both neoplasms commonly show surface scaling and commonly are devoid of pigment. Actinic keratoses are more common on the face and Bowen’s disease is more common on other body sites. Because both types are in- duced by UV-light the surrounding skin is usually typified by severe sun damaged except in cases of Bowen’s disease that are caused by human papilloma virus infection and not by UV. Pigmented variants exists for Bowen’s disease [19] and for actinic keratoses [20]. Both are included in this set." ),      SizedBox(height: 12,),
              buildPrediction(text: "vasc",
            title: "Vascular skin lesions in the dataset range from cherry angiomas to angiokeratomas [25] and pyogenic granulomas [26]. Hemorrhage is also included in this category"    ),
              SizedBox(height: 12,),
              buildPrediction(text: "df",
                  title: "Dermatofibroma is a benign skin lesion regarded as either a benign proliferation or an inflammatory reaction to minimal trauma. It is brown often showing a central zone of fibrosis dermatoscopically [24]."    ),
              Divider(height: 20,endIndent: 13,color: Colors.black,),
              SizedBox(height: 20,),
              buildInformation(
                  text:'Image format',
                  title: "The app accepts images in jpg format."
              ),
              SizedBox(height: 30,),
              buildInformation(
                  text:'Limitations',
                  title: "The Ai brain (model) that powers this app is not skilled enough to consistently assign the highest score to the correct lesion. Also, the model is not very good at detecting melanoma. That said, during testing the correct lesion was regularly among the top three predicted lesions.The model was not trained using photos that were taken with a mobile phone. Therefore, the model's prediction accuracy could be affected by variations in the quality of mobile phone images."
              ),
              SizedBox(height: 30,),
              buildData(
                  text:'Dataset Licence',
                   ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
  Container buildNavigator() {
    return   Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("Lesion Types",style: TextStyle(color:Kpimary,fontSize: 22,fontWeight: FontWeight.bold),),
          SizedBox(height: 12,),
                                      Text('The following descriptions were taken from this',style: TextStyle(color: Colors.black,fontSize:15),),
          GestureDetector(onTap:(){
                                      launch('https://arxiv.org/abs/1803.10417');
                                      } ,child:  Text("research paper.",style: TextStyle(color:Kpimary,fontSize: 15,),)),
                                    ],

      ),
    );
  }
  Container buildData({required String text}) {
    return    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text,style: TextStyle(color:Kpimary,fontSize: 22,fontWeight: FontWeight.bold),),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text("The model was trained using image ",style: TextStyle(color: Colors.black,fontSize:18),),
                    GestureDetector(onTap:(){
                      launch('https://www.kaggle.com/datasets/kmader/skin-cancer-mnist-ham10000');

                    } ,child: Text("data",style: TextStyle(color:Kpimary,fontSize: 18,),)),

                  ],
                ),
              ),
          Text("that was released under a CC BY-NC-SA 4.0 licence. That means that this app cannot be used for commercial purposes.",style: TextStyle(color: Colors.black,fontSize:18),)
              ],

      ),
    );
  }
  Column buildInformation({required String text,required String title}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text,style: TextStyle(color:Kpimary,fontSize: 22,fontWeight: FontWeight.bold),),
          SizedBox(height: 12,),
          Text(title,style: TextStyle(color: Colors.black,fontSize: 18),),

        ],
      );
  }
  Column buildPrediction({required String text,required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(
            color: Colors.black, fontSize: 22),),
        SizedBox(height: 12,),
        Text(title, style: TextStyle(color: Colors.green, fontSize: 18),),

      ],
    );
  }
  Column buildQuestion({required String text,required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(
            color: Colors.black, fontSize: 19),),
        SizedBox(height: 12,),
        Text(title, style: TextStyle(color: Colors.black, fontSize: 15),)
      ],
    );
  }
}

