//
//  ViewController.swift
//  challengeFinal
//
//  Created by Pietro Pugliesi on 09/10/20.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    var node1 = StoryNode(id: 0, text: "decisao1")
    var node2 = StoryNode(id: 1, text: "decisão2")
    var node3 = StoryNode(id: 2, text: "decisão3")
    var node4 = StoryNode(id: 3, text: "decisão4")
    var node5 = StoryNode(id: 4, text: "decisão5")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyNodes = [node1, node2, node3, node4, node5]
     
        node1.childNodeIDs = [2, 3]
        node3.childNodeIDs = [4]
        node4.childNodeIDs = [5]
        
        var i = 1
        for node in storyNodes{
            print("node\(i)child: \(node.childNodeIDs)")
            i += 1
        }
    }
}

