//
//  MapView.swift
//  Pozi
//
//  Created by seunghwan Lee on 2022/07/16.
//

import SwiftUI
import NMapsMap

struct MapView: UIViewRepresentable {
    var coord: (Double, Double)
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.showLocationButton = true
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        
        return view
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        let coord = NMGLatLng(lat: coord.1, lng: coord.0)
        let cameraUpdate = NMFCameraUpdate(scrollTo: coord)
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 1
        uiView.mapView.moveCamera(cameraUpdate)
        
        let marker = NMFMarker()
        // TODO: 임의로 위치 설정 - 후에 변경 필요
        marker.position = NMGLatLng(lat: 37.514575, lng: 127.0495556)
        marker.mapView = uiView.mapView
        marker.iconImage = NMFOverlayImage(name: "marker")
        //이미지 크기에 맞춰서 자동으로 마커 크기 설정
        marker.width = CGFloat(NMF_MARKER_SIZE_AUTO)
        marker.height = CGFloat(NMF_MARKER_SIZE_AUTO)
    }
}
