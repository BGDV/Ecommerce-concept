//
//  Logo.swift
//  Store
//
//  Created by BGDV on 05.12.2022.
//

import SwiftUI

struct Logo: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        ZStack {
            Color.init("Blue")
            
            Circle()
                .frame(width: 132)
                .foregroundColor(Color.init("Orange"))
            
            Text("Ecommerce \nConcept")
                .foregroundColor(.white)
                .font(.custom("MarkPro-Heavy", fixedSize: 30))
                .offset(x: 50)
        }
        .onTapGesture {
            viewModel.showMain = true
        }
        .ignoresSafeArea()
    }
}
