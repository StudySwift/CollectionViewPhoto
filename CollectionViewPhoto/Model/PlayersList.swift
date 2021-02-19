//
//  PlayersList.swift
//  CollectionViewPhoto
//
//  Created by Yurik Nosachenko on 13.02.2021.
//

import UIKit

class PlayersList{
    private var playerList: [Player] = [Player(name: "Роберт", surName: "Левандовски", club: "Бавария Мюнхен", position: "Нападающий", photo: "levandovski"),
                                        Player(name: "Оливер", surName: "Кан", club: "Бавария Мюнхен", position: "Вратарь", photo: "kan"),
                                        Player(name: "Лотар", surName: "Маттеус", club: "Бавария Мюнхен", position: "Защитник", photo: "mateus"),
                                        Player(name: "Герд", surName: "Мюллер", club: "Бавария Мюнхен", position: "Нападающий", photo: "muler"),
                                        Player(name: "Франц", surName: "Беккенбауэр", club: "Бавария Мюнхен", position: "Защитник", photo: "bakenbauer"),
                                        Player(name: "Луиш", surName: "Фигу", club: "Барселона", position: "Полузащитник", photo: "figo"),
                                        Player(name: "Луис Назарио", surName: "Роналдо", club: "Барселона", position: "Нападающий", photo: "ronaldo"),
                                        Player(name: "Хосеп", surName: "Гвардиола", club: "Барселона", position: "Защитник", photo: "gvardiola"),
                                        Player(name: "Диего Армандо", surName: "Марадонна", club: "Барселона", position: "Нападающий", photo: "maradona"),
                                        Player(name: "Христо", surName: "Стоичков", club: "Барселона", position: "Нападающий", photo: "stoichkov"),
                                        Player(name: "Лионель", surName: "Месси", club: "Барселона", position: "Нападающий", photo: "messi"),
                                        Player(name: "Яри", surName: "Литманен", club: "Аякс", position: "Нападающий", photo: "litmanen"),
                                        Player(name: "Патрик", surName: "Клюйверт", club: "Аякс", position: "Нападающий", photo: "Kljujvert"),
                                        Player(name: "Марко", surName: "ван Бастен", club: "Аякс", position: "Нападающий", photo: "vanBasten"),
                                        Player(name: "Йохан", surName: "Кройф", club: "Аякс", position: "Нападающий", photo: "cruyff"),
                                        Player(name: "Эдвин", surName: "ван Дер Сар", club: "Аякс", position: "Вратарь", photo: "Edvin"),
                                        Player(name: "Сергей", surName: "Ребров", club: "Динамо Киев", position: "Нападающий", photo: "rebrov"),
                                        Player(name: "Андрей", surName: "Шевченко", club: "Динамо Киев", position: "Нападающий", photo: "sheva"),
                                        Player(name: "Александр", surName: "Шовковский", club: "Динамо Киев", position: "Вратпрь", photo: "shovk"),
                                        Player(name: "Олег", surName: "Лужный", club: "Динамо Киев", position: "Защитник", photo: "luzhnyy"),
                                        Player(name: "Александр", surName: "Заваров", club: "Динамо Киев", position: "Полузащитник", photo: "zavarov"),
                                        Player(name: "Валерий", surName: "Лобановский", club: "Динамо Киев", position: "Нападающий", photo: "loban"),
                                        Player(name: "Олег", surName: "Блохин", club: "Динамо Киев", position: "Нападающий", photo: "blokhin")]
    
    private var arrayForSection:[String] = ["Динамо Киев", "Аякс", "Барселона", "Бавария Мюнхен"]
    
    //количество секций
    var sectionCount: Int{
        return arrayForSection.count
    }
    
    //количество всех элементов основного списка
    var count: Int {
        return playerList.count
    }
    
    //метод возвращения нужного элемента нужной секции
    func forCell (index: IndexPath) -> Player {
        var needPlayers: [Player] = [] //новый массив элементов для секции
        for el in playerList{
            if el.club == arrayForSection[index.section]{
                needPlayers.append(el)
            }
        }
        let player = needPlayers[index.item]
        return player
    }
    
    //метод возвращения количества элементов в секции
    func countInSection (_ index: Int) -> Int{
        var count = 0
        if index > arrayForSection.count-1{
            return 0
        }else{
            for el in playerList{
                if el.club == arrayForSection[index]{
                    count += 1
                }
            }
            return count
        }
    }
    
    //метод отображения названия секции
    func titleForSectionAtIndexPath(_ indexPath: IndexPath) -> String? {
        if indexPath.section < arrayForSection.count {
            return arrayForSection[indexPath.section]
        }
        return nil
    }
}
