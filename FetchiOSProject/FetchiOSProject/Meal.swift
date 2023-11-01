//
//  Meal.swift
//  FetchiOSProject
//
//  Created by Charlemagne Magboo on 10/31/23.
//
import Foundation

struct Meal: Codable, Comparable {
    let name: String
    let thumbnailURL: String?
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
        case id = "idMeal"
    }
    
    static func < (lhs: Meal, rhs: Meal) -> Bool {
        lhs.name < rhs.name
    }
    
    static let example = Meal(name: "Pumpkin Pie",
                              thumbnailURL: "https://www.themealdb.com/images/media/meals/usuqtp1511385394.jpg",
                              id: "52857")
}

struct MealCategoryQuery: Codable {
    let meals: [Meal]
}

enum MealCategory: String, CaseIterable {
    case dessert = "Dessert"
}
