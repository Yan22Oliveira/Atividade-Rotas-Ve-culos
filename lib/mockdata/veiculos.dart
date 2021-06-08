import '../models/models.dart';

const listaVeiculos = [

  Veiculo(id: 1,idMontadora: 1,nome: "Gol",valor: 40000,imagem: "https://intencao.vw.com.br/wp-content/uploads/2020/09/Gol_1_6__3_4_frente_551x301px.png"),
  Veiculo(id: 2,idMontadora: 1,nome: "Voyage",valor: 50000,imagem: "https://intencao.vw.com.br/wp-content/uploads/2020/09/Voyage_1_6__3_4_frente_551x301px.png"),
  Veiculo(id: 3,idMontadora: 1,nome: "Fox",valor: 60000,imagem: "https://intencao.vw.com.br/wp-content/uploads/2020/09/fox-xtreme-1-6.png"),
  Veiculo(id: 4,idMontadora: 1,nome: "Polo",valor: 70000,imagem: "https://intencao.vw.com.br/wp-content/uploads/2020/09/Polo_2_0_TSI_Highline_Preto__3_4_Frente_551x301px.png"),
  Veiculo(id: 5,idMontadora: 1,nome: "Amarok",valor: 80000,imagem: "https://intencao.vw.com.br/wp-content/uploads/2020/09/amarok-v6-extreme.png"),

  Veiculo(id: 1,idMontadora: 2,nome: "Mobi",valor: 40000,imagem: "https://mobi.fiat.com.br/assets/360/nav/easy.png"),
  Veiculo(id: 2,idMontadora: 2,nome: "Argo",valor: 50000,imagem: "https://argo.fiat.com.br/assets/360/nav/drive13.webp"),
  Veiculo(id: 3,idMontadora: 2,nome: "Cronos",valor: 60000,imagem: "https://cronos.fiat.com.br/static/folds/4/desk/thumbs/02-drive-mt.webp"),
  Veiculo(id: 4,idMontadora: 2,nome: "Toro",valor: 70000,imagem: "https://toro.fiat.com.br/static/media/toroUltra.9aca7f15.png"),
  Veiculo(id: 5,idMontadora: 2,nome: "Doblo",valor: 80000,imagem: "https://doblo.fiat.com.br/content/dam/fiat/products/119/6gd/1/2021/page/hero-png/hero-806.png"),

  Veiculo(id: 1,idMontadora: 3,nome: "Ranger",valor: 40000,imagem: "https://www.ford.com.br/content/ford/br/pt_br/site-wide-content/media-carousels/showroom/_jcr_content/par/mediacarouselitem_1575839931/image.imgs.full.high.jpg/1620137999130.jpg"),
  Veiculo(id: 2,idMontadora: 3,nome: "Territory",valor: 50000,imagem: "https://www.ford.com.br/content/ford/br/pt_br/site-wide-content/media-carousels/showroom/_jcr_content/par/mediacarouselitem_406256454/image.imgs.full.high.png/1620138024504.png"),
  Veiculo(id: 3,idMontadora: 3,nome: "Bronco Sport",valor: 60000,imagem: "https://www.ford.com.br/content/ford/br/pt_br/site-wide-content/media-carousels/showroom/_jcr_content/par/mediacarouselitem_38717309/image.imgs.full.high.jpg/1620754954007.jpg"),
  Veiculo(id: 4,idMontadora: 3,nome: "Edge ST",valor: 70000,imagem: "https://www.ford.com.br/content/ford/br/pt_br/site-wide-content/media-carousels/showroom/_jcr_content/par/mediacarouselitem_1172068228/image.imgs.full.high.png/1620138051502.png"),
  Veiculo(id: 5,idMontadora: 3,nome: "Mustang Mach 1",valor: 80000,imagem: "https://www.ford.com.br/content/ford/br/pt_br/site-wide-content/media-carousels/showroom/_jcr_content/par/mediacarouselitem/image.imgs.full.high.jpg/1620163710118.jpg"),

  Veiculo(id: 1,idMontadora: 4,nome: "Peugeot 208",valor: 10000,imagem: "https://media.peugeot.com.br/image/32/1/208-430x320px.740453.6.761321.6.png"),
  Veiculo(id: 2,idMontadora: 4,nome: "Peugeot 2008",valor: 20000,imagem: "https://media.peugeot.com.br/image/13/3/2008.628133.6.png"),
  Veiculo(id: 3,idMontadora: 4,nome: "Peugeot 3008",valor: 30000,imagem: "https://media.peugeot.com.br/image/89/4/3008.627894.6.png"),
  Veiculo(id: 4,idMontadora: 4,nome: "Peugeot 5008",valor: 40000,imagem: "https://media.peugeot.com.br/image/89/6/5008.627896.6.png"),
  Veiculo(id: 5,idMontadora: 4,nome: "Partber",valor: 50000,imagem: "https://media.peugeot.com.br/image/49/0/partner.626490.6.png"),

  Veiculo(id: 1,idMontadora: 5,nome: "KWID",valor: 15000,imagem: "https://www.renault.com.br/agg/vn/unique/ONE_DACIA_PP_LARGE_DENSITY1/r_brandSite_carPicker_1.png?uri=https%3A%2F%2Fbr.co.rplug.renault.com%2Fproduct%2Fmodel%2FBB1%2Fkwid%2Fc%2FA-ENS_0MDL2P1SERIELIM4_-OV369"),
  Veiculo(id: 2,idMontadora: 5,nome: "Sandero",valor: 30000,imagem: "https://www.renault.com.br/agg/vn/unique/ONE_CF_DACIA_NEQ_DENSITY1_LARGE/r_brandSite_carPicker_1.png?uri=https%3A%2F%2Fbr.co.rplug.renault.com%2Fproduct%2Fmodel%2FB4M%2Fsandero%2Fc%2FA-ENS_0MDL2P1SERIELIM1_-TERQH"),
  Veiculo(id: 3,idMontadora: 5,nome: "Stepway",valor: 45000,imagem: "https://www.renault.com.br/agg/vn/unique/ONE_CF_DACIA_NEQ_DENSITY1_LARGE/r_brandSite_carPicker_1.png?uri=https%3A%2F%2Fbr.co.rplug.renault.com%2Fproduct%2Fmodel%2FB4M%2Fnovo-sandero%2Fc%2FA-TEHNP-ENS_0MDL2PSL1SERIELIM1_-TEHNP"),
  Veiculo(id: 4,idMontadora: 5,nome: "R.S e GT Line",valor: 60000,imagem: "https://www.renault.com.br/agg/vn/unique/ONE_DACIA_PP_LARGE_DENSITY1/r_brandSite_carPicker_1.png?uri=https%3A%2F%2Fbr.co.rplug.renault.com%2Fproduct%2Fmodel%2FB4M%2Fsandero%2Fc%2FA-ENS_0MDL2PSP1SERIELIM2_-TEB76"),
  Veiculo(id: 5,idMontadora: 5,nome: "Logan",valor: 75000,imagem: "https://www.renault.com.br/agg/vn/unique/ONE_DACIA_PP_LARGE_DENSITY1/r_brandSite_carPicker_1.png?uri=https%3A%2F%2Fbr.co.rplug.renault.com%2Fproduct%2Fmodel%2FL4M%2Flogan%2Fc%2FA-ENS_0MDL2P1SERIELIM3_-TEKNG"),

  Veiculo(id: 1,idMontadora: 6,nome: "Jeep Trailhawk",valor: 40000,imagem: "https://renegade.jeep.com.br/static/media/jeepRed.efc8a1ec.png"),
  Veiculo(id: 2,idMontadora: 6,nome: "Jeep Compass Sport T270",valor: 80000,imagem: "https://compass.jeep.com.br/static/media/1@2x.296bb152.png"),
  Veiculo(id: 3,idMontadora: 6,nome: "Jeep Moab",valor: 50000,imagem: "https://renegade.jeep.com.br/static/media/moab.ae59e011.png"),
  Veiculo(id: 4,idMontadora: 6,nome: "Jeep Compass Limited T270",valor: 100000,imagem: "https://compass.jeep.com.br/static/media/1@2x.0662c0e2.png"),
  Veiculo(id: 5,idMontadora: 6,nome: "Jeep Sport",valor: 60000,imagem: "https://renegade.jeep.com.br/static/media/sport.a50d3ab0.png"),

];