import 'package:flutter/cupertino.dart';
import 'package:MeBusca/requests/products.dart';
import 'package:MeBusca/root.dart';
import 'package:flutter/material.dart';
import 'package:MeBusca/kart.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({
    Key key,
  }) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  //Nome para ser exibido na caixa de seleção quando nenhum item esta selecionado
  String valorPadraoOrdenar = 'Ordenar', valorPadraoFiltrar = 'Filtrar';

  Widget listTile(
      BuildContext context, String nome, String imagemURL, String categoria) {
    return Container(
        height: 100,
        child: Card(
          color: AppRoot.getColor(context, 'third'),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                  child: Container(
                      width: 120,
                      height: 120,
                      child: Image.network(
                        imagemURL,
                        fit: BoxFit.fitHeight,
                        loadingBuilder: (BuildContext context, Widget widget,
                            loadingProgress) {
                          Color color = AppRoot.getColor(context, 'iconColor');
                          if (loadingProgress == null) {
                            return widget;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                                valueColor:
                                    new AlwaysStoppedAnimation<Color>(color),
                              ),
                            );
                          }
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10))),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          nome,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        'Tipo: ' + categoria,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.left,
                      ))
                    ],
                  )),
              Expanded(
                child: Container(),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Quantidade'),
                              );
                            });
                      },
                      child: Icon(
                        (Icons.add_circle),
                        size: 40,
                        color: Colors.white,
                      )))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = AppRoot.of(context).productsRequests.get();
    Iterable<Widget> productList = products.map((product) =>
        listTile(context, product.item, product.imageURL, product.category));
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          ListView(
            children: [
              //Parte superior da tela, com informações básicas sobre os itens mostrados
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Text(
                  'Produtos',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Text(
                  'Produtos disponíveis no mercado:',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                child: Row(
                  children: [
                    //Botões para controlar a ordem e filtragem dos produtos
                    DropdownButton<String>(
                      value: valorPadraoOrdenar,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppRoot.getColor(context, 'fifth'),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style:
                          TextStyle(color: AppRoot.getColor(context, 'fifth')),
                      underline: Container(
                        height: 2,
                        color: AppRoot.getColor(context, 'fifth'),
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          valorPadraoOrdenar = newValue;
                        });
                      },
                      items: <String>['Ordenar', 'Nome', 'Tipo']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    VerticalDivider(),
                    DropdownButton<String>(
                      value: valorPadraoFiltrar,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppRoot.getColor(context, 'fifth'),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style:
                          TextStyle(color: AppRoot.getColor(context, 'fifth')),
                      underline: Container(
                        height: 2,
                        color: AppRoot.getColor(context, 'fifth'),
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          valorPadraoFiltrar = newValue;
                        });
                      },
                      items: <String>['Filtrar', 'Nome', 'Tipo']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),

              //Lista com os produtos a serem exibidos
              Column(
                children: productList.toList(),
              ),
              Container(height: 50)
            ],
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.shop,
        ),
        backgroundColor: AppRoot.getColor(context, 'fifth'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return KartPage();
          }));
        },
      ),
    );
  }
}
