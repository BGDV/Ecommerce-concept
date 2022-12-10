//
//  Filter.swift
//  Store
//
//  Created by BGDV on 10.12.2022.
//

import Foundation

class FilterVM: ObservableObject {
    
    @Published var allModel = Set<String>()
    @Published var showFilterView = false
    @Published var showFilterModel = false
    @Published var showFilterPrice = false
    @Published var showFilterSize = false
    @Published var filterCurrentModel = "All model"
    @Published var filterStartPrice = "300"
    @Published var filterEndPrice = "500"
    @Published var filterStartSize = "4.5"
    @Published var filterEndSize = "5.5"
    
    func checkFilterAmount() {
        var startInt = Int(filterStartPrice) ?? 0
        var endInt = Int(filterEndPrice) ?? 0
        
        if startInt > endInt {
            filterStartPrice = "\(endInt)"
            filterEndPrice = "\(startInt)"
            
            startInt = Int(filterStartPrice)!
            endInt = Int(filterEndPrice)!
        }
        
        if startInt <= 0 {
            filterStartPrice = "0"
        } else {
            filterStartPrice = "\(startInt)"
        }
        
        if endInt == 0 {
            filterEndPrice = "0"
        } else {
            filterEndPrice = "\(endInt)"
        }
        
        if startInt > 10000 {
            filterStartPrice = "0"
        }
        
        if endInt > 10000 {
            filterEndPrice = "10000"
        }
    }
}
