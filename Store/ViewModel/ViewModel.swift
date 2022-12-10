//
//  ViewModel.swift
//  Store
//
//  Created by BGDV on 02.12.2022.
//

import Foundation
import SwiftUI

let path = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"

class ViewModel: ObservableObject {
    
    @Published var homeStore = [HomeStore]()
    @Published var bestSeller = [BestSeller]()
    @Published var hotSalesImages = [ImagesModel]()
    
    @Published var currentTab = 1
    @Published var showMenu = true
    @Published var showMain = false

    init() {
        if let url = URL(string: path) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                   
                    do {
                        let parsedJSON = try jsonDecoder.decode(DataFromAPI.self, from: data)
                        
                        let homeStore = parsedJSON.home_store
                        let bestSeller = parsedJSON.best_seller
                        
                        DispatchQueue.main.async {
                            self.homeStore = homeStore
                            self.bestSeller = bestSeller
                            
                            var count2 = 0
                            for item in self.homeStore {
                                let newImage = ImagesModel(id: count2, path: item.picture, is_new: item.is_new, title: item.title, subtitle: item.subtitle, picture: item.picture, is_buy: item.is_buy)
                                    count2 += 1
                                    self.hotSalesImages.append(newImage)
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .resume()
        }
    }
}



