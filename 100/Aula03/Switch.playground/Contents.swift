//: Playground - noun: a place wh


/*
var letra = "A"

switch letra.lowercased() {
    
case "a", "e", "i", "o", "u":
    print("É vogal")

default:
    print("E consoante")
    
}
*/

var idade = 16
var dinheiro = true

switch(idade >= 18, dinheiro) {
case(true, true):
    print("ok, pode ter carteira")
    
case(false, true):
    print("volte daqui a \(18 - idade) anos")
    
case(true, false):
    print("arrume dinheiro")
    
default:
    print("cresca e tenha dinheiro")
    
}
