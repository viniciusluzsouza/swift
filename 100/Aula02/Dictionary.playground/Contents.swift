//Declaração de um dicionário

//Dicionário vazio

var dicionarioVazio = [String : String]()
//var dicionarioVazio = Dictionary<String, String>()

//Dicionaro com conteudo inicial
//Tipagem explicita

//var dicionarioComConteudoInicialTipagemExplicita : Dictionary<String, Float> = ["Calabresa" : 61.00, "Frango" : 64.00, "Portuguesa" : 62.50]
var dicionarioComConteudoInicialTipagemExplicita : [String : Float] = ["Calabresa" : 61.00, "Frango" : 64.00, "Portuguesa" : 62.50]
var dicionarioComConteudoInicialTipagemImplicita = ["Pepperoni" : 67.00]


var cardapioPizzariaSwift = ["Calabresa" : 61.00, "Frango" : 64.00, "Portuguesa" : 62.50]

//Adicionando Conteudo
cardapioPizzariaSwift["StarWars"] = 70.0
cardapioPizzariaSwift["Stars"] = 59.0
cardapioPizzariaSwift["Bacon"] = 68.0

print(cardapioPizzariaSwift)

//Substituir conteudo
cardapioPizzariaSwift["Calabresa"] = 62.50
cardapioPizzariaSwift.updateValue(75.0, forKey: "Brasileira")

print(cardapioPizzariaSwift)


//Removendo itens
cardapioPizzariaSwift.removeValue(forKey: "Bacon")
cardapioPizzariaSwift["StarWars"] = nil
print(cardapioPizzariaSwift)

//var meuArrayDeDicionarios : [[String : Int]] = []


