//
//  DiariesViewModel.swift
//  SwiftUIWithFirestore
//
//  Created by changhoji on 2023/10/17.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class DiariesViewModel: ObservableObject {
    @Published var diaries = [Diary]()
    
    func fetchData() {
        Firestore.firestore().collection("diaries").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("no documents")
                return
            }
            
            self.diaries = documents.map { queryDocumentSnapshot -> Diary in                
                var diary: Diary = Diary(color: .black, content: "error")
                
                do {
                    diary = try queryDocumentSnapshot.data(as: Diary.self)
                }
                catch {
                    print("invalid data")
                }
                
                return diary
            }
        }
    }
}
