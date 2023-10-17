//
//  FirestoreManager.swift
//  SwiftUIWithFirestore
//
//  Created by changhoji on 2023/10/17.
//

import Foundation
import Firebase
import SwiftUI

class FirestoreManager: ObservableObject {
    let db = Firestore.firestore()
    let encoder = JSONEncoder()
    
    func addDiary(diary: Diary) {
        do {
            try db.collection("diaries").addDocument(from: diary)
        }
        catch {
            print("error")
        }
    }
}
