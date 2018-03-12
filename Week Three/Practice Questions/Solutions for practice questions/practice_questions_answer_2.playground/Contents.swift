import Foundation

// Week 3 - Practice Questions

// Answer for question 2

enum Species: String {
    case Cat = "Cat"
    case Dog = "Dog"
    case Mouse = "Mouse"
    
    func animalDescription() -> String {
        return self.rawValue
    }
}

protocol AnimalProtocol {
    var specie: Species { get set }
    func animalDescription() -> String
}


class Animal: AnimalProtocol {
    var specie: Species
    let name: String
    
    init(specie: Species, name: String) {
        self.specie = specie
        self.name = name
    }
    
    func animalDescription() -> String {
        let animalDescription = "My name is " + name + " and I am a " + specie.animalDescription()
        return animalDescription
    }
}


let cat = Animal(specie: Species.Cat, name: "Poncik")
let cat2 = Animal(specie: Species.Cat, name: "Miyav")
let dog = Animal(specie: Species.Dog, name: "Rifki")
let dog2 = Animal(specie: Species.Dog, name: "Fikret")
let mouse = Animal(specie: Species.Mouse, name: "Mickey")

class Zoo {
    var animals: [Animal]
    var cages: [Species:[Animal]]
    
    
    init() {
        self.animals = [Animal]()
        self.cages = [Species:[Animal]]()
    }
    
    func addAnimalToZoo(animal: Animal){
        self.animals.append(animal)
    }
    
    func addMultipleAnimalsToTheZoo(newAnimals: [Animal]){
        for animal in newAnimals {
            self.animals.append(animal)
        }
    }
    
    func sortAnimals(){
        for animal in animals {
            if animal.specie == Species.Cat {
                var dict = cages[Species.Cat] ?? []
                dict.append(animal)
                cages[Species.Cat] = dict
            } else if animal.specie == Species.Dog {
                var dict = cages[Species.Dog] ?? []
                dict.append(animal)
                cages[Species.Dog] = dict
            } else {
                var dict = cages[Species.Mouse] ?? []
                dict.append(animal)
                cages[Species.Mouse] = dict
            }
        }
    }
    
    func showZoo(){
        if cages.count == 0 {
            print("There are no animals in the zoo yet!\n")
        } else {
            for cage in cages {
                print("This is the \(cage.key.animalDescription()) cage and contains:")
                for animal in cage.value {
                    print(animal.animalDescription())
                }
            }
        }
    }
}


let zoo = Zoo()

zoo.addMultipleAnimalsToTheZoo(newAnimals: [cat, cat2, dog, dog2, mouse])

zoo.showZoo()

zoo.sortAnimals()

zoo.showZoo()







