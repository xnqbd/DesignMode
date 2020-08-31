//
//  main.swift
//  Mac
//
//  Created by admin2 on 2020/6/8.
//  Copyright © 2020 admin2. All rights reserved.
//

import Foundation


class Cat: NSObject {
    var name = ""
}



class Person: NSObject {
    var name = ""
}

let per = Person()
per.name = "这是"





DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 2) {
    
}

RunLoop.current.run()


//
//struct MyError: Error {
//    var msg = ""
//}
//
//let chuBlock = { (a: Int, b: Int) throws -> Int in
//    if b == 0 {
//        throw MyError(msg: "0不能做除数")
//    }
//    return a / b
//}
//
//func test7(block: (Int, Int) throws -> Int, a: Int, b: Int) rethrows {
//    print(try block(a, b))
//}
//
//do {
//    try test7(block: chuBlock, a: 10, b: 0)
//} catch {
//    print(error)
//}
//

//test7(block: { (num1, num2) -> Int in
//
//}, a: 10, b: 0)



//
//func test1() {
//    print(try! test(a: 1, b: 0))
////    do {
////        print(try test(a: 1, b: 0))
////    } catch {
////        print("错误")
////    }
////
////    print("test 1  完毕")
//}


//do {
//    try test1()
//} catch {
//
//}

//test1()

//try test1()

//func test2() {
//
//}


//print(try test(a: 1, b: 0))


//print(try test(a: 1, b: 0))

//
//do {
//    let res = try test(a: 9, b: 0)
//    print(res)
//} catch let err {
//    print("\(err)  \(#line)")
//}



//class SimpleClass {
//    var value = 0
//    var name = ""
//    init(_ name: String) {
//        self.name = name
//    }
//
//    func open() {
//        print("打开文件")
//    }
//
//    func close() {
//        print("关闭文件")
//    }
//
//    func test() {
//        print("test")
//    }
//
//    func processFile() throws {
//        defer {
//            self.close()
//        }
//
//        defer {
//            test()
//        }
//        self.open()
//
//        print("你好")
//    }
//}
//let x = SimpleClass("x")
//
//try x.processFile()

//
//let nu = 10
//
//
//
//let aaa = nu

//func test2(a: Int) {
//    let num = a
//    print(num)
//}
//
//
//test2(a: 10)
//test2(a: 12)

//func test() {
//    class SimpleClass {
//        var value = 0
//        var name = ""
//        init(_ name: String) {
//            self.name = name
//        }
//        deinit {
//            print("销毁", self.name)
//        }
//    }
//    let x = SimpleClass("x")
//    let y = SimpleClass("y")
//
//    let closure1 = { [x] in // 这个捕获列表等价于  closure1  会强引用x和y， 在closure1销毁之前，x和y 是不会销毁的， 亲测
//        print(x.value, y.value)  // 2秒后打印出 10 10
//    }
//
////    let closure1 = { [weak x] in //  closure1 弱引用x，强引用y， 在closure2销毁之前，y 不会销毁的， 亲测
////        print(x?.value, y.value)  //test函数执行完毕后，x会立刻销毁， 2秒后打印出 nil 10
////    }
//
//    x.value = 10
//    y.value = 10
//
//    DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 2) {
//        print("2秒后")
//        closure1()
//    }
//}
//
//test()




//class Origin {
//    var x = 0
//    var y = 0
//
//     func setX(x: Int) {
//        self.x = x
//    }
//}
//
//
//var ori = Origin()
//ori.setX(x: 3)
//print(ori.x)
//
//
//
//
//print("执行")
//RunLoop.current.run()





//
//let arr = ["9", "2", "ckj", "s", nil, "xks"]
//print(arr.prefix(through: 3))
//let res = arr.flatMap { (i) -> String in
//    i ?? "" + "👌"
//}

//var res = arr[2...5]
//
//print(res)
//
//let aa = Optional("7")

//let aa = Optional(6)
////let res = aa.map { (k) -> Int in
////    k * 2
////}
//let res = aa.flatMap{ Optional($0 * 2)}
//
//let hh = Optional(10)
//
//if Optional.some(10) == nil {
//    print("空")
//}


//print(res)

//let jj = Optional.some(nil)

//
//let a: Int? = 2
//
//let aa: Int?? = a
//
//
//print(aa)
//print(aa!)
//print(aa!!)

//let ddd = aa!!!
//let a = ddd!

//
//let res = arr.map { (i) -> String in
//    return i + "👌"
//}
//
//print(res)
//


//let name: String? = "ckj"
//
//let res = name.map { (m) -> String in
//    m + "😜"
//}
//print(res)



/// 适配器模式







//// 命令模式
//let waiter = Waiter()
//
//let kaochuanShifu = KaoChuanShifu()
//let kaochuanCommand = KaoChuanCommand(receiver: kaochuanShifu)
//
//waiter.setCommand(command: kaochuanCommand)
//waiter.startExeCommand()
//
//
//let noodleShifu = NoodleShifu()
//let noodleCommand = NoodleCommand(receiver: noodleShifu)
//
//waiter.setCommand(command: noodleCommand)
//waiter.startExeCommand()
//
//
//
//
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
