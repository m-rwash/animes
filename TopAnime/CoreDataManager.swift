//
//  CoreDataManager.swift
//  TopAnime
//
//  Created by Mohamed Rwash on 9/29/18.
//  Copyright © 2018 mrwash. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TopAnimeModels")
        container.loadPersistentStores { (storeDesc, error) in
            if let error = error{
                print("Loading Persistent Container Fail: ", error)
            }
        }
        return container
    }()
    
    func fetchAnimes() -> [Anime]{
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Anime>(entityName: "Anime")
        do{
            let animes = try context.fetch(fetchRequest)
            return animes
        }catch let error {
            print(error)
            return[]
        }
    }
    
}
