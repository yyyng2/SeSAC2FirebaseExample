//
//  MigrationViewController.swift
//  SeSAC2FirebaseExample
//
//  Created by Y on 2022/10/13.
//

import UIKit

import RealmSwift

class MigrationViewController: UIViewController {

    let localRealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //1.fileURL
        print("fileURL: \(localRealm.configuration.fileURL!)")
      
        //2. schema version
        do {
            let version = try schemaVersionAtURL(localRealm.configuration.fileURL!)
            print("Scheme Version: \(version)")
        } catch  {
            print(error)
        }
        
        //3. test
//        for i in 1...100 {
//            let task = Todo(title: "오늘의 할일\(i)", importance: Int.random(in: 1...5))
//
//            try! localRealm.write {
//                localRealm.add(task)
//            }
//        }
//
//        for i in 1...10 {
//            let task = DetailTodo(detailTitle: "양파 \(i)개 사기0", favorite: true)
//            try! localRealm.write {
//                localRealm.add(task)
//            }
//        }
        
        //특정 todo테이블에 detailtodo 추가
//        guard let task = localRealm.objects(Todo.self).filter("title = '오늘의 할일7'").first else { return }
//
//        let detail = DetailTodo(detailTitle: "프랭크 5개 먹기", favorite: false)
//
//        try! localRealm.write {
//            task.detail.append(detail)
//        }
        
        //특정 todo에 detailTodo 여러개 추가
//        guard let task = localRealm.objects(Todo.self).filter("title = '오늘의 할일3'").first else { return }
//
//        let detail = DetailTodo(detailTitle: "깡깡한 아이스크림 \(Int.random(in: 1...5)) 먹기", favorite: false)
//
//        for _ in 1...10 {
//            try! localRealm.write {
//                task.detail.append(detail)
//            }
//        }
        
        //특정 Todo 테이블 삭제 (속해있는 List먼저 삭제)
//        guard let task = localRealm.objects(Todo.self).filter("title = '오늘의 할일7'").first else { return }
//        
//        try! localRealm.write {
//            localRealm.delete(task.detail)
//            localRealm.delete(task)
//        }
     
        //특정 Todo에 memo embeded object 추가
        guard let task = localRealm.objects(Todo.self).filter("title = '오늘의 할일6'").first else { return }
        
        let memo = Memo()
        memo.content = "메모 내용 추가"
        memo.date = Date()
        
        try! localRealm.write {
            task.memo = memo
        }
        
        
    }
    

  

}
