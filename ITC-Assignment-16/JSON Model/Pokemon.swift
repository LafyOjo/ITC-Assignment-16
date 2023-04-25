//
//  Pokemon.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 24/04/2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tech = try? JSONDecoder().decode(Tech.self, from: jsonData)

import Foundation

// MARK: - Tech

struct Pokemon: Decodable {
    let data: [Datum]
//    let page, pageSize, count, totalCount: Int
}

// MARK: - Datum
struct Datum: Decodable {
    let id: String?
    let name: String?
    let supertype: Supertype?
//    let subtypes: [Subtype]?
//    let level: String?
//    let hp: String?
//    let types: [RetreatCost]?
//    let evolvesFrom: String?
//    let abilities: [Ability]?
//    let attacks: [Attack]?
//    let weaknesses, resistances: [Resistance]?
//    let retreatCost: [RetreatCost]?
//    let convertedRetreatCost: Int?
//    let datumSet: Set?
//    let number, artist: String?
//    let rarity: Rarity?
//    let nationalPokedexNumbers: [Int]?
//    let legalities: Legalities?
//    let images: DatumImages?
//    let tcgplayer: Tcgplayer?
//    let cardmarket: Cardmarket?
//    let evolvesTo: [String]?
//    let flavorText: String?
//    let rules: [String]?
//    let regulationMark: String?

//    enum CodingKeys: String, CodingKey {
//        case id, name, supertype, subtypes, level, hp, types, evolvesFrom, abilities, attacks, weaknesses, resistances, retreatCost, convertedRetreatCost
//        case datumSet = "set"
//        case number, artist, rarity, nationalPokedexNumbers, legalities, images, tcgplayer, cardmarket, evolvesTo, flavorText, rules, regulationMark
//    }
}

//// MARK: - Ability
//struct Ability: Decodable {
//    let name, text: String
//    let type: TypeEnum
//}
//
//enum TypeEnum: String, Decodable {
//    case ability = "Ability"
//    case pokéBody = "Poké-Body"
//    case pokéPower = "Poké-Power"
//    case pokémonPower = "Pokémon Power"
//}
//
//// MARK: - Attack
//struct Attack: Decodable {
//    let name: String
//    let cost: [RetreatCost]
//    let convertedEnergyCost: Int
//    let damage, text: String
//}
//
//enum RetreatCost: String, Decodable {
//    case colorless = "Colorless"
//    case darkness = "Darkness"
//    case dragon = "Dragon"
//    case fighting = "Fighting"
//    case fire = "Fire"
//    case grass = "Grass"
//    case lightning = "Lightning"
//    case metal = "Metal"
//    case psychic = "Psychic"
//    case water = "Water"
//}
//
//// MARK: - Cardmarket
//struct Cardmarket: Decodable {
//    let url: String
//    let updatedAt: UpdatedAt
//    let prices: [String: Double]
//}
//
//enum UpdatedAt: String, Decodable {
//    case the20230327 = "2023/03/27"
//    case the20230424 = "2023/04/24"
//}
//
//// MARK: - Set
//struct Set: Decodable {
//    let id, name: String
//    let series: Series
//    let printedTotal, total: Int
//    let legalities: Legalities
//    let ptcgoCode: String?
//    let releaseDate, updatedAt: String
//    let images: SetImages
//}
//
//// MARK: - SetImages
//struct SetImages: Decodable {
//    let symbol, logo: String
//}
//
//// MARK: - Legalities
//struct Legalities: Decodable {
//    let unlimited: Expanded
//    let expanded, standard: Expanded?
//}
//
//enum Expanded: String, Decodable {
//    case legal = "Legal"
//}
//
//enum Series: String, Decodable {
//    case base = "Base"
//    case blackWhite = "Black & White"
//    case diamondPearl = "Diamond & Pearl"
//    case eCard = "E-Card"
//    case ex = "EX"
//    case gym = "Gym"
//    case heartGoldSoulSilver = "HeartGold & SoulSilver"
//    case neo = "Neo"
//    case other = "Other"
//    case platinum = "Platinum"
//    case pop = "POP"
//    case sunMoon = "Sun & Moon"
//    case swordShield = "Sword & Shield"
//    case xy = "XY"
//}
//
//// MARK: - DatumImages
//struct DatumImages: Decodable {
//    let small, large: String
//}
//
//enum Rarity: String, Decodable {
//    case common = "Common"
//    case promo = "Promo"
//    case rare = "Rare"
//    case rareHolo = "Rare Holo"
//    case rareHoloEX = "Rare Holo EX"
//    case rareHoloGX = "Rare Holo GX"
//    case rareHoloV = "Rare Holo V"
//    case rareUltra = "Rare Ultra"
//    case uncommon = "Uncommon"
//}
//
//// MARK: - Resistance
//struct Resistance: Decodable {
//    let type: RetreatCost
//    let value: String
//}
//
//enum Subtype: String, Decodable {
//    case basic = "Basic"
//    case ex = "EX"
//    case gx = "GX"
//    case mega = "MEGA"
//    case restored = "Restored"
//    case sp = "SP"
//    case stage1 = "Stage 1"
//    case stage2 = "Stage 2"
//    case tagTeam = "TAG TEAM"
//    case teamPlasma = "Team Plasma"
//    case v = "V"
//}
//
enum Supertype: String, Decodable {
    case pokémon = "Pokémon"
}
//
//// MARK: - Tcgplayer
//struct Tcgplayer: Decodable {
//    let url: String
//    let updatedAt: UpdatedAt
//    let prices: Prices
//}
//
//// MARK: - Prices
//struct Prices: Decodable {
//    let holofoil, reverseHolofoil, normal, the1StEditionHolofoil: The1_StEditionHolofoil?
//    let unlimitedHolofoil: The1_StEditionHolofoil?
//
//    enum CodingKeys: String, CodingKey {
//        case holofoil, reverseHolofoil, normal
//        case the1StEditionHolofoil = "1stEditionHolofoil"
//        case unlimitedHolofoil
//    }
//}
//
//// MARK: - The1_StEditionHolofoil
//struct The1_StEditionHolofoil: Decodable {
//    let low, mid, high: Double
//    let market, directLow: Double?
//}

enum APIError: Error {
    case decodingError
    case networkError
    case invalidURL
    case invalidResponse
}
