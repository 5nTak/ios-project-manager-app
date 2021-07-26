//
//  ViewController+Delegate.swift
//  ProjectManager
//
//  Created by steven on 7/23/21.
//

import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataSource = dataSourceForTableView(tableView)
        let task = dataSource.getTask(indexPath)
        let taskFormViewController = TaskFormViewController(type: .edit)
        taskFormViewController.configureViews(task)
        let navigationController = UINavigationController(rootViewController: taskFormViewController)
        navigationController.modalPresentationStyle = .formSheet
        self.present(navigationController, animated: true, completion: nil)
    }
}
