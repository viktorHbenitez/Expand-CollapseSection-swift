//
//  ViewController.swift
//  Expand-CollapseSection-swift
//
//  Created by Victor Hugo Benitez Bosques on 23/08/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let cellId = "Cell"
    
    
    var arrModel : [Model] = [
        Model(title: "Comida Principal", subType: ["Mole", "Panza", "Pozole", "Guizado"], bExpandable: false),
        Model(title: "Cena", subType: ["Atun", "Ensalada", "Leche con cafe", "Nada"], bExpandable: false),
        Model(title: "Postre", subType: ["Helado", "Pastel", "Arroz con leche"], bExpandable: false),
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupTableView()

    }
    
    
    fileprivate func setupTableView(){
        
        tableView.tableFooterView  = UIView() // Remove horizontal lines
        
        // 1. Register a cell for our tableView
        //        let nibName = UINib(nibName: "PodcastCell", bundle: nil)
        //        tableView.register(nibName, forCellReuseIdentifier: cellId)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    
   
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = HeaderView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: tableView.frame.size.width,
                                              height: 40))
        // 1. Call the view in the delegate protocol
        header.delegate = self
        header.iSectionIndex = section  // set the section in the property of HeaderView
        header.btnSection.setTitle(arrModel[section].headerName, for: .normal)
        
        return header
    }
    
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arrModel.count > 0 ? self.arrModel.count : 0
    }
    
    // Number of row in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        let iNumberofRows = self.arrModel[section].subType.count
        
        if arrModel[section].isExpandable{
            return iNumberofRows
        }else{
            return 0

        }
        
    }
    
    
    // Create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a new cell if needed or reuse an old one
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let strDish : String = self.arrModel[indexPath.section].subType[indexPath.row]
        cell.textLabel?.text = strDish
      
        return cell
        
    }
    
    // Method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
}

extension ViewController : HeaderViewDelegate{
    
    // Call the method protocol
    func callHeader(iNumber: Int) {
        arrModel[iNumber].isExpandable = !arrModel[iNumber].isExpandable
        tableView.reloadSections([iNumber], with: .automatic)
    }
    
}






