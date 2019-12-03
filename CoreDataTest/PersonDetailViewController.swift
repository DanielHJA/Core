//
//  PersonDetailViewController.swift
//  CoreDataTest
//
//  Created by Daniel Hjärtström on 2019-11-22.
//  Copyright © 2019 Daniel Hjärtström. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    var person: Person!
    var cells = [TitleTableViewCell]()
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.delegate = self
        temp.dataSource = self
        temp.tableFooterView = UIView()
        temp.separatorStyle = .none
        temp.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        temp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        temp.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        return temp
    }()
    
    private lazy var saveBarButtonItem: UIBarButtonItem = {
        let temp = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
        return temp
    }()
    
    private lazy var cancelBarButtonItem: UIBarButtonItem = {
        let temp = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelEditing))
        return temp
    }()
    
    private lazy var firstnameCell = TitleTableViewCell(title: "First name", value: person.firstname)
    private lazy var lastnameCell = TitleTableViewCell(title: "Last name", value: person.lastname)
    private lazy var ageCell = TitleTableViewCell(title: "Age", value: "\(person.age)")

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = saveBarButtonItem
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        
        configureCells()
        tableView.reloadData()
    }
    
    func configureCells() {
        cells = [firstnameCell, lastnameCell, ageCell]
    }
    
    @objc private func didTapSave() {
        person.lastname = lastnameCell.value
        person.firstname = firstnameCell.value
        
        if let age = Int32(ageCell.value ?? "") {
            person.age = age
        }
        
        Core.shared.save()
    }
    
    @objc private func cancelEditing() {
        navigationController?.popViewController(animated: true)
    }

}

extension PersonDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
