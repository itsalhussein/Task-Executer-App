//
//  HomeViewModel.swift
//  Task Executer App
//
//  Created by Hussein Anwar on 18/06/2022.
//

import Foundation

class HomeViewModel {
    //MARK: - Properties
    var reloadLogsTableView : (()->())?
    
    var logData : [LogModel] = [] {
        didSet {
            reloadLogsTableView?()
        }
    }
    
    //MARK: - Methods
    
    func numberOfCells() -> Int {
        return logData.count
    }
    
    func getCellAt(index: Int) -> LogModel {
        return logData[index]
    }
    
    func populateLogData(_ tagOfSelectedButton: Int){
        let currentDate = PublicMethods.getCurrDateTimeAsString()
        logData.append(LogModel.init(logDate: currentDate, taskNumber: "Task \(tagOfSelectedButton)"))
    }
}
