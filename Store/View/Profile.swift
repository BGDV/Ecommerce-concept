//
//  Profile.swift
//  Store
//
//  Created by BGDV on 03.12.2022.
//

import SwiftUI

struct Profile: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Text("Profile")
                    .font(.title)
                    .foregroundColor(Color.init("Blue"))
            }
        }
        .background(Color.init("Gray"))
    }
}

