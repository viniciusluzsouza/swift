/*
 
 Tuplas
 
 Uma tupla é um repositorio que consegue agrupar multiplos valores. Os valores contidos em uma tupla podem ter qualquer tipagem, ou seja, o tipo de um elemento  não necessáriamente precisa ser o mesmo tipo de outro.
 
 */

//Criando uma tupla

var tupla = (5, true, 3.14, "Cachorro", [1, 2, 3, 4, 5])
print(tupla)
print("\n\n")

//Decompondo uma tupla
var (inteiro, boleano, pi, animalzinho, arrayDeNumeros) = tupla

print(inteiro)
print(boleano)
print(pi)
print(animalzinho)
print(arrayDeNumeros)


//Decompondo valores especificos
var(_, _, valorQueEuQuero, _, arrayInteiros) = tupla

print(arrayDeNumeros)

//Acessando valores de forma independente
print(tupla.3)
print(tupla.4)

//Nomeando os valores em uma tupla
var pizza = (sabor : "Bacon", valor : 49.00, calorias : 600, quantidadeDeFatias : 8, bordaRecheada: true)

print("A pizza de \(pizza.sabor) custa \(pizza.valor) reais, terá borda recheada \(pizza.bordaRecheada) e tem apenas \(pizza.calorias) calorias ... isso é saude!")

pizza.sabor = "Bacon duplo + Bacon extra"
print(pizza)








