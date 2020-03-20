import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finey/config/application.dart';
import 'package:flutter_finey/config/routes.dart';
import 'package:flutter_finey/model/documentacao.dart';
import 'package:flutter_finey/model/user.dart';
import 'package:flutter_finey/screens/ativacao_screen.dart';
import 'package:flutter_finey/screens/profile_less_widgets/active_account_doc.dart';
import 'package:flutter_finey/service/auth.dart';
import 'package:flutter_finey/util/dialog.dart';
import 'package:image_picker/image_picker.dart';

// import '../config/application.dart';
// import '../config/routes.dart';
import './common_widgets/responsive_padding.dart';
import './common_widgets/category_item.dart';
import './profile_less_widgets/profile_less_header.dart';
import './profile_less_widgets/filter_bar.dart';
import './home_widgets/home_detail_button.dart';
import '../styles/common_variables.dart';
import '../styles/common_styles.dart';
import '../styles/common_colors.dart';
import 'common_widgets/finey_header.dart';
import 'common_widgets/title.dart';
import 'dados_bancarios_screen.dart';
import 'forgot_password_widgets/active_account.dart';

class DocumentosScreen extends StatefulWidget {
  DocumentosScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DocumentosScreenState createState() => new _DocumentosScreenState();
}

class _DocumentosScreenState extends State<DocumentosScreen> {

  File _image;
  File _imageSelf;
  File _imageResd;
  String _email;

  String urlSelf;
  String urlIdent;
  String urlResid;

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    _email = Auth.user.email;
  }

  Future getImageFromCam() async { // for camera
    var image = await ImagePicker.pickImage(source: ImageSource.camera,imageQuality: 80, maxHeight:  700 , maxWidth: 700);
    setState(() {
      _image = image;

    });

    uploadDocIdent(context);
  }

  Future getImageFromCamSelf() async { // for camera
    var image = await ImagePicker.pickImage(source: ImageSource.camera,imageQuality: 80, maxHeight:  700 , maxWidth: 700);
    setState(() {
      _imageSelf = image;

    });

    uploadDocSelf(context);
  }

  Future getImageFromCamResd() async { // for camera
    var image = await ImagePicker.pickImage(source: ImageSource.camera,imageQuality: 80, maxHeight:  700 , maxWidth: 700);
    setState(() {
      _imageResd = image;
      uploadDocResid(context);
    });
  }

  Future getImageFromGallery() async {// for gallery
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future uploadDocIdent(BuildContext context) async{
    String fileName = "documento_identificacao";

    Dialogs.showLoadingDialog(context, _keyLoader);

    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(_email+"/documentacao/"+fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    urlIdent = await (await uploadTask.onComplete).ref.getDownloadURL();

    Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
  }


  Future uploadDocSelf(BuildContext context) async{
    String fileNameSelf = "documento_self";

    Dialogs.showLoadingDialog(context, _keyLoader);

    StorageReference firebaseStorageRefSelf = FirebaseStorage.instance.ref().child(_email+"/documentacao/"+fileNameSelf);
    StorageUploadTask uploadTaskSelf = firebaseStorageRefSelf.putFile(_imageSelf);
    urlSelf = await (await uploadTaskSelf.onComplete).ref.getDownloadURL();

    Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
  }

  Future uploadDocResid(BuildContext context) async{
    String fileNameResid = "documento_residencia";

    Dialogs.showLoadingDialog(context, _keyLoader);

    StorageReference firebaseStorageRefResid = FirebaseStorage.instance.ref().child(_email+"/documentacao/"+fileNameResid);
    StorageUploadTask uploadTaskResd = firebaseStorageRefResid.putFile(_imageResd);
    urlResid = await (await uploadTaskResd.onComplete).ref.getDownloadURL();

    Documentacao documentacao = new Documentacao(urlDocIdentificacao: urlIdent,urlDocResidencia: urlResid,urlDocSelf: urlSelf);
    Auth.addDocumentacao(documentacao);

    Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();

  }

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    double deviceHeight = MediaQuery.of(context).size.height;

    var column = new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FineyHeader(
              leftImageIconButton: "images/icons/ic_back.png",
              leftImageIconButtonWidth: 24.0,
              leftImageIconButtonHeight: 17.0,
              onPressLeftButton: () {
                Application.router.navigateTo(context, RouteConstants.ROUTE_LOGIN,transition: TransitionType.fadeIn);
              }
          ),
          new Container(
              height: deviceHeight - CommonVariables(context: context).getAppBarHeight() - CommonVariables(context: context).getScreenPaddingBottom(),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TitleWidget(
                              text: 'Ativação da Conta',
                              paddingTop: 30.0,
                              paddingLeft: 40.0,
                              paddingRight: 40.0,
                              paddingBottom: 0.0
                          ),

                          ResponsivePadding(
                              padding: const EdgeInsets.only(right: 40.0, left: 40.0, bottom: 20.0),
                              child: Container(
                                child: Text('Envie os seguintes documentos.' ,
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.indigo,
                                        fontSize: 24
                                    )),
                              ),

                          ),


                          ResponsivePadding(
                              padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
                              child: ActiveAccountDoc(
                                  labelText: "Documento de identificação",
                                  value: "RG,Habilitação,Passaporte",
                                  icon: "images/icons/ic_debit_card.png",
                                  iconWidth: 40.0,
                                  iconHeight: 40.0,
                                  image: "urlDocIdentificacao",
                                  photo: _image == null ? null : _image,
                                  onPressItem: (){
                                    getImageFromCam();
                                  }

                              ),
                          ),

                          ResponsivePadding(
                              padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
                              child: ActiveAccountDoc(
                                  labelText: "Self com documento",
                                  value: "RG,Habilitação,Passaporte",
                                  icon: "images/icons/ic_faceid.png",
                                  iconWidth: 40.0,
                                  iconHeight: 40.0,
                                  image: "urlDocSelf",
                                  photo: _imageSelf == null ? null : _imageSelf,
                                  onPressItem: (){
                                    getImageFromCamSelf();
                                  }
                              )
                          ),

                          ResponsivePadding(
                              padding: const EdgeInsets.symmetric(horizontal: 40.0),
                              child: ActiveAccountDoc(
                                  labelText: "Comprovante de residência",
                                  value: "Ex:Conta de Luz",
                                  icon: "images/icons/ic_location.png",
                                  iconWidth: 40.0,
                                  iconHeight: 40.0,
                                  image: "urlDocResidencia",
                                  photo: _imageResd == null ? null : _imageResd,
                                  onPressItem: (){
                                    getImageFromCamResd();
                                  }
                              )
                          )
                        ]
                    ),
                    ResponsivePadding(
                        padding: const EdgeInsets.only(bottom: 30.0)
                    ),


                    ResponsivePadding(
                      padding: const EdgeInsets.only(bottom: 150.0),
                      child: Center(
                        child:    FloatingActionButton.extended(
                            heroTag: "btEnviarDocumentos",
                            label: Text("Enviar Documentos"),
                            backgroundColor: Colors.indigo,
                            icon: const Icon(Icons.assignment),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DadosBancariosScreen(),
                                ),
                              );
                            }),
                      ),


                    ),
                  ]
              ),
          )
        ]
    );

    var constrainedBox = new ConstrainedBox(
        constraints: constraints.copyWith(
            maxHeight: MediaQuery.of(context).size.height
        ),
        child: new Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: CommonVariables(context: context).getScreenPaddingBottom()),
            child: column
        )
    );

    var scrollView = new SingleChildScrollView(
        child: constrainedBox
    );

    return scrollView;
  }

  @override
  Widget build(BuildContext context) {
    var layoutBuilder = new LayoutBuilder(
      builder: _buildWithConstraints,
    );

    var scaffold = new Scaffold(
      body: layoutBuilder,
    );

    return scaffold;
  }
}