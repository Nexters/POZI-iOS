//
//  ContentView.swift
//  Pozi
//
//  Created by seunghwan Lee on 2022/07/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MapView(coord: (127.0495556, 37.514575))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
