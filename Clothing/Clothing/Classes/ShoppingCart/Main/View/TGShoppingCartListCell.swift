//
//  TGShoppingCartListCell.swift
//  TouGo
//
//  Created by xlkd 24 on 2019/3/7.
//  Copyright © 2019 xlkd 24. All rights reserved.
//

import UIKit

class TGShoppingCartListCell: UITableViewCell {

    lazy var centerBackView:UIView = {
        var centerBackView = UIView()
        centerBackView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        return centerBackView
    }()
    //中间商品信息
    lazy var goodsImageView:UIImageView = {
        var goodsImageView = UIImageView()
        goodsImageView.image = UIImage()
        return goodsImageView
    }()
    lazy var centerNumberNameLabel:UILabel = {
        var centerNumberNameLabel = UILabel()
        centerNumberNameLabel.text = "price:"
        centerNumberNameLabel.textColor = .black
        centerNumberNameLabel.font = UIFont.systemFont(ofSize: 13.0)
        centerNumberNameLabel.textAlignment = .left
        return centerNumberNameLabel
    }()
    lazy var centerMoneyNameLabel:UILabel = {
        var centerMoneyNameLabel = UILabel()
        centerMoneyNameLabel.text = "name:"
        centerMoneyNameLabel.textColor = .black
        centerMoneyNameLabel.font = UIFont.systemFont(ofSize: 13.0)
        centerMoneyNameLabel.textAlignment = .left
        return centerMoneyNameLabel
    }()

    lazy var centerGoodsNumberLabel:UILabel = {
        var centerGoodsNumberLabel = UILabel()
        centerGoodsNumberLabel.text = "productCode："
        centerGoodsNumberLabel.textColor = .black
        centerGoodsNumberLabel.font = UIFont.systemFont(ofSize: 13.0)
        centerGoodsNumberLabel.textAlignment = .left
        return centerGoodsNumberLabel
    }()


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCreatUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

}

extension TGShoppingCartListCell {
    func configCreatUI() {
        contentView.addSubview(centerBackView)
        centerBackView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }

        centerBackView.addSubview(goodsImageView)
        goodsImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.width.height.equalTo(STSizeWithNumber(176.0))
        }
        
        //中间商品信息
        centerBackView.addSubview(goodsImageView)
        goodsImageView.snp.makeConstraints { (make) in
            
        }
        
        centerBackView.addSubview(centerMoneyNameLabel)
        centerMoneyNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.goodsImageView.snp.right).offset(STSizeWithNumber(10.0))
            make.right.equalToSuperview()
            make.height.equalTo(14.0)
        }
        centerBackView.addSubview(centerNumberNameLabel)
        centerNumberNameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.centerMoneyNameLabel.snp.top).offset(-5.0)
            make.left.equalTo(self.goodsImageView.snp.right).offset(STSizeWithNumber(10.0))
            make.right.equalToSuperview()
            make.height.equalTo(14.0)
        }
        centerBackView.addSubview(centerGoodsNumberLabel)
        centerGoodsNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.centerMoneyNameLabel.snp.bottom).offset(5.0)
            make.left.equalTo(self.goodsImageView.snp.right).offset(STSizeWithNumber(10.0))
            make.right.equalToSuperview()
            make.height.equalTo(14.0)
        }
    }
    
    func STSizeWithNumber(_ number : CGFloat) -> CGFloat {
        return UIScreen.main.bounds.size.width * number / 750.0
    }

}

extension TGShoppingCartListCell {
    
    func cellModel<T>(_ a: T) {
        if a is MenuItem {
            let model = a as? MenuItem
            if let image = model?.image,!image.isEmpty {
                
                self.goodsImageView.image = UIImage(named: image)
            
                self.centerMoneyNameLabel.text = "name:\(model?.name ?? "")"
                self.centerNumberNameLabel.text = "price:\(model?.price ?? "")"
                self.centerGoodsNumberLabel.text = "productCode:\(model?.productCode ?? "")"
            }
        } else {
            
        }
    }
}

