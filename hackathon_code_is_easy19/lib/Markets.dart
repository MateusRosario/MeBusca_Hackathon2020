import 'package:flutter/material.dart';
import 'package:MeBusca/Products.dart';

class MarketsPage extends StatefulWidget {
  MarketsPage({
    Key key,
  }) : super(key: key);

  @override
  _MarketsPageState createState() => _MarketsPageState();
}

class _MarketsPageState extends State<MarketsPage> {
  List<String> nomesComercio = <String>[
    'Quarteto',
    'Mercado da dona Joana',
    'Esquina da Quintanda',
    'Mercadinho Tem Tudo',
    'Mercado do seu Joaquim',
    'Extra',
    'Mercado Mateus',
    'Big',
    'Mercadinho da Mara',
    'Atacadão',
    'Alvorada',
  ];

  Widget teste(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Row(
          children: [
            Container(
                child: Image.network(
                    "https://picsum.photos/250?image=" + index.toString())),
            Container(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(nomesComercio[index],
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                Text(
                  "Funcionamento:",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Endereço:",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      //botão de voltar
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 70,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //"mercados"
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                            child: Text("Mercados",
                                style: TextStyle(fontSize: 30)),
                          ),
                        ),
                      ),
                      // descrição
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                            child: Text(
                                "Nesta tela estão listados todos os mercados.",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.grey)),
                          ),
                        ),
                      ),
                      //botão ordenar
                      Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: FlatButton(
                              color: Colors.deepOrange,
                              onPressed: () {},
                              child: Text(
                                "Ordenar",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                      ListView.separated(
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                            Container(height: 0),
                        itemBuilder: (BuildContext context, int index) {
                          return teste(context, index);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    child: Text('Produtos'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductsPage();
                      }));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 40.0,
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      ),
    );
  }
}
