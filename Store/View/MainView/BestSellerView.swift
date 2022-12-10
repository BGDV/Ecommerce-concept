//
//  BestSeller.swift
//  Store
//
//  Created by BGDV on 02.12.2022.
//

import SwiftUI

struct BestSellerView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var filterVM: FilterVM
    
    private var items: [GridItem] {
      Array(repeating: .init(.adaptive(minimum: 150)), count: 2)
    }
    
    var body: some View {
        HStack {
            Text("Best Seller")
                .font(.custom("MarkPro-Bold", size: 25))
                .bold()
            Spacer()
            
            Text("see more")
                .font(.custom("MarkPro-Regular", size: 15))
                .foregroundColor(Color.init("Orange"))
                
        }
        .padding(.horizontal, 10)
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: items, spacing: 10) {
                ForEach(viewModel.bestSeller, id: \.id) { item in
                    NavigationLink {
                            ProductDetail(item: item)
                    } label: {
                        
                        if filterVM.filterCurrentModel != "All model" {
                            if item.title == filterVM.filterCurrentModel {
                                
                                PlateForBestSellerView(item: item)
                                    .frame(width: 181, height: 227)
                                    .background(Color.white)
                                    .cornerRadius(10)
                            }
                        } else {
                            PlateForBestSellerView(item: item)
                                .frame(width: 181, height: 227)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color.init("Gray"))
    }
}
