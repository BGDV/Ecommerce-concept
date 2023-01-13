//
//  SelectCategory.swift
//  Store
//
//  Created by BGDV on 02.12.2022.
//

import SwiftUI

struct SelectCategory: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var isSelected: isSelect = .one
    
    
    enum isSelect {
        case one, two, three, four
    }
    
    
    @ViewBuilder
    func categoryItem(isSelected: isSelect, image: String, description: String, widthImage: CGFloat?, heighImage: CGFloat?) -> some View {
        
        VStack {
            ZStack {
                Circle()
                    .frame(width: 71, height: 71)
                    .foregroundColor(self.isSelected == isSelected ? Color.init("Orange") : .white)
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(self.isSelected == isSelected ? .white : Color.init(red: 0.702, green: 0.702, blue: 0.765))
                    .frame(width: widthImage, height: heighImage)
                
            }
            Text(description)
                .font(.custom("MarkPro-Medium", size: 12))
                .foregroundColor(self.isSelected == isSelected ? Color.init("Orange") : .black)
        }
        .onTapGesture {
            withAnimation {
                self.isSelected = isSelected
            }
        }
    }
    
    
    
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
                
                categoryItem(isSelected: .one, image: "iphone", description: "Phones", widthImage: 18, heighImage: 30)
                
                categoryItem(isSelected: .two, image: "computer", description: "Computer", widthImage: 29, heighImage: 31)
                
                categoryItem(isSelected: .three, image: "heart", description: "Health", widthImage: 32, heighImage: 30)
                
       
                categoryItem(isSelected: .four, image: "books", description: "Books", widthImage: 21, heighImage: 28)
                
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
