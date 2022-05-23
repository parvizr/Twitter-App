//
//  ViewController.swift
//  twitterApp
//
//  Created by javad on 11.03.22.
//

import UIKit

class UserController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    let headerID = "headerID"
    let footerID = "footerID"
    
    let tweetCellID = "TweetCellID"
    
    let users = [
         User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective - C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image") ),
         User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image")),
         User(name: "Bio Textview", username: "@btextview", bioText: "This recently released course provide some excellent guidance on how to use UITableView and UICollectionview. This course also teaches some basics on the Swift language, for example if statements and for loops. This will be an excellent purchase for you!", profileImage: #imageLiteral(resourceName: "ray_profile_image"))

    ]

    let tweets = [
        Tweet(user: User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective - C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image") ), message: "Hi guys, today I'm gonna try to make a textview. Inside of this textview I will try to put a name of the user and the username and I have to write more text here because to see how it looks when the text is longer."),
        Tweet(user: User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image")), message: "This recently released course provide some excellent guidance on how to use UITableView and UICollectionview. This course also teaches some basics on the Swift language, for example if statements and for loops. This will be an excellent purchase for you!")
    ]
    
    
    let navBarSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(red: 232/255, green: 236/255, blue: 241/255, alpha: 1)
        
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: tweetCellID)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView.register(SectionFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
        
        setupNavigationBarItems()
        setupNavBarSeparatorLayout()
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        
        //request API
//        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
//        guard let url = URL(string: urlString) else {return}
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    print("Failed to get data from url: \(error)")
//                    return
//                }
//            }
//            guard let data = data else {return}
//
//            do {
//                let result = try JSONDecoder().decode(Marvel.self, from: data)
//                print(result.name)
//
//            } catch let decodeError {
//                print(decodeError.localizedDescription)
//            }
//        } .resume()
    }
    


    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    
    func setupNavigationBarItems() {
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        let titleImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = #imageLiteral(resourceName: "title_icon")
            imageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        navigationItem.titleView = titleImageView
        
        let followButton: UIButton = {
            let btn = UIButton()
            btn.setImage(#imageLiteral(resourceName: "follow-1").withRenderingMode(.alwaysOriginal), for: .normal)
            btn.heightAnchor.constraint(equalToConstant: 34).isActive = true
            btn.widthAnchor.constraint(equalToConstant: 34).isActive = true
            return btn
        }()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        
        let searchButton: UIButton = {
            let btn = UIButton()
            btn.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
            btn.heightAnchor.constraint(equalToConstant: 34).isActive = true
            btn.widthAnchor.constraint(equalToConstant: 34).isActive = true
            return btn
        }()
        
        let composeButton: UIButton = {
            let btn = UIButton()
            btn.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
            btn.heightAnchor.constraint(equalToConstant: 34).isActive = true
            btn.widthAnchor.constraint(equalToConstant: 34).isActive = true
            return btn
        }()
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
    
    func setupNavBarSeparatorLayout() {
        view.addSubview(navBarSeparatorView)
        
        navBarSeparatorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navBarSeparatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navBarSeparatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navBarSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return users.count
        } else {
            return tweets.count
        }
        
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! UserCell
            let data = users[indexPath.item]
            cell.user = data
            cell.tapImageHandler = { [weak self] in
                let profileView = ProfileController(collectionViewLayout: UICollectionViewFlowLayout())
                profileView.hidesBottomBarWhenPushed = true
                self!.navigationController?.pushViewController(profileView, animated: true)
            }
            return cell
        } else {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: tweetCellID, for: indexPath) as! TweetCell
            let data = tweets[indexPath.item]
            cell1.tweet = data
            return cell1
        }
        
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! SectionHeader
            header.headerLabel.text = "WHO TO FOLLOW"

        
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath) as! SectionFooter
            footer.footerLabel.text = "Show me more"
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            return.zero 
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let user = users[indexPath.item] as? User {
            let approximateWidthOfTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWidthOfTextView, height: 1000)
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)], context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 88)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.height, height: 64)
    }
    
}





