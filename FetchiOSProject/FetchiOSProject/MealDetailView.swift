//
//  MealDetailView.swift
//  FetchiOSProject
//
//  Created by Charlemagne Magboo on 10/31/23.
//

import SwiftUI

struct MealDetailView: View {
    var meal: Meal
    
    @StateObject private var viewModel: ViewModel
    
    init(meal: Meal) {
        self.meal = meal
        _viewModel = StateObject(wrappedValue: ViewModel(meal: meal))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                MealRemoteImage(url: meal.thumbnailURL!)
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
                Section {
                    ForEach(viewModel.ingredients, id: \.id) { ingredient in
                        HStack {
                            Text(ingredient.name)
                                .fixedSize(horizontal: true, vertical: false) // Allows long text to be on one line
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 20)
                            Text(ingredient.quantity)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 20)
                        }
                    }
                } header: {
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                }
                
                Section {
                    Text(viewModel.instructions)
                } header: {
                    Text("Instructions")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .padding()
                
            }
            .task {
                await viewModel.fetchMealDetails()
            }
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: Meal.example)
    }
}
