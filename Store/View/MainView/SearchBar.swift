//
//  SearchBar.swift
//  Store
//
//  Created by BGDV on 05.12.2022.
//

import SwiftUI

struct SearchBar: View {
    @State var textForSearch = ""
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(Color.init("Orange"))
                    .padding(.leading)
                TextField("Search", text: $textForSearch)
                    .font(.custom("MarkPro-Regular", size: 12))
                    .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke()
                    .frame(height: 34)
                    .foregroundColor(.clear)
                    .background(Color.white)
                    .cornerRadius(20)
            )
            
            Image("qr")
                .foregroundColor(.white)
                .background(
                    Circle()
                        .stroke()
                        .foregroundColor(.white)
                        .frame(width: 34, height: 34)
                        .background(Color.init("Orange"))
                        .cornerRadius(20)
                )
                .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
