//
//  AllModelList.swift
//  Store
//
//  Created by BGDV on 04.12.2022.
//

import SwiftUI

struct AllModelList: View {
    @EnvironmentObject var filterVM: FilterVM

    var body: some View {
        
        if filterVM.showFilterModel {
            Text("All model")
                .font(.custom("MarkPro-Bold", size: 18))
                .onTapGesture {
                    filterVM.filterCurrentModel = "All model"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation {
                            filterVM.showFilterModel = false
                        }
                    }
                }
            
            ForEach(filterVM.allModel.sorted(), id: \.self) { item in
                Text(item)
                    .font(.custom("MarkPro-Regular", size: 18))
                    .onTapGesture {
                        filterVM.filterCurrentModel = item
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation {
                                filterVM.showFilterModel = false
                            }
                        }
                    }
                    .foregroundColor(item == filterVM.filterCurrentModel ? Color.init("Orange") : .black)
            }
        }
    }
}
