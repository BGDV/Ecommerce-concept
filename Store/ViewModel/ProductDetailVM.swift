//
//  ViewModelProductDetail.swift
//  Store
//
//  Created by BGDV on 10.12.2022.
//

import Foundation
import UIKit



class ProductDetailVM: ObservableObject {
    
    @Published var productDetail = [ProductDetailModel]()
    @Published var productDetailImages = [ImagesModel]()
    @Published var currentColorProductDetail = ""
    @Published var currentCapacityProductDetail = ""
    
    let manager = CacheManager.instance
    
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
                            
                            // MARK: Cache images
                            for item in parsedJSON.images {
                                if let url = URL(string: item.description) {
                                    URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                                        DispatchQueue.main.async {
                                            if let data = data {
                                                if let downloadedImage = UIImage(data: data) {
                                                    self.manager.add(image: downloadedImage, name: item.description)
                                                }
                                            }
                                        }
                                    }).resume()
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
