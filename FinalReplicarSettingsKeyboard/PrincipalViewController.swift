//
//  PrincipalViewController.swift
//  FinalReplicarSettingsKeyboard
//
//  Created by IGNACIO OLAGORTA VERA on 24/10/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController {
    
    @IBOutlet weak var tablaPrincipal: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtonsItems()
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
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: KeyboardsTableViewCell = (tablaPrincipal.dequeueReusableCell(withIdentifier: "KeyboardCell", for: indexPath) as! KeyboardsTableViewCell)
        return cell
        
    }
}
