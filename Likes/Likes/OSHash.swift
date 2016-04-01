//
//  OSHash.swift
//  Likes
//
//  Created by Monte's Pro 13" on 4/1/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit
import Foundation

class OSHashAlgorithm: NSObject {
    
    let chunkSize: Int = 65536;
    
    struct VideoHash {
        var fileHash: String
        var fileSize: UInt64
    }
    
    func hashForPath (path: String) -> VideoHash {
        var fileHash = VideoHash(fileHash: "", fileSize: 0)
        
        print(path)
        
        let fileHandler = NSFileHandle(forReadingAtPath: path)!
        
        let fileDataBegin: NSData = fileHandler.readDataOfLength(chunkSize)
        fileHandler.seekToEndOfFile()
        
        let fileSize: UInt64 = fileHandler.offsetInFile
        if (UInt64(chunkSize) > fileSize) {
            return fileHash
        }
        
        fileHandler.seekToFileOffset(max(0, fileSize - UInt64(chunkSize)))
        let fileDataEnd: NSData = fileHandler.readDataOfLength(chunkSize)
        
        var hash: UInt64 = fileSize
        
        var data_bytes = UnsafeBufferPointer<UInt64>(
            start: UnsafePointer(fileDataBegin.bytes),
            count: fileDataBegin.length/sizeof(UInt64)
        )
        hash = data_bytes.reduce(hash,combine: &+)
        
        data_bytes = UnsafeBufferPointer<UInt64>(
            start: UnsafePointer(fileDataEnd.bytes),
            count: fileDataEnd.length/sizeof(UInt64)
        )
        hash = data_bytes.reduce(hash,combine: &+)
        
        fileHash.fileHash = String(format:"%qx", arguments: [hash])
        fileHash.fileSize = fileSize
        
        fileHandler.closeFile()
        return fileHash
    }
}
