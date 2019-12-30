//
//  ViewController.swift
//  NotificationFeature
//
//  Created by Vibhor Gupta on 12/9/17.
//  Copyright © 2017 Vibhor Gupta. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController , UNUserNotificationCenterDelegate {

    @IBOutlet weak var textView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


        textView.text="Friends"
        //ask permisiion for notification
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {
            (didAllow , err) in

            if didAllow {


            }
        })
        //this will pe
        UNUserNotificationCenter.current().delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendNotification(_ sender: UIButton) {


        let answerOne = UNNotificationAction(identifier: "answerOne", title: "yes", options: UNNotificationActionOptions.foreground)
        let answerTwo = UNNotificationAction(identifier: "answerTwo", title: "No", options: UNNotificationActionOptions.foreground)

        let cateogory  = UNNotificationCategory(identifier: "myCateogory", actions: [answerOne,answerTwo], intentIdentifiers: [], options: [])

        UNUserNotificationCenter.current().setNotificationCategories([cateogory])

        //notification Created
        let content =  UNMutableNotificationContent()

        content.title="You have Got a New Friend Request"
        content.subtitle = "Add me to your ContactList"
        content.body = "I will help you in Emergency"
        content.categoryIdentifier = "myCateogory"
        content.badge = 1

        let trigger  = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }



    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "answerOne"{
            textView.text = "You are friends"
            print("You are friends")

        }else{
            textView.text = "You are  not friends"
            print("You are not  friends")
        }
        completionHandler()
    }
}

