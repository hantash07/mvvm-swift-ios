//
//  EmployeeTableViewCell.swift
//  mvvm-swift-ios
//
//  Created by Hantash on 19/12/2021.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    static let identifier = "EmployeeTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    @IBOutlet weak var empImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(with employee: Employee) {
        empImageView.image = UIImage(named: "profile pic")
        nameLabel.text = employee.name
        salaryLabel.text = employee.email
    }
    
}
