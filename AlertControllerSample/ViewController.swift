//
//  ViewController.swift
//  AlertControllerSample
//
//  Created by REO HARADA on 2017/02/08.
//  Copyright © 2017年 REO HARADA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 次の画面に移動するための招待コード
    // mbaasから取得して可変にしてあげると( ´∀｀)bｸﾞｯ!
    let code = "fukureMikan"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // セクションの数どうする？
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの数どうする？
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    // 各行のセルの中身どうする？
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "ニュース".appending("\(indexPath.row)")
        return cell
    }
    
    // 各行のセルの中身どうする？
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 招待コード入力アラート
        let alert = UIAlertController(title: "招待コードを入れてください", message: "招待コードは、「fukureMikan」", preferredStyle: UIAlertControllerStyle.alert)
        // 入力完了ボタン
        let button = UIAlertAction(title: "完了", style: UIAlertActionStyle.default) { (action) in
            // 入力完了ボタン押したらどうする？
            // 入力した文字を取得する
            if let text = alert.textFields?[0].text {
                if self.code == text {
                    // 入力した文字と招待コードが合っている場合
                    // 次の画面に移動する
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "StampRally画面")
                    self.show(vc!, sender: nil)
                }
                else {
                    // 入力した文字と招待コードが間違ってる場合
                    // エラーアラートを表示する
                    let errorAlert = UIAlertController(title: "招待コードが不正です", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                    let closeButton = UIAlertAction(title: "閉じる", style: UIAlertActionStyle.default, handler: nil)
                    errorAlert.addAction(closeButton)
                    self.present(errorAlert, animated: true, completion: nil)
                }
            }
        }
        // アラートとボタンを合体させる
        alert.addAction(button)
        // アラーとTextFieldを合体させる
        alert.addTextField { (textField) in
            // textFieldにプレスホルダーを設定する
            textField.placeholder = "招待コードを入力してください。"
            // パスワード用に設定する
            textField.isSecureTextEntry = true
        }
        
        // アラートを表示する
        self.present(alert, animated: true, completion: nil)
    }
}

