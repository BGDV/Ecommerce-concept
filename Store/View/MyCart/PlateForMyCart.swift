//
//  PlateForMyCart.swift
//  Store
//
//  Created by BGDV on 08.12.2022.
//

import SwiftUI

struct PlateForMyCart: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var myCartVM: MyCartVM
    
    var body: some View {
        
        VStack {
            ForEach(myCartVM.myCart, id: \.self) { item in
                HStack {
                    GetImagesForProductDetail(item: item.images)
                        .scaleEffect(0.9)
                        .background(Color.white)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .foregroundColor(.white)
                        Text("$\(item.price, specifier: "%.2f")")
                            .foregroundColor(Color.init(red: 1, green: 0.429, blue: 0.304))
                    }
                    .font(.custom("MarkPro-Medium", size: 20))
                    
                    Spacer()
                    
                    VStack(spacing: -4) {
                        Text("-")
                            .onTapGesture {
                                myCartVM.minusCart(item: item)
                            }
                        
                        Text("\(item.amount)")
                        
                        Text("+")
                            .onTapGesture {
                                myCartVM.plusCart(item: item)
                            }
                    }
                    .font(.custom("MarkPro-Medium", size: 20))
                    .foregroundColor(.white)
                    .frame(width: 26, height: 68)
                    .background(Color.init(red: 0.158, green: 0.156, blue: 0.262))
                    .cornerRadius(10)
                    
                    Image(systemName: "trash")
                        .foregroundColor(Color.init(red: 0.213, green: 0.211, blue: 0.3))
                        .onTapGesture {
                            myCartVM.delItemFromCart(item: item)
                        }
                }
                .padding()
                .padding(.top, 40)
            }
            
            Spacer()
            
            Divider()
                .background(Color.white)
            
            VStack(spacing: 20) {
                HStack {
                    VStack(alignment: .leading, spacing: 10)  {
                        Text("Total")
                        Text("Delivery")
                    }
                    .font(.custom("MarkPro-Regular", size: 15))
                    .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("$\(myCartVM.getTotalSum()) us")
                        Text("Free")
                    }
                    .font(.custom("MarkPro-Bold", size: 15))
                    .padding(.horizontal, 10)
                    
                }
                .padding(.horizontal)
                
                Divider()
                    .background(Color.white)
                
                Button {
                    if !myCartVM.myCart.isEmpty {
                        withAnimation {
                            viewModel.currentTab = 1
                            myCartVM.myCart.removeAll()
                        }
                    }
                } label: {
                    Text("Checkout")
                        .font(.custom("MarkPro-Bold", size: 20))
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 326, height: 54)
                                .foregroundColor(Color.init("Orange"))
                        )
                }
                .padding(.top, 20)
                .padding(.bottom, 60)
                
            }
            .foregroundColor(.white)
            .padding(.horizontal, 20)
        }
    }
}
