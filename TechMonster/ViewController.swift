//
//  ViewController.swift
//  TechMonster
//
//  Created by 篠田弥樹 on 2015/10/18.
//  Copyright (c) 2015年 篠田弥樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: NSTimer!
    var enemyTimer: NSTimer!
    
    var enemy: Enemy!
    var player: Player!
    
    let util: TechDraUtility = TechDraUtility()
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var attackButton: UIButton!
    
    @IBOutlet var enemyImageView: UIImageView!
    @IBOutlet var playerImageView: UIImageView!
    
    @IBOutlet var enemyHPBar: UIProgressView!
    @IBOutlet var playerHPBar: UIProgressView!
    
    @IBOutlet var enemyNameLabel: UILabel!
    @IBOutlet var playerNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        enemyHPBar.transform = CGAffineTransformMakeScale(1.0, 4.0)
        playerHPBar.transform =CGAffineTransformMakeScale(1.0, 4.0)
        initStatus()
        
        enemyTimer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(enemy.speed), target: self, selector: "enemyAttackk", userInfo: nil, repeats: true)
        enemyTimer.fire()
    }
    
    func initStatus() {
        enemy = Enemy()
        player = Player()
        
        enemyNameLabel.text = enemy.name
        playerNameLabel.text = player.name
        
        enemyImageView.image = player.image
        playerImageView.image = player.image
        
        enemyHPBar.progress = enemy.currentHP / enemy.maxHP
        playerHPBar.progress = player.currentHP / player.maxHP
        
        cureHP()
    }
    
    override func viewDidAppear(animated: Bool) {
        util.playBGM("BGM_battle001")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playerAttack() {
        TechDraUtility.damageAnimation(playerImageView)
        util.playSE("SE_attack")
        
        enemy.currentHP = enemy.currentHP - player.attackPoint
        enemyHPBar.setProgress(enemy.curretHP / enemy.maxHP, animated: true)
        
        if enemy.currentHP <= 0.0 {
            finishBattle(enemyImageView, winPlayer: true)
        }
    }
    func enemyAttack() {
        TechDraUtility.damageAnimation(playerImageView)
        util.playSE("SE_attack")
        
        player.currentHP = player.currentHP - player.attackPoint
        playerHPBar.setProgress(player.curretHP / enemy.maxHP, animated: false)
        
        if enemy.currentHP <= 0.0 {
            finishBattle(playerImageView, winPlayer: false)
        }
    }
    
    func finishBattle(vanishImageView
    


}

