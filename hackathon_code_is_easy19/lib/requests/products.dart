List<String> category = [
  'Frutas',
  'Verduras',
  'Biscoitos',
  'Bebidas',
  'Limpeza',
];

//Lista de Produtos No Sistema
List<Product> products = [
  Product('000', 'Abacaxi', category[0],
      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fconteudo.imguol.com.br%2Fc%2Fentretenimento%2F04%2F2017%2F12%2F11%2Fabacaxi-1513012505452_v2_1920x1280.jpg&imgrefurl=https%3A%2F%2Fwww.uol.com.br%2Fvivabem%2Fnoticias%2Fredacao%2F2018%2F12%2F01%2Fabacaxi-melhora-a-digestao-e-aumenta-a-imunidade-veja-9-beneficios.htm&tbnid=EXyHlxOm14BTzM&vet=12ahUKEwjyn-D2tJ3tAhXoBbkGHdBTA8YQMygBegUIARDmAQ..i&docid=alcDH9DsqcURYM&w=1920&h=1280&q=abacaxi&ved=2ahUKEwjyn-D2tJ3tAhXoBbkGHdBTA8YQMygBegUIARDmAQ'),
  Product('001', 'Bolacha água e Sal', category[2],
      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fsavegnago.vteximg.com.br%2Farquivos%2Fids%2F265957-375-375%2Ffigura-1frente.jpg%3Fv%3D636131689379070000&imgrefurl=https%3A%2F%2Fwww.savegnago.com.br%2Fbiscoito-salgado-zabet-400g-agua-e-sal%2Fp&tbnid=33gWim3MxPFhzM&vet=12ahUKEwi1jsOvtZ3tAhWdJrkGHVO8B8IQMygAegUIARDmAQ..i&docid=T6u3EyUvaEq03M&w=375&h=375&q=bolaxa%20agua%20e%20sal&ved=2ahUKEwi1jsOvtZ3tAhWdJrkGHVO8B8IQMygAegUIARDmAQ'),
  Product('002', 'Alvejante', category[4],
      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fa-static.mlcdn.com.br%2F1500x1500%2Falvejante-ype-322001-roupas-brancas-2l%2Fmagazineluiza%2F225594700%2Ff51f2a9051ddd293abe155de1e154d44.jpg&imgrefurl=https%3A%2F%2Fwww.magazineluiza.com.br%2Falvejante-ype-322001-roupas-brancas-2l%2Fp%2F225594700%2Fme%2Falve%2F&tbnid=bnt5qU1cbSk2pM&vet=12ahUKEwjryoyKvp3tAhVaG7kGHeQeATkQMygCegUIARDyAQ..i&docid=B4GLIDqmlAkjDM&w=1500&h=1125&q=Alvejante&ved=2ahUKEwjryoyKvp3tAhVaG7kGHeQeATkQMygCegUIARDyAQ'),
  Product('003', 'Alface 300g', category[1],
      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fd26lpennugtm8s.cloudfront.net%2Fstores%2F746%2F397%2Fproducts%2Falface_crespa_verde11-6cdc6c45a50159039e15220193868199-1024-1024.jpg&imgrefurl=https%3A%2F%2Fwww.chicogranjeiro.eco.br%2Fprodutos%2Falface-crespa-verde-unidade%2F&tbnid=zdn8PuP5cDOjLM&vet=12ahUKEwjn5rGnvp3tAhUVLrkGHR1lArcQMygBegUIARDtAQ..i&docid=gvk_oGUaJJn92M&w=1024&h=1024&q=Alface&ved=2ahUKEwjn5rGnvp3tAhUVLrkGHR1lArcQMygBegUIARDtAQ'),
  Product('004', 'Coca-cola 2L', category[3],
      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.distribuidoracaue.com.br%2Fmedia%2Fcatalog%2Fproduct%2Fcache%2F1%2Fthumbnail%2F9df78eab33525d08d6e5fb8d27136e95%2Fr%2Fe%2Frefrigerante-coca-cola-2-litros.jpg%3Fv%3D1&imgrefurl=https%3A%2F%2Fwww.distribuidoracaue.com.br%2Frefrigerante-coca-cola-2-litros-1-unidade-prod.html&tbnid=J8iJva_giNWIQM&vet=12ahUKEwjR_8jZvp3tAhU1MLkGHdglDvIQMygCegUIARC-AQ..i&docid=qs5uR5kQ8OKseM&w=486&h=648&q=Coca%20cola&ved=2ahUKEwjR_8jZvp3tAhU1MLkGHdglDvIQMygCegUIARC-AQ'),
  Product('005', 'Abacate', category[0],
      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fstatic.tuasaude.com%2Fmedia%2Farticle%2Fgl%2Flo%2Fbeneficios-do-abacate_13382_l.jpg&imgrefurl=https%3A%2F%2Fwww.tuasaude.com%2Fbeneficios-do-abacate%2F&tbnid=_qZLc3ygCLTAwM&vet=12ahUKEwj42f3ivp3tAhU1MLkGHdglDvIQMygAegUIARDcAQ..i&docid=EF5_339Pep5rUM&w=640&h=427&q=Abacate&ved=2ahUKEwj42f3ivp3tAhU1MLkGHdglDvIQMygAegUIARDcAQ'),
];

class ProductsRequests {
  List<Product> products;

  List<Product> get() {
    return products;
  }
}

class Product {
  String itemID;
  String item;
  String imageURL;
  String category;

  Product(this.itemID, this.item, this.category, this.imageURL);
}
