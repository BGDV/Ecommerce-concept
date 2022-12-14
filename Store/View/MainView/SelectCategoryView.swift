//
//  SelectCategory.swift
//  Store
//
//  Created by BGDV on 02.12.2022.
//

import SwiftUI

struct SelectCategory: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var isSelected = 1
    
    var body: some View {
        VStack {
            HStack {
                Text("Select Category")
                    .font(.custom("MarkPro-Bold", size: 25))
                    .bold()
                
                Spacer()
                
                Text("view all")
                    .foregroundColor(Color.init("Orange"))
                    .font(.caption)
            }
            .padding(.horizontal, 10)
            
            HStack(spacing: 20) {
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 71, height: 71)
                            .foregroundColor(isSelected == 1 ? Color.init("Orange") : .white)
                        Image("iphone")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(isSelected == 1 ? .white : Color.init(red: 0.702, green: 0.702, blue: 0.765))
                            .frame(width: 18, height: 30)
                        
                    }
                    Text("Phones")
                        .font(.custom("MarkPro-Medium", size: 12))
                        .foregroundColor(isSelected == 1 ? Color.init("Orange") : .black)
                }
                .onTapGesture {
                    withAnimation {
                        isSelected = 1
                    }
                }
                
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 71, height: 71)
                            .foregroundColor(isSelected == 2 ? Color.init("Orange") : .white)
                        Image("computer")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(isSelected == 2 ? .white : Color.init(red: 0.702, green: 0.702, blue: 0.765))
                            .frame(width: 29, height: 31)
                    }
                    
                    Text("Computer")
                        .font(.custom("MarkPro-Medium", size: 12))
                        .foregroundColor(isSelected == 2 ? Color.init("Orange") : .black)
                }
                .onTapGesture {
                    withAnimation {
                        isSelected = 2
                    }
                }
                
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 71, height: 71)
                            .foregroundColor(isSelected == 3 ? Color.init("Orange") : .white)
                        Image("heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 30)
                            .foregroundColor(isSelected == 3 ? .white : Color.init(red: 0.702, green: 0.702, blue: 0.765))
                        
                    }
                    
                    Text("Health")
                        .font(.custom("MarkPro-Medium", size: 12))
                        .foregroundColor(isSelected == 3 ? Color.init("Orange") : .black)
                }
                .onTapGesture {
                    withAnimation {
                        isSelected = 3
                    }
                }
                
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 71, height: 71)
                            .foregroundColor(isSelected == 4 ? Color.init("Orange") : .white)
                        Image("books")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 21, height: 28)
                            .foregroundColor(isSelected == 4 ? .white : Color.init(red: 0.702, green: 0.702, blue: 0.765))
                        
                    }
                    Text("Books")
                        .font(.custom("MarkPro-Medium", size: 12))
                        .foregroundColor(isSelected == 4 ? Color.init("Orange") : .black)
                }
                .onTapGesture {
                    withAnimation {
                        isSelected = 4
                    }
                }
            }
            .background(Color.init("Gray"))
            .padding(.horizontal, 10)
        }
    }
}

struct SelectCategory_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategory()
            .environmentObject(ViewModel())
    }
}
