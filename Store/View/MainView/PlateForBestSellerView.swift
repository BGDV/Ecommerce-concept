//
//  PlateForBestSellerView.swift
//  Store
//
//  Created by BGDV on 02.12.2022.
//

import SwiftUI

struct PlateForBestSellerView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var myCartVM: MyCartVM
    
    let item: BestSeller
    
    func isFavorite(item: BestSeller) {
        
        var currentItem = item
        currentItem.is_favorites.toggle()
        
        var count = 0
        for i in viewModel.bestSeller {
            if i.title == item.title {
                viewModel.bestSeller.remove(at: count)
                viewModel.bestSeller.insert(currentItem, at: count)
            }
            count += 1
        }
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: item.picture.description)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.1)
                    ProgressView()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        
            VStack(alignment: .leading) {
                HStack {
                    Text("$\(item.price_without_discount)")
                        .font(.custom("MarkPro-Bold", fixedSize: 16))
                        
                    Text("$\(item.discount_price)")
                        .font(.custom("MarkPro-Medium", fixedSize: 10))
                        .foregroundColor(Color.init(red: 0.8, green: 0.8, blue: 0.8))
                        .strikethrough()
                        
                }
                Text(item.title)
                    .font(.custom("MarkPro-Regular", fixedSize: 10))
            }
            .foregroundColor(.black)
            .padding(.bottom)
            
        }
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: item.is_favorites == true ? "heart.fill" : "heart" )
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10)
                        .foregroundColor(Color.init("Orange"))
                        
                        .background(
                            Circle()
                                .stroke()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                                .background(Color.white)
                                .cornerRadius(40)
                        )
                }
                .padding()
                .containerShape(Rectangle())
                .onTapGesture {
                   isFavorite(item: item)
                }
                
                Spacer()
            }
        }
    }
}
