
// Declarando um Array

//var arrayVazio = [String]()
//var arrayVazio : Array<String> = []

//Array com conteudo

var arrayComConteudoInicialeTipagemExplicita : [String] = ["Valor1", "Valor2", "Valor3", "Qualquer outro valor"]

//Array com tipagem implicita

var arrayComConteudoInicialeTipagemImplicita = ["Primeiro valor", "Segundo valor"]

print(arrayComConteudoInicialeTipagemExplicita)
print(arrayComConteudoInicialeTipagemImplicita)

//Adicionando valores no array
// # Com Append

arrayComConteudoInicialeTipagemImplicita.append("Abacaxi")
print(arrayComConteudoInicialeTipagemImplicita)

// # Sem Append
arrayComConteudoInicialeTipagemImplicita += ["Morango", "Uva"]
print(arrayComConteudoInicialeTipagemImplicita)

var cestaDeFrutas = ["🍓", "🍌", "🍇", "🍅", "🍑"]
cestaDeFrutas.insert("🍍", at: 2)
cestaDeFrutas.insert("🥝", at: 0)
print(cestaDeFrutas)

//Remocao de itens

//Removendo ultimo
cestaDeFrutas.removeLast()
cestaDeFrutas.removeLast()

print(cestaDeFrutas)

//Removendo item baseado em indice especifico
cestaDeFrutas.remove(at: 4)
print(cestaDeFrutas)


//Recuperar Itens

//recuperando o ultimo item
print(cestaDeFrutas.last)

//recuperando o primeiro
print(cestaDeFrutas.first)

//recuperando indice especifico
print(cestaDeFrutas[0])

//substituir indice
cestaDeFrutas[0] = "🍅"

print(cestaDeFrutas)
print(cestaDeFrutas.count)




