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
        return header
    }
    
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    // Number of row in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    // Create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a new cell if needed or reuse an old one
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        
        // Set the text from the date model
        //        let <#objectModel#> : <#typeObjectModel#> = <#arrContainerModel#>[indexPath.row]
        
        // #if do not have custom cell
        cell.textLabel?.text = "Title"
        // # else pass objet to the custom cell NIB
        //        cell.<#objectModelSetCell#> = <#objectModel#>
        
        
        return cell
        
    }
    
    // Method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
}
