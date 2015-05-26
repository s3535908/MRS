//
//  ViewController.swift
//  PosturePlus
//
//  Created by Mads Svendsen on 26/05/15.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit
import CoreData

class CoreInfoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ViewFrame: DrawFrame!
    @IBOutlet weak var lblAccessToken: UILabel!
    @IBOutlet weak var txtAccessToken: UITextField!
    @IBOutlet weak var lblCoreID: UILabel!
    @IBOutlet weak var txtCoreID: UITextField!
    @IBOutlet weak var btnEnter: UIButton!
    
    @IBAction func CoreIDChanged(){
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Coreinfo")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "coreid = %@", txtCoreID.text)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        if(results.count > 0){
            var res = results[0] as! NSManagedObject
            txtAccessToken.text = res.valueForKey("accesstoken") as! String
        }
    }
    
    
    @IBAction func btnEnterPressed(){
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Coreinfo")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "coreid = %@", txtCoreID.text)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        if(results.count > 0){
            var res = results[0] as! NSManagedObject
            res.setValue(txtAccessToken.text, forKey: "accesstoken")
            context.save(nil)
            println(res)
        }
        else {
            var newCore = NSEntityDescription.insertNewObjectForEntityForName("Coreinfo", inManagedObjectContext: context) as! NSManagedObject
            newCore.setValue(txtAccessToken.text, forKey: "accesstoken")
            newCore.setValue(txtCoreID.text, forKey: "coreid")
            Model().GSCoreID = txtCoreID.text
            Model().GSAccessToken = txtAccessToken.text
            context.save(nil)
            println(newCore)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtCoreID.delegate = self;
        self.txtAccessToken.delegate = self;
        
        self.DrawButton()
        self.DrawLogo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func DrawButton() {
        btnEnter.backgroundColor = color1
        btnEnter.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
    
    func DrawLogo() {
        var imageViewObject :UIImageView
        imageViewObject = UIImageView(frame:CGRectMake(50, 60, 389*0.6, 83*0.6))
        imageViewObject.image = UIImage(named:"PP_logo.png")
        self.view.addSubview(imageViewObject)
        self.view.sendSubviewToBack(imageViewObject)
    }
}

