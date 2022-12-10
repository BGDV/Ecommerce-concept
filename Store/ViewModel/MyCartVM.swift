//
//  MyCartVM.swift
//  Store
//
//  Created by BGDV on 10.12.2022.
//

import Foundation

class MyCartVM: ObservableObject {
    @Published var myCart = [ProductToMyCart]()
    
    func getTotalSum() -> Int {
        var totalSum = 0
        for i in myCart {
            totalSum += (Int(i.price) * i.amount)
        }
        return totalSum
    }
    
    func getCountModelInCart() -> Int {
        var totalModel = 0
        for i in myCart {
            totalModel += i.amount
        }
        return totalModel
    }

    func delItemFromCart(item: ProductToMyCart) {
        var count = 0
        for i in myCart {
            if i.title == item.title {
                myCart.remove(at: count)
            }
            count += 1
        }
    }
    
    func minusCart(item: ProductToMyCart) {
        guard item.amount > 1 else { return }
        var currentItem = item
        currentItem.amount -= 1
        
        var count = 0
        for i in myCart {
            if i.title == item.title {
                myCart.remove(at: count)
                myCart.insert(currentItem, at: count)
            }
            count += 1
        }
    }
    
    func plusCart(item: ProductToMyCart) {
        var currentItem = item
        currentItem.amount += 1
        
        var count = 0
        for i in myCart {
            if i.title == item.title {
                myCart.remove(at: count)
                myCart.insert(currentItem, at: count)
            }
            count += 1
        }
    }
}
