//
//  DetailViewController.swift
//  Clothing
//
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var mainTableView: UITableView!
    var model:MenuItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        mainTableView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        mainTableView.register(UINib(nibName: "DetailHeaderCell", bundle: nil), forCellReuseIdentifier: "DetailHeaderCell")
        mainTableView.register(UINib(nibName: "DetailListCell", bundle: nil), forCellReuseIdentifier: "DetailListCell")
        mainTableView.separatorStyle = .none
        self.navigationItem.title = "Detail"
        
    }
    
    
    @IBAction func clickBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 10:
            //加入购物车
            let cartAry = UserDefaults.standard.object(forKey: "cart") as? Array<String>
            var cartChangeAry = [String]()
            var isHas = false
            if let cartShopingAry = cartAry, cartShopingAry.count > 0 {
                for cartName in cartShopingAry {
                    if cartName == model?.name {
                        isHas = true
                    }
                    cartChangeAry.append(cartName)
                }
            }
            if isHas == true {
                let alertVC = UIAlertController(title: "prompt", message: "The item has been added to the shopping cart.", preferredStyle: .alert)
                let cancleAction = UIAlertAction(title: "cancle", style: .cancel, handler: nil)
                alertVC.addAction(cancleAction)
                self.present(alertVC, animated: true, completion: nil)
            } else {
                if let name = model?.name,!name.isEmpty {
                    cartChangeAry.append(name)
                    UserDefaults.standard.set(cartChangeAry, forKey:
                        "cart")
                    UserDefaults.standard.synchronize()
                }
            }
            
            break
        case 20:
            let goodShoppingVC = TGShoppingCartVC()
            self.navigationController?.pushViewController(goodShoppingVC, animated: true)
            break
        default:
            break
        }
    }
    
}

extension DetailViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            if let discount = model?.discount,!discount.isEmpty {
                return 4
            }
            return 3
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailHeaderCell",
                                                     for: indexPath) as! DetailHeaderCell
            cell.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
            cell.selectionStyle = .none
            if let images = model?.images {
                cell.cellModel(images)
            }
            return cell
        } else {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailListCell",
                                                         for: indexPath) as! DetailListCell
                cell.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
                cell.selectionStyle = .none
                cell.titleNameLabel.text = "name"
                cell.detailNameLabel.text = model?.name
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailListCell",
                                                         for: indexPath) as! DetailListCell
                cell.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
                cell.selectionStyle = .none
                cell.titleNameLabel.text = "price"
                cell.detailNameLabel.text = model?.price
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailListCell",
                                                         for: indexPath) as! DetailListCell
                cell.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
                cell.selectionStyle = .none
                cell.titleNameLabel.text = "productCode"
                cell.detailNameLabel.text = model?.productCode
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailListCell",
                                                         for: indexPath) as! DetailListCell
                cell.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
                cell.selectionStyle = .none
                cell.titleNameLabel.text = "discount"
                cell.detailNameLabel.text = model?.discount
                return cell
            }
            
        }
    }
}
extension DetailViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 220.0
        } else {
            return 40.0
        }
    }
}
