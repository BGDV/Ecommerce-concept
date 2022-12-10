//
//  GetImagesForHotSales.swift
//  Store
//
//  Created by BGDV on 09.12.2022.
//

import SwiftUI

struct GetImagesForHotSales: View {
    @EnvironmentObject var viewModel: ViewModel
    
    let item: String
    
    var body: some View {
        AsyncImage(url: URL(string: item)) { image in
            image
                .resizable()
        } placeholder: {
            Color.gray.opacity(0.1)
        }
    }
}
