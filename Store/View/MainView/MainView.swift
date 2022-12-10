//
//  Main.swift
//  Store
//
//  Created by BGDV on 03.12.2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var filterVM: FilterVM
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 10) {
                HStack {
                    Spacer()
                    
                    Image("geo")
                    Text("Zihuatanejo, Gro")
                        .font(.custom("MarkPro-Medium", size: 15))
                    Image(systemName: "chevron.down")
                        .font(.system(size: 8))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Image("filter")
                        .resizable()
                        .foregroundColor(Color.init(red: 0.004, green: 0, blue: 0.208))
                        .frame(width: 11, height: 13)
                        .onTapGesture {
                            filterVM.showFilterView = true
                        }
                }
                .padding(.horizontal)
                
                SelectCategory()
                SearchBar()
                HotSales()
                BestSellerView()
                
            }
            .padding(.horizontal, 10)
            .disabled(filterVM.showFilterView)
            .blur(radius: filterVM.showFilterView ? 10 : 0)
            .overlay(content: {
                if filterVM.showFilterView {
                    FilterOptions()
                }
            })
        }
        .background(Color.init("Gray"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
