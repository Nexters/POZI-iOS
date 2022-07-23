//
//  MapViewModel.swift
//  Pozi
//
//  Created by suding on 2022/07/20.
//

import Firebase

final class MapViewModel: ObservableObject {
    @Published var locations = [Location]()
    
    func fetchData() {
        let db = Firestore.firestore()
        db.collection("Locations").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.global().async {
                        self.locations = snapshot.documents.map { data in
                            return Location(id: data.documentID,
                                             address: data["address"] as? String ?? "",
                                             brand: data["brand"] as? String ?? "",
                                             //geopoint: data["geopoint"] as! GeoPoint,
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
