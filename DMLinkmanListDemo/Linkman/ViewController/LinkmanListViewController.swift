//
//  LinkmanListViewController.swift
//  DMLinkmanListDemo
//
//  Created by Gamin on 2020/2/21.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

class LinkmanListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var dataMArr: [LinkmanModel] = [];
    private var page: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "联系人列表";
        setupTableViewUI();
    }
    
    func setupTableViewUI() {
        // 设置透明，默认为NO控制器中y=0实际效果上=64，设置为YES时控制器中y=0实际效果上y=0
        navigationController?.navigationBar.isTranslucent = false;
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            tableView.insetsContentViewsToSafeArea = false;
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        tableView.estimatedRowHeight = 100;
        tableView.rowHeight = UITableView.automaticDimension;
        // 纯代码的cell
        //tableView.register(LinkmanListCell.self, forCellReuseIdentifier: "LinkmanListCell");
        // xib的cell
        tableView.register(UINib(nibName: "LinkmanListCell", bundle: nil), forCellReuseIdentifier: "LinkmanListCell");
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.refresh();
        });
        tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
            self.refreshMore();
        });
        refresh();
    }
    
    // 下拉刷新
    func refresh() {
        page = 0;
        dataMArr.removeAll();
        moniDataAction();
    }
    
    // 上拉加载
    func refreshMore() {
        page += 1;
        moniDataAction();
    }
    
    // 模拟数据
    func moniDataAction() {
        DispatchQueue.global().async { [weak self] in
            Thread.sleep(forTimeInterval: 1);
            var mnArr: [LinkmanModel] = [];
            for i in 0..<20 {
                let model = LinkmanModel();
                model.name = "姓名" + "\(i)";
                let num = arc4random()/100000;
                model.phone = "185023" + String(format: "%05d", num);
                model.work = "工作" + "\(i)";
                if (i == 2) {
                    model.work = nil;
                }
                mnArr.append(model);
            }
            self?.dataMArr += mnArr;
            self?.tableView.mj_header?.endRefreshing();
            self?.tableView.mj_footer?.endRefreshing();
            
            DispatchQueue.main.async {
                self?.tableView.reloadData();
            }
        }
    }

    // MARK: UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataMArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinkmanListCell", for: indexPath) as! LinkmanListCell;
        if (dataMArr.count > indexPath.row) {
            cell.cellModel = dataMArr[indexPath.row];
        } else {
            cell.cellModel = nil;
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? LinkmanListCell;
        let model = cell?.cellModel;
        
        //let details = LinkmanDetailsViewController(nibName: "LinkmanDetailsViewController", bundle: nil);
        let details = LinkmanDetailsViewController();
        details.listModel = model;
        details.jumpClick = { (mark) -> () in
            if (mark == 1) {
                self.tableView.reloadData();
            }
        }
        self.navigationController?.pushViewController(details, animated: true);
    }
}
