//
//  TGShoppingCartVC.swift
//  TouGo
//
//

import UIKit

class TGShoppingCartVC: UIViewController {

    lazy var mainTableView:UITableView = {
        var mainTableView = UITableView()
        
        mainTableView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        mainTableView.register(TGShoppingCartListCell.classForCoder(), forCellReuseIdentifier: "TGShoppingCartListCell")
        mainTableView.separatorStyle = .none
        //ios11 防止跳动
        mainTableView.estimatedRowHeight = 0
        mainTableView.estimatedSectionFooterHeight = 0
        mainTableView.estimatedSectionHeaderHeight = 0
        return mainTableView
    }()
    lazy var rightEditBtn:UIButton = {
        var rightEditBtn = UIButton()
        rightEditBtn.setTitle("buy", for: .normal)
        rightEditBtn.setTitle("buy", for: .selected)
        rightEditBtn.setTitleColor(.white, for: .normal)
        rightEditBtn.setTitleColor(.white, for: .selected)
        rightEditBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        rightEditBtn.isSelected = false
        return rightEditBtn
    }()
    var menuItems: [MenuItem] = []
    
    fileprivate var currentIndexPath:IndexPath?
    fileprivate var goodsBuyParameters:Dictionary<String,String>?
    fileprivate var goodsDelectCartId:Array<String>?
//    lazy var footBtnBackView:TGShoppingCartBottomBackView = {
//        var footBtnBackView = TGShoppingCartBottomBackView(model: nil, isEdit: false, {[unowned self] (modelAry, tag) in
//
//
////            self.configSubmitOrder(modelAry:modelAry,tag:tag)
////            }, {[unowned self] (model) in
////                self.configAllSelectAction(model:model)
////
////        })
//        return footBtnBackView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBaseView()
        configData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    func configData() {
        menuItems.removeAll()
        let tempModelAry = MenuItemsManager.sharedManager.loadData()
        let cartAry = UserDefaults.standard.object(forKey: "cart") as? Array<String>
        if let cartShopingAry = cartAry, cartShopingAry.count > 0 {
            for name in cartShopingAry {
                for model in tempModelAry {
                    if model.name == name {
                        menuItems.append(model)
                    }
                }
            }
        }
        self.mainTableView.reloadData()
    }
    
    func configBaseView() {
        
        self.edgesForExtendedLayout = [];
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        self.navigationItem.title = "Shopping Cart"
        self.mainTableView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        self.mainTableView.separatorStyle = .none
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        
        self.rightEditBtn.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        self.rightEditBtn.addTarget(self, action: #selector(editBtnAction(_:)), for: .touchUpInside)
        navigationItem.rightBarButtonItem =  UIBarButtonItem(customView: self.rightEditBtn)
//        self.configRightBtnStatus(isHidden: true)
//        self.view.addSubview(self.footBtnBackView)
//        self.footBtnBackView.snp.makeConstraints { (make) in
//            make.left.right.bottom.equalToSuperview()
//            make.height.equalTo(STSizeWithNumber(98.0))
//        }
//        self.footBtnBackView.isHidden = true
//        self.footBtnBackView.isUserInteractionEnabled = false
        self.view.addSubview(self.mainTableView)
        self.mainTableView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(0.0)
//            make.bottom.equalTo(self.footBtnBackView.snp.top)
        }
        
    }
    
    @objc func editBtnAction(_ sender:UIButton) {

//        self.rightEditBtn.isSelected = !sender.isSelected
//        self.footBtnBackView.configChangeData(isEdit: self.rightEditBtn.isSelected)
    }
    
    func STSizeWithNumber(_ number : CGFloat) -> CGFloat {
        return UIScreen.main.bounds.size.width * number / 750.0
    }
}

extension TGShoppingCartVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuItems.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TGShoppingCartListCell",
                                                 for: indexPath) as! TGShoppingCartListCell
        
        if menuItems.count > 0 {
            cell.cellModel(menuItems[indexPath.section])
        } else {
            cell.cellModel("")
        }
        
        cell.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        cell.selectionStyle = .none
        return cell
        
    }
    
}
extension TGShoppingCartVC :UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return STSizeWithNumber(180.0)

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return STSizeWithNumber(10.0)
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        return view
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let alertController = UIAlertController(title: "Reminder", message: "Confirm delete the selected shopping cart item?", preferredStyle: .alert)
            let cancleAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let enterAction = UIAlertAction(title: "Yes", style: .default) { action in
                
//                let model = self.menuItems[indexPath.section]
                var cartChangeAry = [String]()
                for (index,model) in self.menuItems.enumerated() {
                    if index != indexPath.section {
                        if !model.name.isEmpty {
                            cartChangeAry.append(model.name)
                        }
                    }
                }
                if cartChangeAry.count > 0 {
                    UserDefaults.standard.set(cartChangeAry, forKey:
                        "cart")
                    UserDefaults.standard.synchronize()
                    self.configData()
                }
                
            }
            alertController.addAction(cancleAction)
            alertController.addAction(enterAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}

extension TGShoppingCartVC {
    
//    //MARK: -- 页面显示
//    fileprivate func configNetWorkBaseView(netModel:TGShoppingCartListModel?) {
//
//        guard let model = netModel else {
//            return
//        }
//        if let dataAry = model.data,dataAry.count > 0 {
//            self.viewModel.shoppingCartListModel?.data = self.configBottomData(dataAry: dataAry)
//            self.footBtnBackView.isHidden = false
//            self.footBtnBackView.isUserInteractionEnabled = true
//            self.footBtnBackView.configChangeData(model: self.viewModel.shoppingCartListModel)
//            self.footBtnBackView.configChangeData(isEdit: false)
//            self.tableViewToBottomWidth?.update(offset: -STSizeWithNumber(98.0))
//            self.configRightBtnStatus(isHidden: false)
//        } else {
//            self.footBtnBackView.isHidden = true
//            self.footBtnBackView.configChangeData(model: nil)
//            self.footBtnBackView.configChangeData(isEdit: false)
//            self.footBtnBackView.isUserInteractionEnabled = false
//            self.tableViewToBottomWidth?.update(offset: 0.00)
//            self.configRightBtnStatus(isHidden: true)
//        }
//    }
//    fileprivate func configRightBtnStatus(isHidden:Bool) {
//        self.rightEditBtn.isHidden = isHidden
//        self.rightEditBtn.isUserInteractionEnabled = !isHidden
//    }
//
//    fileprivate func configBottomData(dataAry:Array<TGShoppingCartListModelData>) -> Array<TGShoppingCartListModelData> {
//        var dataMutAry = [TGShoppingCartListModelData]()
//        for model in dataAry {
//            var changeModel = model
//            if let status = model.status, status == STAppGoodsStatusType.NORMAL.rawValue {
//                changeModel.isSelect = true
//            } else {
//                changeModel.isSelect = false
//            }
//            dataMutAry.append(changeModel)
//        }
//        return dataMutAry
//    }
//    //MARK: -- 全选事件
//    fileprivate func configAllSelectAction(model:TGShoppingCartListModel?) {
//        self.viewModel.shoppingCartListModel = model
//        self.mainTableView.reloadData()
//        self.footBtnBackView.configChangeData(model: self.viewModel.shoppingCartListModel)
//
//    }
//    //MARK: -- 提交事件
//    fileprivate func configSubmitOrder(modelAry:Array<TGShoppingCartListModelData>,tag:Int) {
//        switch tag {
//        case 10:
//            let alertController = UIAlertController(title: "Reminder", message: "Confirm delete the selected shopping cart item?", preferredStyle: .alert)
//            let cancleAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
//            let enterAction = UIAlertAction(title: "Yes", style: .default) { action in
//                self.configDelectGoods(modelAry: modelAry)
//            }
//            alertController.addAction(cancleAction)
//            alertController.addAction(enterAction)
//            self.present(alertController, animated: true, completion: nil)
//            break
//        case 20:
//            var cartIdAry = [String]()
//            var goodId = ""
//            for model in modelAry {
//                goodId = model.goodsId ?? ""
//                let buyNumber = model.number ?? 0
//                let vipCardNumber = model.vipMinNumber ?? 0
//                if buyNumber < vipCardNumber {
//                    STProgressHUD.showError(String(format: "%@,\n规格：%@ 最低购买数量%ld",model.goodsName ?? "",model.attrContent ?? "",vipCardNumber))
//                    return
//                }
//                if let cartId = model.cartId,!cartId.isEmpty {
//                    cartIdAry.append(cartId)
//                }
//            }
//            if cartIdAry.count > 0 {
//                var buyParameters = ["cartIds":STManagerTool.getJSONStringFromArray(array: cartIdAry as NSArray),"orderSource":"APP"]
//                self.outPut?.checkOrderSheetSuccessDataCommand.onNext(buyParameters)
//                buyParameters["goodsId"] = goodId
//                self.goodsBuyParameters = buyParameters
//
//
//            }
//            break
//        case 30:
//            break
//        default:
//            break
//        }
//    }
//
//
//    ///
//    /// - Parameters:
//
//
//
//    fileprivate func configChangeAction(tag:Int,model:TGShoppingCartListModelData,currentIndex:IndexPath) {
//        self.currentIndexPath = currentIndex
//        switch tag {
//        case 10:
//            
//            if let modelAry = self.viewModel.shoppingCartListModel?.data,modelAry.count > 0 {
//                var changeModelAry = modelAry
//                changeModelAry[currentIndex.section] = model
//                self.viewModel.shoppingCartListModel?.data = changeModelAry
//                self.footBtnBackView.configChangeData(model: self.viewModel.shoppingCartListModel)
//                self.mainTableView.reloadSections(IndexSet(integer: currentIndex.section), with: .none)
//            }
//            break
//        case 20:
//
//            self.configDelectGoods(modelAry: [model])
//            break
//        case 30:
//
//            if let cartId = model.cartId,!cartId.isEmpty {
//                self.outPut?.shoppingCartChangeNumberDataCommand.onNext(["status":STAppShoppingCartNumberChangeType.ADD.rawValue,"cartId":cartId])
//            }
//            break
//        case 40:
//
//            if let cartId = model.cartId,!cartId.isEmpty {
//                self.outPut?.shoppingCartChangeNumberDataCommand.onNext(["status":STAppShoppingCartNumberChangeType.LESS.rawValue,"cartId":cartId])
//            }
//            break
//        default:
//            break
//        }
//    }
//
//
//    fileprivate func configChangeNumberSuccess(model:TGShoppingCartChangeNumberModelData) {
//        guard let dataAry = self.viewModel.shoppingCartListModel?.data,dataAry.count > 0 else {
//            return
//        }
//        guard let currentIndex = self.currentIndexPath else {
//            return
//        }
//        var dataChangeAry = dataAry
//        var goodsModel = dataAry[currentIndex.section]
//        goodsModel.number = model.number
//        goodsModel.subtotal = model.subtotal
//        dataChangeAry[currentIndex.section] = goodsModel
//        self.viewModel.shoppingCartListModel?.data = dataChangeAry
//        self.configNetWorkBaseView(netModel: self.viewModel.shoppingCartListModel)
//        self.mainTableView.reloadSections(IndexSet(integer: currentIndex.section), with: .none)
//    }
//
//    fileprivate func configDelectGoods(modelAry:Array<TGShoppingCartListModelData>) {
//        var cartIdAry = [String]()
//        for model in modelAry {
//            if let cartId = model.cartId,!cartId.isEmpty {
//                cartIdAry.append(cartId)
//            }
//        }
//        if cartIdAry.count > 0 {
//            self.goodsDelectCartId = cartIdAry
//            self.outPut?.shoppingCartDelectDataCommand.onNext(["cartIdList":STManagerTool.getJSONStringFromArray(array: cartIdAry as NSArray)])
//        }
//    }
//
//    fileprivate func configModelDelectCartId() {
//        guard let dataAry = self.viewModel.shoppingCartListModel?.data,dataAry.count > 0 else {
//            return
//        }
//        var changeModelDataAry = dataAry
//        if let goodsDelectCartIdAry = self.goodsDelectCartId,goodsDelectCartIdAry.count > 0 {
//            for cartId in goodsDelectCartIdAry {
//
//                changeModelDataAry = configChangeData(cartId: cartId, dataAry: changeModelDataAry)
//            }
//        }
//        self.viewModel.shoppingCartListModel?.data = changeModelDataAry
//    }
//
//    fileprivate func configChangeData(cartId:String,dataAry:Array<TGShoppingCartListModelData>) -> Array<TGShoppingCartListModelData> {
//        let changeAry = dataAry.filter { (model) -> Bool in
//            if let changeCartId = model.cartId,changeCartId == cartId {
//
//                return false
//            } else {
//                
//                return true
//            }
//        }
//        return changeAry
//    }
    
    
}
