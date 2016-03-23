//
//  Colors.swift
//  Planets
//
//  Created by Ethan Hess on 3/21/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

import UIKit

var randomIntOne = CGFloat(arc4random_uniform(255))
var randomIntTwo = CGFloat(arc4random_uniform(255))
var randomIntThree = CGFloat(arc4random_uniform(255))

var randomIntFour = CGFloat(arc4random_uniform(255))
var randomIntFive = CGFloat(arc4random_uniform(255))
var randomIntSix = CGFloat(arc4random_uniform(255))

var randomIntSeven = CGFloat(arc4random_uniform(255))
var randomIntEight = CGFloat(arc4random_uniform(255))
var randomIntNine = CGFloat(arc4random_uniform(255))

struct Colors {

static let randomOne = UIColor(red: randomIntOne / 255.0, green: randomIntTwo / 255.0, blue: randomIntThree / 255.0, alpha: 1.0)

static let randomTwo = UIColor(red: randomIntFour / 255.0, green: randomIntFive / 255.0, blue: randomIntSix / 255.0, alpha: 1.0)

static let randomThree = UIColor(red: randomIntSeven / 255.0, green: randomIntEight / 255.0, blue: randomIntNine / 255.0, alpha: 1.0)
}