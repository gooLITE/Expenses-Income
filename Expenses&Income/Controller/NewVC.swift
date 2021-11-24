//
//  NewTableVC.swift
//  Expenses&Income
//
//  Created by Yu Sum Yung on 24/10/2021.
//

import UIKit
import CoreData

class NewItemVC: UIViewController, sendRecordBackDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var expenseList = [Expense]()
    let expenseTable = ExpenseTableVC()
    var expenseRecord = Expenses(date: "", amount: 0, category: "", memo: "")
    
    //var expenseTable: ExpenseTableVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //expenseTable = self.children[0] as? ExpenseTableVC
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    @IBAction func segmentControl(_ sender: UISegmentedControl) {
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        
        
//        let newExpense = Expense(context: self.context)
//        newExpense.date = DateFormatter().date(from: expenseTable.dateLabel.text!)
//        newExpense.amount = Double(expenseTable.amountTF.text!) ?? 0.00
//        //newExpense.category = expenseTable.
//        newExpense.memo = expenseTable.memoTF.text ?? ""
//
//        print(newExpense)
//
//        self.expenseList.append(newExpense)
//        self.saveData()
        
    }
    
    
    
    @IBAction func continueButtonClicked(_ sender: UIButton) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toExpenseTableVC"{
            let destinationVC = segue.destination as! ExpenseTableVC
        }
    }
    
    func sendRecordBack(record: Expenses) {
        self.expenseRecord = record
        print(expenseRecord)
    }
    
    
    func saveData(){
        do {
            try context.save()
        } catch {
            print("error when saving data: \(error)")
        }
    }
}
