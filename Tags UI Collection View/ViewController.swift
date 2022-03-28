//
//  ViewController.swift
//  Tags UI Collection View
//
//  Created by Samuel on 28/03/2022.
//

import UIKit

class ViewController: UIViewController {
    let tagListSource = ["a", "ASASDF", "c", "ds", "ASDFSDF"]
    var tagList = [String]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tagList.append(contentsOf: tagListSource)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.nib, forCellReuseIdentifier: "mycell")
        tableView.register(TagsCell.nib, forCellReuseIdentifier: "tagsCell")
    }
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBAction func removeButtonTapped(_ sender: Any) {
        tagList.popLast()
        tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if tagList.count == tagListSource.count {
            return
        }
        tagList.append(tagListSource[tagList.count])
        
        tableView.reloadData()
    }
    override func viewWillLayoutSubviews() {
        resizeTableView()
    }
    func resizeTableView() {
        super.updateViewConstraints()
        self.tableViewHeight?.constant = self.tableView.contentSize.height
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 2 {
            let cell  =  tableView.dequeueReusableCell(withIdentifier:"tagsCell") as? TagsCell
            guard let mycell = cell else{
                return UITableViewCell()
            }
            //            mycell.mycellTitle?.text = "Title \( indexPath.row)"
            mycell.setup(tagList: tagList)
            return mycell
        }
        let cell:CustomCell?  =  tableView.dequeueReusableCell(withIdentifier:"mycell") as? CustomCell
        guard let mycell = cell else{
            return UITableViewCell()
        }
        mycell.mycellTitle?.text = "Title \( indexPath.row)"
        return mycell
    }
    
    
}
