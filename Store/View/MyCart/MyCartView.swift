//
//  MyCart.swift
//  Store
//
//  Created by BGDV on 02.12.2022.
//

import SwiftUI

struct MyCartView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            self.presentationMode.wrappedValue.dismiss()
                            viewModel.currentTab = 1
                            viewModel.showMenu = true
                        }
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
                    
                    Text("Add adress")
                        .font(.custom("MarkPro-Medium", size: 15))
                        .padding(.trailing, 10)
                    
                    Button {
                        
                    } label: {
                        Image("geo2")
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 37, height: 37)
                                    .foregroundColor(Color.init("Orange"))
                            )
                    }
                    .padding(.trailing, 15)
                    
                }
                .padding(.horizontal, 30)
                .padding(.bottom,20)
                
                HStack {
                    Text("My Cart")
                        .font(.custom("MarkPro-Bold", size: 35))
                        .bold()
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                PlateForMyCart()
                    .frame(height: geo.size.height / 1.3)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.init("Blue"))
                    )
            }
        }
        .background(Color.init("Gray"))
        .onAppear {
            viewModel.showMenu = false
        }
        .onDisappear {
            viewModel.showMenu = true
        }
    }
}
