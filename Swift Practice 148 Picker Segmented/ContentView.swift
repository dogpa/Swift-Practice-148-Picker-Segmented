
//  ContentView.swift
//  Swift Practice 148 Picker Segmented
//
//  Created by Dogpa's MBAir M1 on 2022/4/19.
//

import SwiftUI

struct ContentView: View {
    //初始對SegmentedController做外觀設定
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemCyan
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
    }
    
    @State private var land : landScape = .airplane
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("選擇風景", selection: $land) {
                    ForEach(landScape.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                chooseLandScapeView(selectLandScape: land)
                Spacer()
                
            }
            .navigationTitle("風景照")
        }
    }
}

///emum如果遵從CaseIterable可以將enum變成Array
enum landScape : String, CaseIterable {
    case airplane = "Airplane"
    case bicycle = "Bicycle"
    case train = "Train"
}

///設定一個chooseLandScapeView遵從View
///設定一個landScape變數判斷ContentView選擇的landScape種類 接著顯示指定照片
struct chooseLandScapeView: View {
    var selectLandScape: landScape
    var body: some View {
        switch selectLandScape {
        case .airplane :
            landScapeView(landScape: "Airplane")
        case .bicycle :
            landScapeView(landScape: "Bicycle")
        case .train :
            landScapeView(landScape: "Train")
        }
    }
}

///顯示照片的View，依照landScape傳進來的值判斷顯示照片內容
struct landScapeView: View {
    var landScape: String
    var body: some View {
        Image(landScape)
            .resizable()
            .frame(width: 400, height: 280)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
