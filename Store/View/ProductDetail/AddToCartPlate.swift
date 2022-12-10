//
//  AddToCartPlate.swift
//  Store
//
//  Created by BGDV on 05.12.2022.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct AddToCartPlate: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var productDetailVM: ProductDetailVM
    @EnvironmentObject var myCartVM: MyCartVM
    
    let currentModel: ProductDetailModel
    
    func addProductToCart(item: ProductDetailModel) {
        
        var dublicateModel = false
        
        var newAdd = ProductToMyCart(
            amount: 1,
            CPU: item.CPU,
            camera: item.camera,
            capacity: productDetailVM.currentCapacityProductDetail,
            color: productDetailVM.currentColorProductDetail,
            id: item.id,
            images: productDetailVM.productDetailImages[0].path,
            isFavorites: item.isFavorites,
            price: item.price,
            rating: item.rating,
            sd: item.sd,
            ssd: item.ssd,
            title: item.title
        )
        
        var count = 0
        
        for i in myCartVM.myCart {
            if i.title == newAdd.title {
                myCartVM.myCart.remove(at: count)
                
                newAdd.amount = i.amount + 1
                
                myCartVM.myCart.append(newAdd)
                dublicateModel = true
            }
            count += 1
        }
        
        if !dublicateModel {
            myCartVM.myCart.append(newAdd)
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(currentModel.title)
                        .font(.custom("MarkPro-Medium", size: 24))
                    
                    Spacer()
                    
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 37, height: 37)
                                .foregroundColor(Color.init("Blue"))
                        )
                        .onTapGesture {
                            
                        }
                }
                
                HStack {
                    HStack {
                        Image("star")
                            .frame(width: 18, height: 18)
                            .foregroundColor(.yellow)
                        Image("star")
                            .frame(width: 18, height: 18)
                            .foregroundColor(.yellow)
                        Image("star")
                            .frame(width: 18, height: 18)
                            .foregroundColor(.yellow)
                        Image("star")
                            .frame(width: 18, height: 18)
                            .foregroundColor(.yellow)
                        Image("star")
                            .frame(width: 18, height: 18)
                            .foregroundColor(.yellow)
                    }
                    Spacer()
                }
            }
            
            HStack {
                VStack(spacing: 0) {
                    Text("Shop")
                        .font(.custom("MarkPro-Bold", size: 20))
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 90, height: 3)
                        .foregroundColor(Color.init("Orange"))
                        .offset(y: 4)
                }
                
                Spacer()
                
                Text("Details")
                    .font(.custom("MarkPro-Regular", size: 20))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("Features")
                    .font(.custom("MarkPro-Regular", size: 20))
                    .foregroundColor(.gray)
                
            }
            
            HStack {
                VStack(spacing: 5) {
                    Image("cpu")
                        .resizable()
                        .frame(width: 28, height: 28)
                    Text(currentModel.CPU)
                        .font(.custom("MarkPro-Regular", size: 11))
                }
                .foregroundColor(Color.init(red: 0.717, green: 0.717, blue: 0.717))
                
                Spacer()
                
                VStack(spacing: 5) {
                    Image("camera")
                        .resizable()
                        .frame(width: 28, height: 22)
                    Text(currentModel.camera)
                        .font(.custom("MarkPro-Regular", size: 11))
                }
                .foregroundColor(Color.init(red: 0.717, green: 0.717, blue: 0.717))
                
                Spacer()
                
                VStack(spacing: 5) {
                    Image("memorychip")
                        .resizable()
                        .frame(width: 28, height: 21)
                    Text(currentModel.ssd)
                        .font(.custom("MarkPro-Regular", size: 11))
                }
                .foregroundColor(Color.init(red: 0.717, green: 0.717, blue: 0.717))
                
                Spacer()
                
                VStack(spacing: 5) {
                    Image("sdcard")
                        .resizable()
                        .frame(width: 18.86, height: 22)
                    
                    Text(currentModel.sd)
                        .font(.custom("MarkPro-Regular", size: 11))
                }
                .foregroundColor(Color.init(red: 0.717, green: 0.717, blue: 0.717))
            }
            
            HStack {
                Text("Select color and capacity")
                    .font(.custom("MarkPro-Medium", size: 16))
                
                Spacer()
            }
            
            HStack {
                ForEach(currentModel.color, id: \.self) { color in
                    
                    ZStack {
                        Circle()
                            .foregroundColor(Color.init(hex: "\(color)"))
                            .frame(width: 40, height: 40)
                        
                        Image("checkmark")
                            .foregroundColor(productDetailVM.currentColorProductDetail == color ? .white : .clear)
                    }
                    .onTapGesture {
                        withAnimation {
                            productDetailVM.currentColorProductDetail = color
                        }
                    }
                }
                
                Spacer()
                
                ForEach(currentModel.capacity, id: \.self) { capacity in
                    Text("\(capacity) GB")
                        .font(.custom("MarkPro-Bold", size: 13))
                        .foregroundColor(productDetailVM.currentCapacityProductDetail == capacity ? .white : Color.init(red: 0.554, green: 0.554, blue: 0.554))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 71.43, height: 30.36)
                                .foregroundColor(productDetailVM.currentCapacityProductDetail == capacity ? Color.init("Orange") : .clear)
                        )
                        .padding(.horizontal, 20)
                        .onTapGesture {
                            withAnimation {
                                productDetailVM.currentCapacityProductDetail = capacity
                            }
                            
                        }
                }
                
            }
            .padding(.bottom, 20)
            
            Button {
                addProductToCart(item: currentModel)
            } label: {
                HStack {
                    Text("Add to Cart")
                    Spacer()
                    Text("$\(currentModel.price, specifier: "%.2f")")
                }
                .font(.custom("MarkPro-Bold", size: 20))
                .bold()
                .padding(.horizontal, 20)
            }
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.init("Orange"))
                    .frame(width: 335, height: 54)
                
            )
            .padding(.bottom, 30)
            
        }
        .padding(.horizontal, 40)
        .padding(.top)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 2, y: -2)
    }
}
