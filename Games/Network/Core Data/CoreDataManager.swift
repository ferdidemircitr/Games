//
//  CoreDataManager.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 28.12.2023.
//

import Foundation
import CoreData

class CoreDataManager {
  static let shared = CoreDataManager()
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "FavoriteGames")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  func isFavorite(id: Int) -> Bool {
    let context = persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteGames")
    fetchRequest.predicate = NSPredicate(format: "id == %@", NSNumber(value: id))
    
    do {
      let result = try context.fetch(fetchRequest)
      return !result.isEmpty
    } catch {
      print("Error checking favorite status: \(error)")
      return false
    }
  }
  
  func fetchData() -> [NSManagedObject]? {
    let context = persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteGames")
    
    do {
      let data = try context.fetch(fetchRequest)
      return data
    } catch {
      print("Error fetching data: \(error)")
      return nil
    }
  }
  
  func fetchFavoriteGame(by id: Int) -> NSManagedObject? {
    let context = persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteGames")
    fetchRequest.predicate = NSPredicate(format: "id == %@", NSNumber(value: id))
    
    do {
      let result = try context.fetch(fetchRequest)
      return result.first
    } catch {
      print("Error fetching favorite game: \(error)")
      return nil
    }
  }
  
  func addData(add model: FavoriteGame) {
    let context = persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "FavoriteGames", in: context)!
    let favoriteGame = NSManagedObject(entity: entity, insertInto: context)
    favoriteGame.setValue(model.id, forKey: "id")
    favoriteGame.setValue(model.name, forKey: "name")
    favoriteGame.setValue(model.descriptionRaw, forKey: "descriptionRaw")
    favoriteGame.setValue(model.backgroundImage, forKey: "backgroundImage")
    favoriteGame.setValue(model.website, forKey: "website")
    favoriteGame.setValue(model.redditUrl, forKey: "redditUrl")
    favoriteGame.setValue(model.metacritic, forKey: "metacritic")
    favoriteGame.setValue(model.genres, forKey: "genres")
    do {
      try context.save()
    } catch {
      print("Error saving data: \(error)")
    }
  }
  
  func deleteData(delete object: NSManagedObject) {
    let context = persistentContainer.viewContext
    context.delete(object)
    
    do {
      try context.save()
    } catch {
      print("Error deleting data: \(error)")
    }
  }
  
  func isVisitedGame(id: Int) -> Bool {
    let context = persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "VisitedGames")
    fetchRequest.predicate = NSPredicate(format: "id == %@", NSNumber(value: id))
    
    do {
      let result = try context.fetch(fetchRequest)
      return !result.isEmpty
    } catch {
      print("Error checking favorite status: \(error)")
      return false
    }
  }
  
  func addVisitedGame(add id: Int) {
    let context = persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "VisitedGames", in: context)!
    let visitedGame = NSManagedObject(entity: entity, insertInto: context)
    visitedGame.setValue(id, forKey: "id")
    
    do {
      try context.save()
    } catch {
      print("Error saving data: \(error)")
    }
  }
}
