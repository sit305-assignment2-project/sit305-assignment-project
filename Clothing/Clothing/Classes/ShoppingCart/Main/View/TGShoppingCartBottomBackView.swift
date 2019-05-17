//
//  TGShoppingCartBottomBackView.swift
//  TouGo
//
//

import UIKit

class TGShoppingCartBottomBackView: UIView {

    lazy var backView:UIView = {
        var backView = UIView()
        backView.backgroundColor = .white
        return backView
    }()
    lazy var leftBackView:UIView = {
        var leftBackView = UIView()
        leftBackView.backgroundColor = .white
        return leftBackView
    }()
    lazy var leftNameLabel:UILabel = {
        var leftNameLabel = UILabel()
        leftNameLabel.text = "Select all"
        leftNameLabel.textColor = .black
        leftNameLabel.font = UIFont.systemFont(ofSize: 15.0)
        leftNameLabel.textAlignment = .center
        return leftNameLabel
    }()
    lazy var leftImageView:UIImageView = {
        var leftImageView = UIImageView()
        leftImageView.image = UIImage.init(named: "chooseDary22")
        return leftImageView
    }()
    lazy var leftBtn:UIButton = {
        var leftBtn = UIButton()
        leftBtn.backgroundColor = .clear
        leftBtn.tag = 10
        return leftBtn
    }()

    lazy var centerBackView:UIView = {
        var centerBackView = UIView()
        centerBackView.backgroundColor = .white
        return centerBackView
    }()
    lazy var centerNameLabel:UILabel = {
        var centerNameLabel = UILabel()
        centerNameLabel.text = "total:"
        centerNameLabel.textColor = .black
        centerNameLabel.font = UIFont.systemFont(ofSize: 14.0)
        centerNameLabel.textAlignment = .right
        return centerNameLabel
    }()
    lazy var enterBackView:UIView = {
        var enterBackView = UIView()
        enterBackView.backgroundColor = .white
        return enterBackView
    }()
    lazy var enterBtn:UIButton = {
        var enterBtn = UIButton()
        enterBtn.setTitle("Settlement", for: .normal)
        enterBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17.0)
        enterBtn.setTitleColor(.white, for: .normal)
        enterBtn.setBackgroundImage(UIColor.imageFromColor(color: .red, viewSize: CGSize(width: 104.0, height: STSizeWithNumber(100.0))), for: .normal)
        enterBtn.setBackgroundImage(UIColor.imageFromColor(color: UIColor.lightGray, viewSize: CGSize(width: 104.0, height: STSizeWithNumber(100.0))), for: .disabled)
        enterBtn.tag = 20
        return enterBtn
    }()



//    fileprivate var isEdit:Bool?
//    fileprivate var model:TGShoppingCartListModel?
//    fileprivate var selectDataModelAry = [TGShoppingCartListModelData]()
//    fileprivate var currentEidt:Bool = false
//    fileprivate var enterBtnStatus:Bool = false {
//        didSet {
//            self.enterBtn.isEnabled = enterBtnStatus
//        }
//    }
//    public var enterBtnBlock:((Array<TGShoppingCartListModelData>,Int) -> Void)!
//    public var enterClickAllBtnBlock:((TGShoppingCartListModel?) -> Void)!
//
//    convenience init(model:TGShoppingCartListModel?,isEdit:Bool, _ enterBtnBlock: @escaping (Array<TGShoppingCartListModelData>,Int) -> Void,_ enterClickAllBtnBlock: @escaping (TGShoppingCartListModel?) -> Void) {
//        self.init()
//        self.enterBtnBlock = enterBtnBlock
//        self.enterClickAllBtnBlock = enterClickAllBtnBlock
//        self.isEdit = isEdit
//        layoutUI()
//        configChangeData(isEdit: isEdit)
//        configChangeData(model: model)
//    }
//
//    func layoutUI() {
//
//        addSubview(backView)
//        backView.snp.makeConstraints { (make) in
//            make.left.right.top.bottom.equalToSuperview()
//        }
//
//        backView.addSubview(enterBackView)
//        enterBackView.snp.makeConstraints { (make) in
//            make.bottom.right.top.equalToSuperview()
//            make.width.equalTo(104.0)
//        }
//        backView.addSubview(leftBackView)
//        leftBackView.snp.makeConstraints { (make) in
//            make.left.top.bottom.equalToSuperview()
//            make.width.equalTo(80.0)
//        }
//        backView.addSubview(centerBackView)
//        centerBackView.snp.makeConstraints { (make) in
//            make.top.bottom.equalToSuperview()
//            make.left.equalTo(self.leftBackView.snp.right)
//            make.right.equalTo(self.enterBackView.snp.left)
//        }
//        enterBackView.addSubview(enterBtn)
//        enterBtn.addTarget(self, action: #selector(clickBtnAction(_:)), for: .touchUpInside)
//        enterBtn.snp.makeConstraints { (make) in
//            make.left.right.top.bottom.equalToSuperview()
//        }
//
//        leftBackView.addSubview(leftImageView)
//        leftImageView.snp.makeConstraints { (make) in
//            make.left.equalToSuperview().offset(STSizeWithNumber(30.0))
//            make.centerY.equalToSuperview()
//            make.height.width.equalTo(STSizeWithNumber(44.0))
//        }
//        leftBackView.addSubview(leftNameLabel)
//        leftNameLabel.snp.makeConstraints { (make) in
//            make.left.equalTo(self.leftImageView.snp.right)
//            make.right.equalToSuperview()
//            make.centerY.equalToSuperview()
//        }
//        leftBackView.addSubview(leftBtn)
//        leftBtn.addTarget(self, action: #selector(clickBtnAction(_:)), for: .touchUpInside)
//        leftBtn.snp.makeConstraints { (make) in
//            make.left.right.top.bottom.equalToSuperview()
//        }
//
//        centerBackView.addSubview(centerNameLabel)
//        centerNameLabel.snp.makeConstraints { (make) in
//            make.left.equalTo(self.leftBackView.snp.right)
//            make.right.equalTo(self.enterBackView.snp.left).offset(-STSizeWithNumber(10.0))
//            make.centerY.equalToSuperview()
//        }
//
//    }
//
//
//    @objc func clickBtnAction(_ sender:UIButton) {
//        switch sender.tag {
//        case 10:
//            self.configChangeAll(model: self.model)
//            break
//        case 20:
//            if self.selectDataModelAry.count > 0 {
//                if self.enterBtnBlock != nil {
//                    self.enterBtnBlock!(self.selectDataModelAry,self.currentEidt ? 10:20)
//                }
//            }
//            break
//        default:
//            break
//        }
//
//    }
    
    func STSizeWithNumber(_ number : CGFloat) -> CGFloat {
        return UIScreen.main.bounds.size.width * number / 750.0
    }
}

extension TGShoppingCartBottomBackView {
    
//    func configChangeData(model:TGShoppingCartListModel?) {
//        self.selectDataModelAry.removeAll()
//        self.model = model
//        if let dataAry = model?.data,dataAry.count > 0 {
//            let changeDataAry = dataAry.filter { (model) -> Bool in
//                if let status = model.status,status == STAppGoodsStatusType.NORMAL.rawValue {
//                    return true
//                } else {
//                    return false
//                }
//            }
//            for changeModel in changeDataAry {
//                if changeModel.isSelect {
//                    self.selectDataModelAry.append(changeModel)
//                }
//            }
//
//            if self.selectDataModelAry.count == changeDataAry.count {
//                self.leftImageView.image = UIImage.init(named: "chooseSelect22")
//            } else {
//                self.leftImageView.image = UIImage.init(named: "chooseDary22")
//            }
//
//            var price:Float = 0.0
//            for changeModel in self.selectDataModelAry {
//                if let subtotal = changeModel.subtotal {
//                    price = price + subtotal
//                }
//            }
//
//            self.enterBtnStatus = price > 0 ? true:false
//            let text = NSMutableAttributedString(string: "合计:")
//            text.yy_setColor(.black, range: text.yy_rangeOfAll())
//            let colorText = NSMutableAttributedString(string: String(format: "￥%.2f",price))
//            colorText.yy_setColor(.red, range: colorText.yy_rangeOfAll())
//            text.append(colorText)
//            self.centerNameLabel.attributedText = text
//
//        } else {
//            self.leftImageView.image = UIImage.init(named: "chooseDary22")
//            self.centerNameLabel.text = "合计:"
//        }
//    }
//    func configChangeData(isEdit:Bool) {
//        self.centerNameLabel.isHidden = isEdit
//        self.enterBtn.setTitle( isEdit ? "删除":"结算", for: .normal)
//        self.currentEidt = isEdit
//
//    }
//
//    fileprivate func configChangeAll(model:TGShoppingCartListModel?) {
//
//        if self.selectDataModelAry.count > 0 {
//            if let dataAry = model?.data,dataAry.count > 0 {
//                let changeDataAry = dataAry.filter { (model) -> Bool in
//                    if let status = model.status,status == STAppGoodsStatusType.NORMAL.rawValue {
//                        return true
//                    } else {
//                        return false
//                    }
//                }
//                if self.selectDataModelAry.count == changeDataAry.count {
//                    self.configChangeModelSelect(isSelect: false)
//                } else {
//                    self.configChangeModelSelect(isSelect: true)
//                }
//            }
//
//        } else {
//            self.configChangeModelSelect(isSelect: true)
//        }
//
//    }
//
//    fileprivate func configChangeModelSelect(isSelect:Bool) {
////        var modelAry = [TGShoppingCartListModelData]()
////        if let dataAry = model?.data,dataAry.count > 0 {
////            for model in dataAry {
////                var changeModel = model
////                changeModel.isSelect = isSelect
////                modelAry.append(changeModel)
////            }
////        }
////        self.model?.data = modelAry
////        if self.enterClickAllBtnBlock != nil {
////            self.enterClickAllBtnBlock!(self.model)
////        }
//    }
    
    
}
