  import 'dart:convert';
  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'package:flutter/services.dart';
  import 'package:astolphus/utils/global.controller.dart';

  class AddPet extends StatefulWidget {
    const AddPet({super.key});

    @override
    // ignore: library_private_types_in_public_api
    _AddPetState createState() => _AddPetState();
  }

  class _AddPetState extends State<AddPet> {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _petNameController = TextEditingController();
    final TextEditingController _petRangeController = TextEditingController();
    String _selectedPetType = 'Cachorro'; // Valor padrão do dropdown
    String ownerId = GlobalController.instance.getOwnerId();

    Future<void> sendDataToAPI() async {
      try {
        final response = await http.post(
          Uri.parse('https://flasktest-f17y.onrender.com/cadastroPet'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'Nome_pet': _petNameController.text,
            'Raio_seguranca': _petRangeController.text,
            'Animal': _selectedPetType,
            'idDono': ownerId,
          }),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Perfil salvo com sucesso!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro ao salvar perfil.')),
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
            'Adicionar Pet',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Nome do Pet'),
                    _buildTextField(_petNameController),
                    const SizedBox(height: 16),
                    _buildLabel('Tipo de Pet'),
                    _buildPetTypeDropdown(),
                    const SizedBox(height: 16),
                    _buildLabel('Raio de segurança do Pet'),
                    _buildNumericTextField(_petRangeController),
                    const SizedBox(height: 42),
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(105, 37, 190, 1),
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
                            color: Colors.white),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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

    Widget _buildTextField(TextEditingController controller) {
      return TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          fillColor: Color.fromRGBO(211, 211, 211, 1),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none),
        ),
        style: const TextStyle(fontFamily: 'Poppins'),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor, preencha este campo';
          }
          return null;
        },
      );
    }

    Widget _buildNumericTextField(TextEditingController controller) {
      return TextFormField(
        controller: controller,
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor, preencha este campo';
          }
          return null;
        },
        keyboardType: TextInputType.number, // Define o tipo de teclado para numérico
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Permite apenas números
        ],
      );
    }

    Widget _buildPetTypeDropdown() {
      return DropdownButtonFormField<String>(
        value: _selectedPetType,
        onChanged: (newValue) {
          setState(() {
            _selectedPetType = newValue!;
          });
        },
        items: <String>['Cachorro', 'Gato', 'Gado', 'Macaco', 'Outros']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                  fontFamily: 'Poppins', color: Color.fromRGBO(105, 37, 190, 1)),
            ),
          );
        }).toList(),
        decoration: const InputDecoration(
          fillColor: Color.fromRGBO(211, 211, 211, 1),
          filled: true,
          border: OutlineInputBorder(
            // Usando OutlineInputBorder para cantos arredondados
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)), // Definindo o raio dos cantos
            borderSide: BorderSide.none, // Removendo a borda do campo
          ),
        ),
      );
    }

    void _submitForm() {
      if (_formKey.currentState!.validate()) {
        // Coloque aqui a lógica para salvar os dados
        sendDataToAPI();
      }
    }
  }
