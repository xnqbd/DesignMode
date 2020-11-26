//
//  main.swift
//  DesignMode
//
//  Created by admin2 on 2020/11/26.
//

import Foundation


//// 命令模式
let waiter = Waiter()

let kaochuanShifu = KaoChuanShifu()
let kaochuanCommand = KaoChuanCommand(receiver: kaochuanShifu)

waiter.setCommand(command: kaochuanCommand)
waiter.startExeCommand()


let noodleShifu = NoodleShifu()
let noodleCommand = NoodleCommand(receiver: noodleShifu)

waiter.setCommand(command: noodleCommand)
waiter.startExeCommand()



//// 装饰者模式
//var competitor: Competitor = Singer()
//
//competitor = Dancer(wrapp: competitor)
//competitor = PlayMusic(wrapp: competitor)
//
//competitor.show()
//
//
//var bev: WDBeverage = WDJianBing()
//print(bev.des(), bev.cost())
//
//bev = Egg(wrapp: bev)
//print(bev.des(), bev.cost())
//
//bev = XiangChang(wrapp: bev)
//print(bev.des(), bev.cost())
//


