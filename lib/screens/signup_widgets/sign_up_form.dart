import 'package:flutter/material.dart';
import 'package:flutter_finey/model/user.dart';

import '../common_widgets/responsive_padding.dart';
import '../../styles/common_styles.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm(this._nomeController,this._emailController,this._cpfController
            ,this._senhaController,this._repetirSenhaController);

  final TextEditingController _nomeController;
  final TextEditingController _emailController;
  final TextEditingController _cpfController;
  final TextEditingController _senhaController;
  final TextEditingController _repetirSenhaController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Form(
            // key: key, 
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ResponsivePadding(
                      padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 24.0),
                      child: TextFormField(
                          controller: _nomeController,
                          decoration: InputDecoration(
                              fillColor: Colors.red,
                              labelText: 'Nome & Sobrenome',
                              labelStyle: CommonStyles(context: context).getLabelText()
                          )
                      )
                  ),
                  ResponsivePadding(
                      padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 24.0),
                      child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              fillColor: Colors.red,
                              labelText: 'E-mail',
                              labelStyle: CommonStyles(context: context).getLabelText()
                          )
                      )
                  ),
                  ResponsivePadding(
                      padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 24.0),
                      child: TextFormField(
                          controller: _cpfController,
                          decoration: InputDecoration(
                              fillColor: Colors.red,
                              labelText: 'CPF',
                              labelStyle: CommonStyles(context: context).getLabelText()
                          )
                      )
                  ),
                  ResponsivePadding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 25.0),
                    child: TextFormField(
                        controller: _senhaController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: CommonStyles(context: context).getLabelText()
                      )
                    )
                  ),
                  ResponsivePadding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: TextFormField(
                        controller: _repetirSenhaController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Repetir Senha',
                        labelStyle: CommonStyles(context: context).getLabelText()
                      )
                    )
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}