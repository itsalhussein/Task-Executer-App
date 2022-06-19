//
//  HomeViewController.swift
//  Task Executer App
//
//  Created by Hussein Anwar on 18/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var tasksButtons: [UIButton]!
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBinding()
        setupUI()
        setupTableView()
    }
    
    //MARK: - Properties
    
    let viewModel : HomeViewModel
    
    //MARK: - Initilization
    init(with viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupUI(){
        //Navigation bar UI
        title = "Task Executer App"
        let customImageBarBtn = UIBarButtonItem(
            image: UIImage(named: "ic_sideMenu")?.withRenderingMode(.alwaysOriginal),
            style: .plain, target: self, action: #selector(handleClick))
        navigationItem.leftBarButtonItem = customImageBarBtn
        
        //Container of the table view UI
        containerView.layer.cornerRadius = 7.5
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = PublicMethods.hexaStringToUIColor("#E6E7E7").cgColor
        
        //Tasks buttons UI
        buttonsStackView.layer.backgroundColor = UIColor.clear.cgColor
        buttonsStackView.layer.borderColor = PublicMethods.hexaStringToUIColor("#E6E7E7").cgColor
        buttonsStackView.layer.borderWidth = 1.0
        buttonsStackView.layer.cornerRadius = 7.5
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LogCell.nib, forCellReuseIdentifier: LogCell.identifier)
        tableView.separatorStyle = .none
    }
    
    private func setTasksButtonsUI(tagOfSelectedButton: Int) {
        for button in tasksButtons {
            if button.tag == tagOfSelectedButton {
                button.isSelected = true
                button.layer.backgroundColor = UIColor.black.cgColor
                button.setTitleColor(.white, for: .selected)
                button.layer.cornerRadius = 4.0
            } else {
                button.isSelected = false
                button.layer.backgroundColor = UIColor.clear.cgColor
                button.setTitleColor(.black, for: .normal)
            }
        }
    }
    
    
    //Assuming that Task 1 , 3 , 4 are heavy tasks (Slow) and Task 2 is light
    
    private func doHeavyTask(tagOfSelectedButton: Int){
        if tagOfSelectedButton != 2 {
            var counter = 0
            for _ in 0..<9999999 {
                counter += 1
            }
            viewModel.populateLogData(tagOfSelectedButton)
        }
    }
    
    private func doLightTask(tagOfSelectedButton: Int){
        if tagOfSelectedButton == 2 {
            var counter = 0
            for _ in 0..<99 {
                counter += 1
            }
            viewModel.populateLogData(tagOfSelectedButton)
        }
    }
    
    private func configureBinding() {
        viewModel.reloadLogsTableView = { [weak self] () in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @objc
    func handleClick(){
        print("MENU PRESSED")
    }
    
    //MARK: - Actions
    
    @IBAction func taskAction(_ sender: UIButton) {
        DispatchQueue.global().async { [weak self] in
            self?.doHeavyTask(tagOfSelectedButton: sender.tag)
            self?.doLightTask(tagOfSelectedButton: sender.tag)
        }
        setTasksButtonsUI(tagOfSelectedButton: sender.tag)
    }
}

//MARK: - TABLE VIEW Methods

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LogCell.identifier, for: indexPath) as! LogCell
        cell.configureCell(model: viewModel.getCellAt(index: indexPath.row))
        return cell
    }
}

