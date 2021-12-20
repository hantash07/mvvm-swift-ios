//
//  ViewController.swift
//  mvvm-swift-ios
//
//  Created by Hantash on 16/12/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private var viewModel: EmployeeViewModel!
    private var employees: [Employee] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        requestForUIUpdate()
        
        viewModel.requestGetEmployee()
    }
    
    private func setupUI() {
        viewModel = EmployeeViewModel()
        tableView.register(EmployeeTableViewCell.nib(), forCellReuseIdentifier: EmployeeTableViewCell.identifier)
//        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func requestForUIUpdate() {
        viewModel.bindEmployeeViewModelToController = {
            self.updateTableView()
        }
    }

    func updateTableView() {
        employees = viewModel.employees
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(employees[indexPath.row].name) is selected")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as! EmployeeTableViewCell
        cell.configureCell(with: employees[indexPath.row])
        return cell
    }
    
    
}

