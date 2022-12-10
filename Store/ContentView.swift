//
//  ContentView.swift
//  Store
//
//  Created by BGDV on 02.12.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var myCartVM: MyCartVM
    
    var body: some View {
        
        GeometryReader { geo in
            
            NavigationStack {
                switch viewModel.currentTab {
                case 1:
                    MainView()
                case 2:
                    MyCartView()
                case 3:
                    Favorite()
                case 4:
                    Profile()
                default:
                    MainView()
                }
                
                Spacer()
                
                VStack {
                    if viewModel.showMenu {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.init("Blue"))
                            
                            HStack(alignment: .center) {
                                Spacer()
                                HStack{
                                    Image("dot")
                                    Text("Explorer")
                                        .padding(.top, 1)
                                        .font(.custom("MarkPro-Bold", size: 15))
                                }
                                .foregroundColor(viewModel.currentTab == 1 ? Color.init("Orange") : .white)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        viewModel.currentTab = 1
                                    }
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Image("bag")
                                        .frame(width: 17.54, height: 18)
                                        .onTapGesture {
                                            withAnimation(.spring()) {
                                                viewModel.currentTab = 2
                                            }
                                        }
                                        .overlay {
                                            if myCartVM.myCart.count > 0 {
                                                ZStack {
                                                    Circle()
                                                        .stroke()
                                                        .frame(width: 15)
                                                        .background(Color.init("Orange"))
                                                        .foregroundColor(Color.init("Orange"))
                                                        .cornerRadius(40)
                                                    
                                                    Text(myCartVM.getCountModelInCart().description)
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 10))
                                                }
                                                .offset(x: 8, y: -8)
                                            }
                                        }
                                }
                                .foregroundColor(viewModel.currentTab == 2 ? Color.init("Orange") : .white)
                                
                                Spacer()
                                
                                
                                VStack {
                                    Image("heart2")
                                        .frame(width: 19, height: 17)
                                        .onTapGesture {
                                            withAnimation(.spring()) {
                                                viewModel.currentTab = 3
                                            }
                                        }
                                    
                                }
                                .foregroundColor(viewModel.currentTab == 3 ? Color.init("Orange") : Color.white)
                                
                                Spacer()
                                
                                VStack {
                                    Image("person")
                                        .frame(width: 17.01, height: 17.57)
                                    
                                        .onTapGesture {
                                            withAnimation(.spring()) {
                                                viewModel.currentTab = 4
                                            }
                                        }
                                    
                                        .onTapGesture {
                                            withAnimation(.spring()) {
                                                viewModel.currentTab = 4
                                            }
                                        }
                                }
                                .foregroundColor(viewModel.currentTab == 4 ? Color.init("Orange") : Color.white)
                                
                                Spacer()
                            }
                        }
                    }
                }
                .background(
                    Color.init(red: 248, green: 248, blue: 248)
                )
                .frame(height: viewModel.showMenu ? 60 : 0)
                .padding(.horizontal)
            }
        }
        .background(Color.init("Gray"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
            .environmentObject(MyCartVM())
    }
}
