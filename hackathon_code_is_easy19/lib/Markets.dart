import 'package:MeBusca/requests/markets.dart';
import 'package:MeBusca/root.dart';
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
  String valorPadraoOrdenar = 'Ordenar', valorPadraoFiltrar = 'Filtrar';

  Widget listTile(BuildContext context, String nome, String imageURL) {
    print(imageURL);
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Container(
          decoration: BoxDecoration(
              color: AppRoot.getColor(context, 'second'),
              borderRadius: BorderRadius.circular(20)),
          height: 120,
          child: Row(
            children: [
              ClipRRect(
                child: Container(
                  width: 120,
                  height: 120,
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.fitHeight,
                  ),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              Container(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(nome,
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
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductsPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Market> markets = AppRoot.of(context).marketsRequests.get();
    Iterable<Widget> marketsList = markets
        .map((market) => listTile(context, market.name, market.imageURL));
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
                      //botão de retornar
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 45,
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
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: Row(
                          children: [
                            //Botões para controlar a ordem e filtragem dos produtos
                            Align(
                              alignment: Alignment.centerRight,
                              child: DropdownButton<String>(
                                icon: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.deepOrange,
                                ),
                                value: valorPadraoOrdenar,
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.deepOrange),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepOrange,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    valorPadraoOrdenar = newValue;
                                  });
                                },
                                items: <String>[
                                  'Ordenar',
                                  'Nome A-Z',
                                  'Nome Z-A',
                                  'Mais próximos'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )
                          ],
                        ),
                      ),

                      Column(
                        children: marketsList.toList(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
