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
            
            if viewModel.progress == 1.0 {
                Text("Ecommerce \nConcept")
                    .foregroundColor(.white)
                    .font(.custom("MarkPro-Heavy", fixedSize: 30))
                    .offset(x: 50)
            }
        }
        
        .overlay(content: {
            VStack {
                Spacer()
                
                if viewModel.showProgressLine {
                    ProgressLine()
                        .padding(.bottom)
                }
            }
            .padding(.bottom, 20)
        })
        .onTapGesture {
            withAnimation {
                viewModel.showProgressLine = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    viewModel.showMain = true
                }
            }
        }
        .ignoresSafeArea()
    }
}
