//
//  NewTableVC.swift
//  Expenses&Income
//
//  Created by Yu Sum Yung on 24/10/2021.
//

import UIKit
import CoreData

class NewItemVC: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var expenseList = [Expense]()
    let expenseTable = ExpenseTableVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    @IBAction func segmentControl(_ sender: UISegmentedControl) {
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        let newExpense = Expense(context: self.context)
        newExpense.date = DateFormatter().date(from: expenseTable.dateLabel.text!)
        newExpense.amount = Double(expenseTable.amountTF.text!) ?? 0.00
        //newExpense.category = expenseTable.
        newExpense.memo = expenseTable.memoTF.text ?? ""
        
        self.expenseList.append(newExpense)
        self.saveData()
        
    }
    
    
    
    @IBAction func continueButtonClicked(_ sender: UIButton) {
    }
    
    
    
    func saveData(){
        do {
            try context.save()
        } catch {
            print("error when saving data: \(error)")
        }
    }
}
