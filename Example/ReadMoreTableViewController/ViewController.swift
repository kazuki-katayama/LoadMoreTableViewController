//
//  ViewController.swift
//  ReadMoreTableViewController
//
//  Created by mishimay on 10/22/2015.
//  Copyright (c) 2015 mishimay. All rights reserved.
//

import UIKit
import ReadMoreTableViewController

class ViewController: ReadMoreTableViewController {

    private var titles = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .Plain, target: self, action: "clear")

        configureCellClosure = { [weak self] cell, row in
            cell.textLabel?.text = self?.titles[row]
            return cell
        }
        fetchReadCountClosure = { [weak self] currentCount, completion in
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
                guard currentCount == self?.titles.count else {
                    return
                }

                let newTitles = ["sample\(currentCount + 1)", "sample\(currentCount + 2)", "sample\(currentCount + 3)", "sample\(currentCount + 4)", "sample\(currentCount + 5)"]
                self?.titles += newTitles
                completion(readCount: newTitles.count, hasNext: true)
            }
        }
        registerNib("SampleCell")
    }

    func clear() {
        clearData()
        titles = []
        tableView.reloadData()
    }

}
