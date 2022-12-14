//
//  Favorite.swift
//  Store
//
//  Created by BGDV on 03.12.2022.
//

import SwiftUI

struct Favorite: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.bestSeller, id: \.self) { item in
                if item.is_favorites {
                    HStack {
                        Image(uiImage: viewModel.manager.getFromCache(name: item.title)!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                            .padding(.trailing, 4)
                        
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .foregroundColor(.black)
                            Text("$\(item.price_without_discount)")
                                .foregroundColor(Color.init(red: 1, green: 0.429, blue: 0.304))
                        }
                        .font(.custom("MarkPro-Medium", size: 20))
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.top, 40)
                    
                    Divider()
                }
            }
        }
        .background(Color.init("Gray"))
    }
}
