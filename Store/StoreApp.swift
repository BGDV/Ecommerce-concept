//
//  StoreApp.swift
//  Store
//
//  Created by BGDV on 02.12.2022.
//

import SwiftUI

@main
struct StoreApp: App {
    @StateObject var viewModel = ViewModel()
    @StateObject var productDetailVM = ProductDetailVM()
    @StateObject var filterVM = FilterVM()
    @StateObject var myCart = MyCartVM()
    
    var body: some Scene {
        WindowGroup {
            if !viewModel.showMain {
                Logo()
                    .environmentObject(viewModel)
            } else {
                ContentView()
                    .environmentObject(viewModel)
                    .environmentObject(productDetailVM)
                    .environmentObject(filterVM)
                    .environmentObject(myCart)
            }
        }
    }
}
