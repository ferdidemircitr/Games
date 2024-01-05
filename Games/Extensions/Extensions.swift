//
//  Extensions.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 5.01.2024.
//

import Foundation
import UIKit

func showDeleteConfirmationPopup(forRowAt indexPath: IndexPath) {
  let viewModel = FavoritesViewModel.shared
  let alertController = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
  
  let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
  alertController.addAction(cancelAction)
  
  let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
    viewModel.removeFavoriteGame(forRowAt: indexPath)
  }
  alertController.addAction(deleteAction)
  if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
     let window = windowScene.windows.first,
     let currentViewController = window.rootViewController {
    currentViewController.present(alertController, animated: true, completion: nil)
  }
}
