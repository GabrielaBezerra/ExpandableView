//
//  ViewController.swift
//  ExpandedView
//
//  Created by Gabriela Bezerra on 25/07/18.
//  Copyright © 2018 GabrielaBezerra. All rights reserved.
//

import UIKit

struct CellData {
  var opened = Bool()
  var title = String()
  var sectionData = [String]()
}

class TableViewController: UITableViewController {

  var tableViewData = [CellData]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableViewData = [CellData(opened: false, title: "Title1", sectionData: ["1.1", "1.2", "1.3"]),
                     CellData(opened: false, title: "Title2", sectionData: ["2.1", "2.2", "2.3"]),
                     CellData(opened: false, title: "Title3", sectionData: ["3.1", "3.2", "3.3"]),
                     CellData(opened: false, title: "Title4", sectionData: ["4.1", "4.2", "4.3"])]
    
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return tableViewData.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableViewData[section].opened {
      return tableViewData[section].sectionData.count + 1
    } else {
      return 1
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let dataIndex = indexPath.row - 1
    if indexPath.row == 0 {
      //Primeira celula da secao
      let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
      cell.textLabel?.text = tableViewData[indexPath.section].title
      cell.selectionStyle = .none
      return cell
    } else {
      //Celulas que expandem
      //Usar tableViewCells customizadas, se quiser
      let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
      cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
      cell.textLabel?.textColor = .darkGray
      return cell
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      //Primeira celula da secao expande/contrai as celulas internas
      tableViewData[indexPath.section].opened = !tableViewData[indexPath.section].opened
      let sections = IndexSet.init(integer: indexPath.section)
      tableView.reloadSections(sections, with: .fade)
    } else {
      //Outras acoes para as celulas internas
    }
  }
  
}

