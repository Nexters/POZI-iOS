//
//  MapViewModel.swift
//  Pozi
//
//  Created by suding on 2022/07/20.
//

import Combine
import Foundation
import FirebaseFirestore

class MapViewModel: ObservableObject, Identifiable {
    @Published var locations = [Locations]()
    
    func getData() {
        let db = Firestore.firestore()
        db.collection("Locations").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.locations = snapshot.documents.map { data in
                            return Locations(id: data.documentID,
                                             address: data["address"] as? String ?? "",
                                             brand: data["brand"] as? String ?? "",
                                           //  geopoint: data["geopoint"] as! GeoPoint,
                                             name: data["name"] as? String ?? ""
                            )
                        }
                    }
                }
            } else {
                // TODO: Error 처리
            }
        }
    }
}
