//
//  FilterOptions.swift
//  Store
//
//  Created by BGDV on 03.12.2022.
//

import SwiftUI

struct FilterOptions: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var filterVM: FilterVM
    
    func getAllModel() {
        filterVM.allModel.removeAll()
        for i in viewModel.homeStore {
            filterVM.allModel.insert(i.title)
        }
        
        for i in viewModel.bestSeller {
            filterVM.allModel.insert(i.title)
        }
    }
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Button {
                    withAnimation {
                        filterVM.showFilterView = false
                    }
                    
                } label: {
                    Image("x")
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 37, height: 37)
                                .foregroundColor(Color.init("Blue"))
                        )
                }
                .padding()
                
                Spacer()
                
                Text("Filter options")
                    .font(.custom("MarkPro-Medium", size: 18))
                
                Spacer()
                
                Button {
                    filterVM.showFilterView = false
                    
                    //  MARK: for apply filter more code here ..........
                    
                } label: {
                    Text("Done")
                        .font(.custom("MarkPro-Medium", size: 18))
                        .foregroundColor(.white)
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 86, height: 37)
                                .foregroundColor(Color.init("Orange"))
                        )
                }
                .padding()
            }
            .padding(.horizontal, 30)
            
            
            HStack {
                Text("Brand")
                    .font(.custom("MarkPro-Medium", size: 18))
                Spacer()
            }
            .padding(.leading, 30)
            
            HStack {
                
                Text(filterVM.filterCurrentModel)
                    .font(.custom("MarkPro-Regular", fixedSize: 18))
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .frame(width: 337)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray)
                    .opacity(0.2)
                    .frame(width: 337, height: 37)
            )
            .padding(.bottom)
            .onTapGesture {
                withAnimation {
                    filterVM.showFilterModel.toggle()
                }
            }
            
            AllModelList()
            
            HStack {
                Text("Price")
                    .font(.custom("MarkPro-Medium", size: 18))
                Spacer()
            }
            .padding(.leading, 30)
            
            HStack {
                
                Text("$\(filterVM.filterStartPrice) - $\(filterVM.filterEndPrice)")
                    .font(.custom("MarkPro-Regular", fixedSize: 18))
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
                
            }
            .padding(.horizontal)
            .frame(width: 337)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray)
                    .opacity(0.2)
                    .frame(width: 337, height: 37)
            )
            .padding(.bottom)
            .onTapGesture {
                withAnimation {
                    filterVM.showFilterPrice.toggle()
                }
            }
            if filterVM.showFilterPrice {
                HStack {
                    HStack {
                        Text("$")
                        TextField("amount", text: $filterVM.filterStartPrice)
                            .keyboardType(.phonePad)
                    }
                    .font(.custom("MarkPro-Regular", size: 18))
                    .padding(.horizontal, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .foregroundColor(Color.init("Blue").opacity(0.2))
                    )
                    
                    Text(" - ")
                        .font(.custom("MarkPro-Regular", size: 18))
                    HStack {
                        Text("$")
                        TextField("amount", text: $filterVM.filterEndPrice)
                            .keyboardType(.phonePad)
                    }
                    .font(.custom("MarkPro-Regular", size: 18))
                    .padding(.horizontal, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .foregroundColor(Color.init("Blue").opacity(0.2))
                    )
                    
                    Button {
                        filterVM.checkFilterAmount()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation {
                                filterVM.showFilterPrice = false
                            }
                        }
                    } label: {
                        Text("Ok")
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 37, height: 37)
                                    .foregroundColor(Color.init("Orange"))
                            )
                    }
                    .padding(.horizontal, 5)
                }
                .padding(.horizontal, 45)
            }
            
            HStack {
                Text("Size")
                    .font(.custom("MarkPro-Medium", size: 18))
                Spacer()
            }
            .padding(.leading, 30)
            
            HStack {
                Text("\(filterVM.filterStartSize) to \(filterVM.filterEndSize) inches")
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }
            .font(.custom("MarkPro-Regular", size: 18))
            .padding(.horizontal)
            .frame(width: 337)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray)
                    .opacity(0.2)
                    .frame(width: 337, height: 37)
            )
            .padding(.bottom)
            .onTapGesture {
                withAnimation {
                    
                }
            }
            Spacer()
        }
        .background(Color.white)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        .cornerRadius(20)
        .onAppear {
            getAllModel()
        }
    }
}



struct FilterOptions_Previews: PreviewProvider {
    static var previews: some View {
        FilterOptions()
            .environmentObject(ViewModel())
            .environmentObject(FilterVM())
    }
}
