//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Daniel Hjärtström on 2019-11-22.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit

class ViewController: CoreViewController<Person, PersonTableViewCell> {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Core.shared.add(type: Person.self) { (person) in
//            person.firstname = "Martin"
//            person.lastname = "Andersson"
//            person.age = 33
//            Core.shared.save()
//        }
        
//        let predicate = NSPredicate(format: "age = 32")
        Core.shared.fetch(type: Person.self) { [weak self] (persons) in
            self?.items.append(persons)
        }
     
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func registerCells() {
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: "PersonTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
        let object = items[indexPath.section][indexPath.row]
        cell.configure(object)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        
        let object = items[indexPath.section][indexPath.row]
        let vc = PersonDetailViewController()
        vc.person = object
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
