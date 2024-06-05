// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _enderecoController =
      TextEditingController(text: "Rua Exemplo, 123");
  final TextEditingController _estadoController =
      TextEditingController(text: "SP");
  final TextEditingController _senhaAtualController = TextEditingController();
  final TextEditingController _novaSenhaController = TextEditingController();
  final TextEditingController _novaSenhaConfirmacaoController =
      TextEditingController();

  Future<void> sendDataToAPI() async {
    try {
      var url = Uri.parse('URL');
      var dados = {
        'cep': _cepController.text,
        'endereco': _enderecoController.text,
        'estado': _estadoController.text,
        'senhaAtual': _senhaAtualController.text,
        'novaSenha': _novaSenhaController.text,
        'novaSenhaConfirmacao': _novaSenhaConfirmacaoController.text,
      };

      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(dados),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Configuração salva com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao salvar configurações.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro na requisição: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(105, 37, 190, 1),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(105, 37, 190, 1),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Alterar Endereço',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Color.fromRGBO(105, 37, 190, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildLabel('CEP'),
                      _buildTextField(_cepController, editable: true),
                      const SizedBox(height: 16),
                      _buildLabel('Endereço'),
                      _buildTextField(_enderecoController, editable: false),
                      const SizedBox(height: 16),
                      _buildLabel('Estado'),
                      _buildTextField(_estadoController, editable: false),
                      const SizedBox(height: 32),
                      const Text(
                        'Alterar Senha',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Color.fromRGBO(105, 37, 190, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildLabel('Senha Atual'),
                      _buildTextField(_senhaAtualController, obscureText: true),
                      const SizedBox(height: 16),
                      _buildLabel('Nova Senha'),
                      _buildTextField(_novaSenhaController, obscureText: true),
                      const SizedBox(height: 16),
                      _buildLabel('Confirmar Nova Senha'),
                      _buildTextField(_novaSenhaConfirmacaoController,
                          obscureText: true),
                      const SizedBox(height: 42),
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(105, 37, 190, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Salvar',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Color.fromRGBO(105, 37, 190, 1),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller,
      {bool editable = true, bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        fillColor: Color.fromRGBO(211, 211, 211, 1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(fontFamily: 'Poppins'),
      readOnly: !editable,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, preencha este campo';
        }
        return null;
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      sendDataToAPI();
    }
  }
}
