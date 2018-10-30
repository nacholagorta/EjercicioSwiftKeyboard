//
//  PrincipalViewController.swift
//  FinalReplicarSettingsKeyboard
//
//  Created by IGNACIO OLAGORTA VERA on 24/10/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController {
    
      internal var section1: [FirstSection] = []
      internal var section2: [FirstSection] = []
      internal var section3: [SecondSection] = []
      internal var section4: [SecondSection] = []
    
    @IBOutlet weak var tablaPrincipal: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtonsItems()
        loadCeldas()
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func registerCells(){
        let identifier = "KeyboardCell"
        
        let cellnib = UINib(nibName: "KeyboardsTableViewCell", bundle: nil)
        tablaPrincipal.register(cellnib, forCellReuseIdentifier:identifier)
        
        let identifier1 = "SwitchCell"
        let cellnib1 = UINib(nibName: "SwitchTableViewCell", bundle: nil)
        tablaPrincipal.register(cellnib1, forCellReuseIdentifier:identifier1)
    }
    
    func loadCeldas() {
        let sec1cel1 = FirstSection(name: "Keyboards", number: "3")
        let sec1cel2 = FirstSection(name: "Hardware Keyboards", number: "")
        
        let sec2cel1 = FirstSection(name: "Text Replacement", number: "")
        let sec2cel2 = FirstSection(name: "One Handed Keyboard", number: "Off")
        
        let sec3cel1 = SecondSection(name: "Auto-Capitalization")
        let sec3cel2 = SecondSection(name: "Auto-Correction")
        let sec3cel3 = SecondSection(name: "Check Spelling")
        let sec3cel4 = SecondSection(name: "Eneable Caps Lock")
        let sec3cel5 = SecondSection(name: "Predictive")
        let sec3cel6 = SecondSection(name: "Smart Punctuation")
        let sec3cel7 = SecondSection(name: "Character Preview")
        let sec3cel8 = SecondSection(name: "'.' Shortcut")
        
        let sec4cel1 = SecondSection(name: "Enable Dictation")
        
        section1.append(sec1cel1)
        section1.append(sec1cel2)
        
        section2.append(sec2cel1)
        section2.append(sec2cel2)
        
        section3.append(sec3cel1)
        section3.append(sec3cel2)
        section3.append(sec3cel3)
        section3.append(sec3cel4)
        section3.append(sec3cel5)
        section3.append(sec3cel6)
        section3.append(sec3cel7)
        section3.append(sec3cel8)
        
        section4.append(sec4cel1)
    }
    
    private func setupBarButtonsItems(){
        let btnGeneral = UIBarButtonItem(title:"Atras", style: .plain, target: self, action: #selector(buttonPressed))
        navigationItem.setLeftBarButton(btnGeneral, animated: false)
    }
    
    @objc func buttonPressed(){
        let principal = GeneralViewController()
        navigationController?.pushViewController(principal, animated: true)
    }
    
    
}
extension PrincipalViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var titleForSection: String = ""
        switch section {
        case 2:
            titleForSection = "all keyboards"
        case 3:
            titleForSection = "dictation"
        default:
            titleForSection = ""
        }
        return titleForSection
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section==2 {
            return "Double tapping the space bar will insert a period followed by a space"
        }else{
            return nil
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowsInSection = 0
        switch section{
        case 0:
            rowsInSection = section1.count
        case 1:
            rowsInSection = section2.count
        case 2:
            rowsInSection = section3.count
        case 3:
            rowsInSection = section4.count
        default:
            rowsInSection = 0
        }
        return rowsInSection
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print(section1[indexPath.row].name!)
        case 1:
            print(section2[indexPath.row].name!)
        case 2:
            print(section3[indexPath.row].name!)
        case 3:
            print(section4[indexPath.row].name!)
        default:
            print("Error")
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let KeyboardTableView:KeyboardsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "KeyboardCell", for: indexPath) as? KeyboardsTableViewCell)!
        
        let SwitchTableView:SwitchTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchTableViewCell)!
        
        switch indexPath.section {
        case 0:
            KeyboardTableView.lblNombre.text = section1[indexPath.row].name
            KeyboardTableView.lblNumber.text = section1[indexPath.row].number
            return KeyboardTableView
        case 1:
            KeyboardTableView.lblNombre.text = section2[indexPath.row].name
            KeyboardTableView.lblNumber.text = section2[indexPath.row].number
            return KeyboardTableView
        case 2:
            SwitchTableView.lblName.text = section3[indexPath.row].name
            return SwitchTableView
        case 3:
            SwitchTableView.lblName.text = section4[indexPath.row].name
            return SwitchTableView
        default:
            SwitchTableView.lblName.text = "Error"
            return SwitchTableView
        }
        
        
    }
}


