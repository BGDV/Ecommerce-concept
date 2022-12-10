//
//  ProductDetail.swift
//  Store
//
//  Created by BGDV on 02.12.2022.
//

import SwiftUI
import UIKit



struct ProductDetail: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var productDetailVM: ProductDetailVM
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let item: BestSeller
    
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(productDetailVM.productDetailImages.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(productDetailVM.productDetailImages.count) * distance(item)
        return sin(angle) * 200
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("chevron.left")
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 37, height: 37)
                                .foregroundColor(Color.init(red: 0.063, green: 0.063, blue: 0.063))
                        )
                }
                .padding()
                
                Spacer()
                
                Text("Product Details")
                    .font(.custom("MarkPro-Medium", size: 18))
                
                Spacer()
                
                Button {
                    withAnimation {
                        viewModel.currentTab = 2
                        self.presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Image("bag")
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 37, height: 37)
                                .foregroundColor(Color.init("Orange"))
                        )
                }
                .padding()
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            
            VStack(alignment: .center) {
                HStack {
                    GeometryReader { geo in
                        
                        ForEach(productDetailVM.productDetailImages, id: \.self) { item in
                            
                            GetImagesForProductDetail(item: item.path)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.2), radius: 4, x: 2, y: 2)
                                .scaleEffect(1.0 - abs(distance(item.id)) * 0.2 )
                                .opacity(1.0 - abs(distance(item.id)) * 0.3 )
                                .offset(x: myXOffset(item.id), y: 0)
                                .zIndex(1.0 - abs(distance(item.id)) * 0.1)
                            
                        }
                        .frame(width: geo.size.width)
                        
                    }
                    .padding(.horizontal)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        draggingItem = snappedItem + value.translation.width / 100
                    }
                    .onEnded { value in
                        withAnimation {
                            draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                            draggingItem = round(draggingItem).remainder(dividingBy: Double(productDetailVM.productDetailImages.count))
                            snappedItem = draggingItem
                        }
                    }
            )
            
            ForEach(productDetailVM.productDetail, id: \.self) { item in
                AddToCartPlate(currentModel: item)
            }
        }
        .background(Color.init("Gray"))
        .navigationBarBackButtonHidden(true)
    }
}



