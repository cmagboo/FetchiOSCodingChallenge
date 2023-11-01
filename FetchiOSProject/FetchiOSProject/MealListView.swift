//
//  MealListView.swift
//  FetchiOSProject
//
//  Created by Charlemagne Magboo on 10/31/23.
//

import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.meals, id: \.id) { meal in
                    NavigationLink {
                        MealDetailView(meal: meal)
                    } label: {
                        HStack {
                            if let thumbnailURL = meal.thumbnailURL, let url = URL(string: thumbnailURL) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit) // Ensure image fits the frame
                                            .frame(width: 50, height: 50) // Adjust size as needed
                                    default:
                                        EmptyView()
                                    }
                                }
                            } else {
                                EmptyView() // In case there is no image
                            }
                            Text("\(meal.name)")
                                .bold() // Apply bold text style
                        }
                    }
                }
            }
            .navigationTitle("\(viewModel.category.rawValue) Recipes")
            .task {
                await viewModel.fetchMealCategory()
            }
        }
        .onChange(of: viewModel.category) { _ in
            Task {
                await viewModel.fetchMealCategory()
            }
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
