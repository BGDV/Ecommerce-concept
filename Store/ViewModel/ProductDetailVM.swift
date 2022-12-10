//
//  ViewModelProductDetail.swift
//  Store
//
//  Created by BGDV on 10.12.2022.
//

import Foundation

let pathDetail = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"

class ProductDetailVM: ObservableObject {
    
    @Published var productDetail = [ProductDetailModel]()
    @Published var productDetailImages = [ImagesModel]()
    @Published var currentColorProductDetail = ""
    @Published var currentCapacityProductDetail = ""
    
    init() {
        if let url = URL(string: pathDetail) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    
                    do {
                        let parsedJSON = try jsonDecoder.decode(ProductDetailModel.self, from: data)
                        
                        DispatchQueue.main.async {
                            self.productDetail.removeAll()
                            self.productDetail.append(parsedJSON)
                            
                            self.currentColorProductDetail = parsedJSON.color[0]
                            self.currentCapacityProductDetail = parsedJSON.capacity[0]
                            
                            
                            self.productDetailImages.removeAll()
                            var count = 0
                            for item in self.productDetail {
                                for path in item.images {
                                    
                                    let newImage = ImagesModel(id: count, path: path)
                                    count += 1
                                    self.productDetailImages.append(newImage)
                                    
                                    
                                    //MARK: just for test when more images
                                    
                                    for path in item.images {
                                        
                                        let newImage = ImagesModel(id: count, path: path)
                                        count += 1
                                        self.productDetailImages.append(newImage)
                                        
                                    }
                                }
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
