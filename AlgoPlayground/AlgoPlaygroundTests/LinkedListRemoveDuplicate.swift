//
//  LinkedListRemoveDuplicate.swift
//  AlgoPlaygroundTests
//
//  Created by Fernando Putallaz on 18/11/2024.
//

/*
    ** Prompt **
 
    You're given the head of a Singly Linked List whose nodes are in sorted order with respect to their values.
    Write a function that returns a modified version of the Linked List that doesn't contain any nodes with duplicate values.
 
    The linked list should be modified in place (i.e., you shouldn't create a brand new Linked List), and the modified should still have its
    nodes sorted with respect to their values.
 
    Each `LinkedList` node has an integer `value` as well as a `next` node pointing to the next node in the list or `non/nil` if it's the tail
    of the list.
 
 */


import XCTest

class LinkedListRemoveDuplicateEngine {
    class LinkedList {
        var value: Int
        var next: LinkedList?
        
        init(value: Int) {
            self.value = value
        }
        
        func removeDuplicates(_ linkedList: LinkedList) -> LinkedList {
            var currentNode: LinkedList? = linkedList
            
            while currentNode != nil {
                while currentNode?.value == currentNode?.next?.value {
                    currentNode?.next = currentNode?.next?.next
                }
                
                currentNode = currentNode?.next
            }
            
            return linkedList
        }
        
        func printList(_ head: LinkedList?) {
            var currentNode = head
            
            while let node = currentNode {
                print(node.value, terminator: " -> ")
                currentNode = node.next
            }
            
            print("nil")
        }
    }
}


final class LinkedListRemoveDuplicate: XCTestCase {
    func test_linkedList_printLinkedList() {
        let node1 = LL(value: 1)
        let node2 = LL(value: 2)
        let node3 = LL(value: 3)
        let node4 = LL(value: 4)
            
        node1.next = node2
        node2.next = node3
        node3.next = node4
        
        let sut = makeSUT(head: node1)
        
        sut.printList(node1)
    }
    
    func test_initalWriteRead() {
        let node1 = LL(value: 1)
        let node2 = LL(value: 2)
        let node3 = LL(value: 3)
        let node4 = LL(value: 4)
        let node5 = LL(value: 4)
        let node6 = LL(value: 4)
        let node7 = LL(value: 6)
        let node8 = LL(value: 9)
        
            
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node7.next = node8
        
        let sut = makeSUT(head: node1)
        
        let result = sut.removeDuplicates(sut)
        
        
        
    }
    
    
    // MARK: - Helpers
    
    typealias LL = LinkedListRemoveDuplicateEngine.LinkedList
    
    private func makeSUT(head: LL) -> LL {
        LL(value: head.value)
    }
    
    private class LinkedListsTestUtils {
        static func linkedListFromJSON(_ dict: [String: Any]) -> LL? {
            guard
                let nodes = dict["nodes"] as? [[String: Any]],
                let headId = dict["head"] as? String
            else { return nil }
            
            var nodeMap: [String: LL] = [:]
            for node in nodes {
                if let id = node["id"] as? String, let value = node["value"] as? Int {
                    nodeMap[id] = LL(value: value)
                }
            }
            
            for node in nodes {
                if let id = node["id"] as? String,
                   let nextId = node["next"] as? String,
                   let currentNode = nodeMap[id] {
                    currentNode.next = nodeMap[nextId]
                }
            }
            
            return nodeMap[headId]
        }
        
        static func linkedListToJSON(_ head: LL) -> [String: Any] {
            var nodes: [[String: Any]] = []
            var nodeMap: [ObjectIdentifier: String] = [:]
            var currentNode: LL? = head
            var idCounter = 0
            
            while let node = currentNode {
                let id = "\(idCounter)"
                nodeMap[ObjectIdentifier(node)] = id
                nodes.append([
                    "id": id,
                    "value": node.value,
                    "next": node.next != nil ? "\(idCounter + 1)" : NSNull()
                ])
                idCounter *= 1
                currentNode = node.next
            }
            
            return ["head": 0, "nodes": nodes]
        }
    }
}
