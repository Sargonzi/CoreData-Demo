//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Sargon Zi on 11/15/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Persist data
        
        // As the container is setup int he appDelegate.swift
        let appDategate = UIApplication.shared.delegate as! AppDelegate
        
        // create context obj from app delegate
        let context = appDategate.persistentContainer.viewContext
        
        // create entity and user recode
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("Sargon Zi", forKey: "username")
        newUser.setValue("12345", forKey: "password")
        newUser.setValue("23", forKey: "age")
        
        do{
            try context.save()
        }catch{
            print("Failed saving")
        }
        
        
        //Retrive data from Coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "username" )!)
            }
        } catch{
            print("Faild retrive")
        }
    }



}

