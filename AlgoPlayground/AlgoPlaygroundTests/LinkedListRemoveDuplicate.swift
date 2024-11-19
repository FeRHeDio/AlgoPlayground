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
    func test_linkedList_noChangesReturnSame() {
        let inputJSON: [String: Any] = [
            "head": "0",
            "nodes": [
                ["id": "0", "next": "1", "value": 1],
                ["id": "1", "next": "2", "value": 2],
                ["id": "2", "next": nil, "value": 3]
            ]
        ]
        
        let inputList = LinkedListsTestUtils.linkedListFromJSON(inputJSON)
        
        let sut = makeSUT(head: inputList!)
        
        sut.printList(inputList)
        
        let result = sut.removeDuplicates(inputList!)
        let resultJSON = LinkedListsTestUtils.linkedListToJSON(result)
        
        XCTAssertEqual(resultJSON as NSDictionary, inputJSON as NSDictionary)
        
    }
    
    func test_removeDuplicates_returnCleanedList() {
        let inputJSON: [String: Any] = [
            "head": "0",
            "nodes": [
                ["id": "0", "next": "1", "value": 1],
                ["id": "1", "next": "2", "value": 1],
                ["id": "2", "next": "3", "value": 2],
                ["id": "3", "next": "4", "value": 3],
                ["id": "4", "next": "5", "value": 3],
                ["id": "5", "next": "6", "value": 3],
                ["id": "6", "next": "7", "value": 3],
                ["id": "7", "next": "8", "value": 3],
                ["id": "8", "next": "9", "value": 3],
                ["id": "9", "next": nil, "value": 3]
            ]
        ]
        
        let expectedResult: [String: Any] = [
            "head": "0",
            "nodes": [
                ["id": "0", "next": "1", "value": 1],
                ["id": "1", "next": "2", "value": 2],
                ["id": "2", "next": nil, "value": 3]
            ]
        ]
        
        let inputList = LinkedListsTestUtils.linkedListFromJSON(inputJSON)
        
        let sut = makeSUT(head: inputList!)
        
        let result = sut.removeDuplicates(inputList!)
        let outputJSON = LinkedListsTestUtils.linkedListToJSON(result)
        
        XCTAssertEqual(outputJSON as NSDictionary, expectedResult as NSDictionary, "The linked list was not removing ocurrences correctly.")
        
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
            var nodeMap = [ObjectIdentifier: String]()
            var currentNode: LL? = head
            var idCounter = 0

            while let node = currentNode {
                let objectId = ObjectIdentifier(node)
                let id: String
                
                if let existingId = nodeMap[objectId] {
                    id = existingId
                } else {
                    id = "\(idCounter)"
                    nodeMap[objectId] = id
                    idCounter += 1
                }

                let nextID = node.next.flatMap { nextNode in
                    let nextObjectId = ObjectIdentifier(nextNode)
                    if let existingNextId = nodeMap[nextObjectId] {
                        return existingNextId
                    } else {
                        let newNextId = "\(idCounter)"
                        nodeMap[nextObjectId] = newNextId
                        idCounter += 1
                        return newNextId
                    }
                }

                nodes.append([
                    "id": id,
                    "value": node.value,
                    "next": nextID ?? NSNull()
                ])

                currentNode = node.next
            }

            return [
                "head": nodeMap[ObjectIdentifier(head)] ?? "0",
                "nodes": nodes
            ]
        }

    }
}
