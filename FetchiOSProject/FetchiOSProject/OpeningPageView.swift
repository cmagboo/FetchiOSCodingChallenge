//
//  OpeningPageView.swift
//  FetchiOSProject
//
//  Created by Charlemagne Magboo on 10/31/23.
//

import SwiftUI

struct OpeningPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: MealListView()) {
                    Text("Explore Recipes")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct OpeningPageView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningPageView()
    }
}
