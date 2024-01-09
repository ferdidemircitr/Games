//
//  CustomTableViewAdaptor.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 4.01.2024.
//

import Foundation
import Carbon
import UIKit

class CustomTableViewAdapter: UITableViewAdapter {
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      showDeleteConfirmationPopup(forRowAt: indexPath)
    }
  }
}
