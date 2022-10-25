//
//  SampleCollectionViewController.swift
//  SeSAC2FirebaseExample
//
//  Created by Y on 2022/10/18.
//

import UIKit

import RealmSwift

class SampleCollectionViewController: UICollectionViewController {
    
    var tasks: Results<Todo>!
    let localRealm = try! Realm()
    
    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, Todo>!

    override func viewDidLoad() {
        super.viewDidLoad()

        tasks = localRealm.objects(Todo.self)
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        //uicollectionviewCompositionalLayout
        collectionView.collectionViewLayout = layout
        
        cellRegistration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            var content = cell.defaultContentConfiguration()
            content.image = itemIdentifier.importance < 2 ? UIImage(systemName: "person.fill") : UIImage(systemName: "person.2.fill")
            content.text = itemIdentifier.title
            content.secondaryText = "\(itemIdentifier.detail.count)개의 세부 항목"
            
            cell.contentConfiguration = content
        })
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = tasks[indexPath.item]
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        
//        var test: fruit = apple()
//        test = banana()
//        test = melon()
        
        return cell
    }
   

}

//class food { // 부모클래스
//
//}
//
//protocol fruit {
//
//}
//
//class apple: food, fruit {
//
//}
//
//class banana: food, fruit {
//
//}
//
//enum strawberry: fruit {
//
//}
//
//struct melon: fruit {
//
//}
