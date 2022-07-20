//
//  TestView.swift
//  Pozi
//
//  Created by betty on 2022/07/20.
//

import SwiftUI
import Firebase

struct TestView: View {
    @ObservedObject var mapViewModel = MapViewModel()
    
    var body: some View {
        List(mapViewModel.locations) { item in
            Text(item.address)
                .bold()
            Text(item.name)
                .bold()
            Text(item.brand)
                .bold()
        }
    }
    
    init() {
        mapViewModel.getData()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
