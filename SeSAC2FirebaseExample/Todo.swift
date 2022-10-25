//
//  Todo.swift
//  SeSAC2FirebaseExample
//
//  Created by Y on 2022/10/13.
//

import Foundation

import RealmSwift

class Todo: Object {
    @Persisted var title: String
    @Persisted var importance: Int
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    @Persisted var detail: List<DetailTodo>
    
    @Persisted var memo: Memo? //emebeded object는 항상 옵셔널
    
    convenience init(title: String, importance: Int) {
        self.init()
        self.title = title
        self.importance = importance
    }
}

class Memo: EmbeddedObject { // List처럼 여러개 담을 순 없다, 메인 테이블과 일괄 관리 가능.
    @Persisted var content: String
    @Persisted var date: Date

}


class DetailTodo: Object {
    @Persisted var detailTitle: String
    @Persisted var favorite: Bool
    @Persisted var deadline: Date
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(detailTitle: String) {
        self.init()
        self.detailTitle = detailTitle
    }
}
