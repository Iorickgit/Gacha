//
//  ResultViewController.swift
//  Gacha
//
//  Created by 南伊織 on 6/8/16.
//  Copyright © 2016 南伊織. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    //背景の宣言
    @IBOutlet var haikeiImageView: UIImageView!
    //出てくるモンスターの宣言
    @IBOutlet var monsterImageView: UIImageView!
    //モンスターを入れる画像を集めたアレイ
    var monsterArray: [UIImage]!
    //Load時のファンクション
    override func viewDidLoad() {
        super.viewDidLoad()
        //Randomで数字を生成
        let number = Int(rand() % 10)
        //monsterArrayの中身を作る
        monsterArray = [
            UIImage(named: "monster001.png")!,
            UIImage(named: "monster002.png")!,
            UIImage(named: "monster003.png")!,
            UIImage(named: "monster004.png")!,
            UIImage(named: "monster005.png")!,
            UIImage(named: "monster006.png")!,
            UIImage(named: "monster007.png")!,
            UIImage(named: "monster008.png")!,
            UIImage(named: "monster009.png")!,
            UIImage(named: "monster010.png")!
        ]
        
        print (number)
        //monsterImageViewのイメージはmonsterArrayの生成された数字番目を入れるよー
        monsterImageView.image = monsterArray[number]
        //もしも数字が９なら背景の画像はgold　6より大きいなら赤　他は青のBGをhaikeiImageViewに入れますー
        if number == 9{
            haikeiImageView.image = UIImage(named: "bg_gold.png")
        }else if number > 6{
            haikeiImageView.image = UIImage(named: "bg_red.png")
        }else{
            haikeiImageView.image = UIImage(named: "bg_blue.png")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //このViewが出てきたら（boolでtrue)したのアニメーションを行いますよー
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        //animationのキーパスを指定
        let animation = CABasicAnimation(keyPath: "transform")
        //アニメーションの開始時の数値
        animation.fromValue = NSNumber(double:0)
        //アニメーション終了時の数値
        animation.toValue = NSNumber(double: 2 * M_PI)
        //Z軸を中心としたアニメーションを行う
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        //アニメーションの速さを指定する
        animation.duration = 5
        //アニメーションの繰り返す回数の指定
        animation.repeatCount = Float.infinity
        //指定したキーをもとにanimationを行います
        haikeiImageView.layer.addAnimation(animation, forKey: nil)
    }
    
    @IBAction func modoru(){
        self.dismissViewControllerAnimated(true,completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
