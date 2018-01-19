//Desafio Cardapio


var pizza01 = (nome: "4 Queijos", calorias: 265, preco : 39.90, fatias: 16)

var pizza02 = (nome: "Calabresa", calorias: 300, preco : 42.0, fatias: 10)

var pizza03 = (nome: "Portuguesa", calorias: 200, preco : 35.0, fatias: 8)

var pizza04 = (nome: "Bacon", calorias: 100, preco : 40.0, fatias: 1)

var pizza05 = (nome: "Meat & Bacon", calorias: 2000, preco : 68.0, fatias: 8)


var arrayDePizzas = [pizza01, pizza02, pizza03, pizza04, pizza05]














var indicePizzaSelecionada = 2


















var pizzaSelecionada = arrayDePizzas[indicePizzaSelecionada]

print("A pizza \(pizzaSelecionada.nome), tem \(pizzaSelecionada.fatias), com um total de \(pizzaSelecionada.calorias) e custa \(pizzaSelecionada.preco) reais")

