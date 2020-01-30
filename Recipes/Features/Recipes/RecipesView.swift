//
//  RecipesView.swift
//  Recipes
//
//  Created by Majid Jabrayilov on 11/10/19.
//  Copyright © 2019 Majid Jabrayilov. All rights reserved.
//
import KingfisherSwiftUI
import SwiftUI

struct RecipesView: View {
    let recipes: [Recipe]

    private var list: some View {
        List(recipes, id: \.self) { recipe in
            NavigationLink(destination: RecipeDetailsContainerView(uri: recipe.uri)) {
                ZStack(alignment: .bottomLeading) {
                    KFImage(recipe.image)
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)

                    LinearGradient(
                        gradient: .init(colors: [Color.clear, .gray]),
                        startPoint: .center,
                        endPoint: .bottom
                    )

                    Text(recipe.title)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
    }

    var body: some View {
        Group {
            if recipes.isEmpty {
                ActivityView()
            } else {
                list
            }
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(recipes: [.mock, .mock, .mock, .mock])
    }
}
