//
//  MealRemoteImage.swift
//  FetchiOSProject
//
//  Created by Charlemagne Magboo on 10/31/23.
//

import SwiftUI

struct MealRemoteImage: View {
    var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
                case .failure:
                    Text("Image Error")
                        .font(.largeTitle)
                case .success(let image):
                    image
                        .resizable()
                default:
                    ProgressView()
            }
        }
    }
}

struct MealRemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        MealRemoteImage(url: Meal.example.thumbnailURL!)
    }
}
