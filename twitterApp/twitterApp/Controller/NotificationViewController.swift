//
//  NotificationViewController.swift
//  twitterApp
//
//  Created by javad on 01.04.22.
//

import UIKit

class NotificationViewController: UITableViewController {
    
    let notificationCellID = "cellID"
    
    let notifications = [
        Notification(user: User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective - C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image") ), notification: "Hi guys, today I'm gonna try to make a textview. Inside of this textview I will try to put a name of the user and the username and I have to write more text here because to see how it looks when the text is longer."),
        Notification(user: User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image")), notification: "This recently released course provide some excellent guidance on how to use UITableView and UICollectionview. This course also teaches some basics on the Swift language, for example if statements and for loops. This will be an excellent purchase for you!"),
        Notification(user: User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective - C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image") ), notification: "Hi guys, today I'm gonna try to make a textview. Inside of this textview I will try to put a name of the user and the username and I have to write more text here because to see how it looks when the text is longer."),
        Notification(user: User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image")), notification: "This recently released course provide some excellent guidance on how to use UITableView and UICollectionview. This course also teaches some basics on the Swift language, for example if statements and for loops. This will be an excellent purchase for you!"),
        Notification(user: User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective - C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image") ), notification: "Hi guys, today I'm gonna try to make a textview. Inside of this textview I will try to put a name of the user and the username and I have to write more text here because to see how it looks when the text is longer."),
        Notification(user: User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image")), notification: "This recently released course provide some excellent guidance on how to use UITableView and UICollectionview. This course also teaches some basics on the Swift language, for example if statements and for loops. This will be an excellent purchase for you!"),
        Notification(user: User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective - C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image") ), notification: "Hi guys, today I'm gonna try to make a textview. Inside of this textview I will try to put a name of the user and the username and I have to write more text here because to see how it looks when the text is longer."),
        Notification(user: User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image")), notification: "This recently released course provide some excellent guidance on how to use UITableView and UICollectionview. This course also teaches some basics on the Swift language, for example if statements and for loops. This will be an excellent purchase for you!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(NotificationCell.self, forCellReuseIdentifier: notificationCellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: notificationCellID, for: indexPath) as! NotificationCell
        let data = notifications[indexPath.item]
        cell.notification = data
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}


