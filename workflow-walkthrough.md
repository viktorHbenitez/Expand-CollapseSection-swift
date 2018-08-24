# Expand/Collapse Section using UITableView

## Create delegate and protocol of the HeaderView 

![imagen](../feature-CreateProcotolToHeaderView/assets/sketch2.gif) 


### Steps:

1. Create the potocol of the HeaderView  
```swift
protocol HeaderViewDelegate {
    func callHeader(iNumber: Int)
}
```

2. Implemente delegate `header.delegate = self` in `func tableView(_ tableView: UITableView `     
3. set the section tapped in `header.iSectionIndex` (instance of HeaderView)  
4. Call protocol `func callHeader(iNumber: Int) {} ` and change the `isExpandable` variable  
5. Reload the section tapped `tableView.reloadSections([iNumber], with: .automatic)`


