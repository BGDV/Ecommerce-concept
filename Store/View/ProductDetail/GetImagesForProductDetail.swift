//
//  PlateForProductDetail.swift
//  Store
//
//  Created by BGDV on 05.12.2022.
//

import SwiftUI

struct GetImagesForProductDetail: View {
    @EnvironmentObject var viewModel: ViewModel
    
    let item: String
    
    var body: some View {
        AsyncImage(url: URL(string: item)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ZStack {
                Color.gray.opacity(0.1)
                ProgressView()
            }
        }
    }
}

