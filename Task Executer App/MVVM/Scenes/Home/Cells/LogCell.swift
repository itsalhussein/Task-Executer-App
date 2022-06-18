//
//  LogCell.swift
//  Task Executer App
//
//  Created by Hussein Anwar on 18/06/2022.
//

import UIKit

class LogCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = false
    }
    
    //MARK: - Properties
    
    static var identifier: String {
        return String.init(describing: self)
    }
    
    static var nib: UINib {
        return UINib.init(nibName: String.init(describing: self), bundle: nil)
    }
    
    //MARK: - Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureCell(model: LogModel){
        dateLabel.text = model.logDate
        taskLabel.text = model.taskNumber
    }
    
}
