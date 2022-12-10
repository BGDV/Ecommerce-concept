//
//  TopViewScrollView.swift
//  Store
//
//  Created by BGDV on 02.12.2022.
//

import SwiftUI

struct HotSales: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var width = UIScreen.main.bounds.width
    
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(viewModel.hotSalesImages.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(viewModel.hotSalesImages.count) * distance(item)
        return sin(angle) * 200
    }
    
    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Text("Hot Sales")
                    .font(.custom("MarkPro-Bold", size: 25))
                
                Spacer()
                
                Text("see more")
                    .font(.custom("MarkPro-Regular", size: 15))
                    .foregroundColor(Color.init("Orange"))
            }
            .padding(.horizontal, 10)
            
            VStack(alignment: .center) {
                HStack {
                    GeometryReader { geo in
                        
                        ForEach(viewModel.hotSalesImages, id: \.self) { item in
                            
                            GetImagesForHotSales(item: item.path)
                                .frame(width: geo.size.width - 10, height: 190)
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            if item.is_new == true {
                                                ZStack {
                                                    Text("New")
                                                        .font(.custom("SFProDisplay-Bold", size: 10))
                                                        .foregroundColor(.white)
                                                        .background(
                                                            Circle()
                                                                .stroke()
                                                                .frame(width: 27, height: 27)
                                                                .background(Color.init("Orange"))
                                                                .cornerRadius(40)
                                                                .foregroundColor(Color.init("Orange"))
                                                            
                                                        )
                                                }
                                                .padding(.top, 5)
                                                .padding(.bottom, 15)
                                                
                                            }
                                            
                                            Text(item.title!)
                                                .font(.custom("SFProDisplay-Bold", size: 25))
                                            
                                            Text(item.subtitle!)
                                                .font(.custom("SFProDisplay-Regular", size: 11))
                                            
                                            Spacer()
                                            
                                            Button {
                                                
                                                // Some action code here.....
                                                
                                            } label: {
                                                Text("Buy now!")
                                                    .font(.custom("SFProDisplay-Bold", size: 11))
                                                    .foregroundColor(.black)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 5)
                                                            .frame(width: 98, height: 23)
                                                            .foregroundColor(.white)
                                                    )
                                            }
                                            .padding(.horizontal, 30)
                                            
                                        }
                                        .foregroundColor(.white)
                                        
                                        
                                        Spacer()
                                    }
                                    .padding(.top, 15)
                                    .padding(.horizontal, 25)
                                    .padding(.bottom, 30)
                                }
                                .shadow(color: .black.opacity(0.2), radius: 4, x: 2, y: 2)
                                .scaleEffect(1.0 - abs(distance(item.id)) * 0.2 )
                                .opacity(1.0 - abs(distance(item.id)) * 0.8 )
                                .offset(x: myXOffset(item.id), y: 0)
                                .zIndex(1.0 - abs(distance(item.id)) * 0.1)
                            
                            
                        }
                        .frame(width: geo.size.width)
                    }
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        draggingItem = snappedItem + value.translation.width / 100
                    }
                    .onEnded { value in
                        withAnimation {
                            draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                            draggingItem = round(draggingItem).remainder(dividingBy: Double(viewModel.hotSalesImages.count))
                            snappedItem = draggingItem
                        }
                    }
            )
        }
        .background(Color.init("Gray"))
        .frame(height: 220)
    }
}

struct TopViewScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HotSales()
            .environmentObject(ViewModel())
    }
}
