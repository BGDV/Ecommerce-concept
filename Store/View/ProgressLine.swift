//
//  ProgressLine.swift
//  Store
//
//  Created by BGDV on 14.12.2022.
//

import SwiftUI

struct ProgressLine: View {
    @EnvironmentObject var viewModel: ViewModel
    
    let mainWidth = UIScreen.main.bounds.width
    let mainHeight = UIScreen.main.bounds.height
    
    
    
    
    var body: some View {
        
        
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.clear)
                .frame(width: mainWidth - 20, height: 10)
                .cornerRadius(10)
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.init("Orange"))
                .frame(width: (mainWidth - 20) * viewModel.progress, height: 10)
                .cornerRadius(10)
            
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.linear(duration: 2.0)) {
                    viewModel.progress = 1.0
                }
            }
        }
    }
}

struct ProgressLine_Previews: PreviewProvider {
    static var previews: some View {
        ProgressLine()
    }
}
