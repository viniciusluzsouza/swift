var pizzas = [1 : "4 Queijos", 2 : "Calabresa", 3 : "Portuguesa", 4 : "Bacon", 5 : "Meat & Bacon"]
var atributos_pizza01 = (calorias: 265, preco: 39.90, fatias: 16)
var atributos_pizza02 = (calorias: 300, preco: 42.0, fatias: 10)
var atributos_pizza03 = (calorias: 200, preco: 35.0, fatias: 8)
var atributos_pizza04 = (calorias: 100, preco: 40.0, fatias: 1)
var atributos_pizza05 = (calorias: 2000, preco: 68.0, fatias: 8)
var atributos = ["4 Queijos" : atributos_pizza01, "Calabresa" : atributos_pizza02, "Portuguesa" : atributos_pizza03, "Bacon" : atributos_pizza04, "Meat & Bacon" : atributos_pizza05]

var pizzaSelecionada = 3


var selecionada = pizzas[pizzaSelecionada]!

print("A pizza \(selecionada), tem \(atributos[selecionada]!.calorias), com um total de \(atributos[selecionada]!.preco) e custa \(atributos[selecionada]!.fatias) reais")
