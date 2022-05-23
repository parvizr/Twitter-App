//
//  ProfileController.swift
//  twitterApp
//
//  Created by javad on 04.04.22.
//

import UIKit

class ProfileController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let profileCellId = "profileCellId"
    let tweetCellId = "tweetCellId"
    
    let tweets = [
        Tweet(user: User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective - C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image") ), message: "Hi guys, today I'm gonna try to make a textview. Inside of this textview I will try to put a name of the user and the username and I have to write more text here because to see how it looks when the text is longer."),
        Tweet(user: User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image")), message: "This recently released course provide some excellent guidance on how to use UITableView and UICollectionview. This course also teaches some basics on the Swift language, for example if statements and for loops. This will be an excellent purchase for you!")
    ]
    
    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.backward")?.withTintColor(UIColor.white, renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(backHandler), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func backHandler() {
        self.navigationController?.popViewController(animated: true)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: profileCellId)
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: tweetCellId)
        collectionView.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(button)
        
        
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        }
  
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return tweets.count
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileCellId, for: indexPath) as! ProfileCell
            return cell
        } else {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: tweetCellId, for: indexPath) as! TweetCell
            let data = tweets[indexPath.item]
            cell1.tweet = data
            return cell1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 370)
        } else {
            if let tweet = tweets[indexPath.item] as? Tweet {
            let approximateWidthOfTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWidthOfTextView, height: 1000)
            let estimatedFrame = NSString(string: tweet.message).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 90)
        }
    }
}
}
