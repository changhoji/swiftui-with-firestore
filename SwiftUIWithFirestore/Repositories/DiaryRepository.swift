//
//  DiariesViewModel.swift
//  SwiftUIWithFirestore
//
//  Created by changhoji on 2023/10/17.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class DiaryRepository: ObservableObject {
    // use dairies in view
    @Published var diaries = [Diary]()
    
    let db = Firestore.firestore()
    
    func getDiaries() {
        Firestore.firestore().collection("diaries").order(by: "createdAt", descending: true).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("no documents")
                return
            }
            
            self.diaries = documents.map { queryDocumentSnapshot -> Diary in                
                var diary: Diary = Diary(color: .black, content: "error", createdAt: nil)
                
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
    
    func addDiary(diary: Diary) {
        do {
            try db.collection("diaries").addDocument(from: diary)
        }
        catch {
            print("error")
        }
    }
    
    func removeDiary(id: String?) {
        guard id != nil else {
            return
        }
        db.collection("diaries").document(id!).delete()
    }
    
    func updateDiary(id: String?, data: Diary) {
        guard id != nil else {
            return
        }
        
        do {
            try db.collection("diaries").document(id!).setData(from: data)
        }
        catch {
            print("error")
        }
    }
}
