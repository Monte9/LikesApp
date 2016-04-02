//
//  AmazonAPICode.swift
//  Likes
//
//  Created by Monte's Pro 13" on 4/1/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class AmazonAPICode: NSObject {

    //Amazon resource
    //https://github.com/m1entus/RWMAmazonProductAdvertisingManager
    //http://stackoverflow.com/questions/13541303/need-help-for-using-amazon-product-advertising-api-in-iphone
    //http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html
    //https://github.com/aws/aws-sdk-ios/blob/440d3141/AWSCore/Authentication/AWSSignature.m
    //http://www.codeography.com/2016/03/20/signing-aws-api-requests-in-swift.html
    //http://s3.amazonaws.com/awsdocs/Associates/latest/prod-adv-api-qrc.pdf
    //http://webservices.amazon.com/scratchpad/index.html#http://webservices.amazon.com/onca/xml?Service=AWSECommerceService&Operation=ItemSearch&SubscriptionId=AKIAJITU3IRXRV4C2NHA&AssociateTag=like05a-20&SearchIndex=Electronics&Keywords=macbook&ResponseGroup=Images,ItemAttributes,Offers&Sort=price
    //http://docs.aws.amazon.com/AWSECommerceService/latest/GSG/prod-adv-api-gsg.pdf
    //http://docs.aws.amazon.com/AWSECommerceService/latest/DG/prod-adv-api-dg.pdf
    //https://affiliate-program.amazon.com/gp/advertising/api/detail/main.html
    //https://affiliate-program.amazon.com/gp/advertising/api/detail/your-account.html/ref=amb_link_83957991_1?ie=UTF8&rw_useCurrentProtocol=1&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=assoc-center-1&pf_rd_r=&pf_rd_t=501&pf_rd_p=&pf_rd_i=assoc-api-thank-you-0
    
    
    //    //Make API call and parse XML document
    //    func makeAPICall() {
    //        Alamofire.request(.GET, "http://api.geonames.org/neighbours", parameters: ["geonameId": "2658434", "username": "demo"]).responseData({ (response) in
    //
    //            if let data = response.result.value {
    //                print("Found data")
    //
    //                self.xmlParser = NSXMLParser(data: data)
    //                self.xmlParser.delegate = self
    //
    //                // Initialize the mutable string that we'll use during parsing.
    //                self.foundValue = NSMutableString()
    //
    //                print("Starting parsing of XML data received from API")
    //
    //                // Start parsing.
    //                self.xmlParser.parse()
    //
    //            }
    //
    //        })
    //    }
    //
    //    //Implemented NSXMLParserDelegate methods
    //
    //    //properties for XML parsing
    //    var xmlParser: NSXMLParser = NSXMLParser()
    //    var arrNeighboursData: NSMutableArray = []
    //    var dictTempDataStorage: NSMutableDictionary = [:]
    //    var foundValue: NSMutableString = ""
    //    var currentElement: NSString = ""
    //
    //    func parserDidStartDocument(parser: NSXMLParser) {
    //        // Initialize the neighbours data array.
    //        self.arrNeighboursData = NSMutableArray()
    //    }
    //
    //    func parserDidEndDocument(parser: NSXMLParser) {
    //        print("Parsing XML complete.. info stored in a array of dictionaries ready for consuption. ;)")
    //        print("The final data is like this:")
    //        print(arrNeighboursData)
    //    }
    //
    //    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
    //        print("MSXML parsing error: \(parseError.localizedDescription)")
    //    }
    //
    //    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
    //
    //        // If the current element name is equal to "geoname" then initialize the temporary dictionary.
    //        if elementName == "Item" {
    //            self.dictTempDataStorage = [:]
    //        }
    //
    //        // Keep the current element.
    //        self.currentElement = elementName;
    //
    //    }
    //
    //    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    //
    //        // If the closing element equals to "geoname" then the all the data of a neighbour country has been parsed and the dictionary should be added to the neighbours data array.
    //        if elementName == "Item" {
    //            self.arrNeighboursData.addObject(NSDictionary.init(dictionary: self.dictTempDataStorage))
    //        } else if elementName == "ASIN" {
    //            self.dictTempDataStorage.setObject(NSString(string: self.foundValue), forKey: "ASIN")
    //        } else if elementName == "DetailPageURL" {
    //            // If the toponym name element was found then store it.
    //            self.dictTempDataStorage.setObject(NSString(string: self.foundValue), forKey: "DetailPageURL")
    //        }
    //
    //        // Clear the mutable string.
    //        self.foundValue.setString("")
    //
    //    }
    //
    //    func parser(parser: NSXMLParser, foundCharacters string: String) {
    //        // Store the found characters if only we're interested in the current element.
    //        if self.currentElement == "ASIN" || self.currentElement == "DetailPageURL"{
    //            if !(string == "\n") {
    //                self.foundValue.appendString(string)
    //            }
    //        }
    //    }
    
    //    METHODS FOR AMAZON API - NOT WORKING!!
    
    //    func amazonAPIRequest() {
    //        print("In amazon API request method")
    //
    //        // Your AWS Access Key ID, as taken from the AWS Your Account page
    //        let awsAccessKeyId = "AKIAJITU3IRXRV4C2NHA"
    //
    //        // Your AWS Secret Key corresponding to the above ID, as taken from the AWS Your Account page
    //        let awsSecretKey = "jk3vWIhUNXETvUcFieKntunwlEdBEONPx2DbfyiU"
    //
    //        // The region you are interested in
    //        let endpoint = "webservices.amazon.com"
    //
    //        let uri = "/onca/xml"
    //
    //        //Request URL
    //        let stringToSign = "GET\nwebservices.amazon.com\n/onca/xml\nService=AWSECommerceService&Operation=ItemSearch&SubscriptionId=AKIAJITU3IRXRV4C2NHA&AssociateTag=like05a-20&SearchIndex=Electronics&Keywords=macbook&ResponseGroup=Images,ItemAttributes,Offers&Sort=price"
    //
    //        print("The string to sign: \(stringToSign)")
    //        let data = awsSecretKey.dataUsingEncoding(NSUTF8StringEncoding)
    //
    //        // Generate the signature required by the Product Advertising API
    //        let HMAC = hmac(stringToSign, key: data!)
    //
    //        let signature = HMAC.base64EncodedStringWithOptions([])
    //
    //        print(signature)
    //
    //        Alamofire.request(.GET, "http://webservices.amazon.com/onca/xml", parameters: ["Service": "AWSECommerceService", "Operation": "ItemSearch", "SubscriptionId": "AKIAJITU3IRXRV4C2NHA", "AssociateTag": "like05a-20", "SearchIndex": "Electronics", "Keywords": "macbook", "ResponseGroup": "Images,ItemAttributes,Offers", "Sort": "price", "Signature": signature]).responseData({ (response) in
    //
    //            print(response.request)
    //            print(response.result)
    //
    //
    //            if let data = response.result.value {
    //                print("Found data \(data)")
    //
    //                self.xmlParser = NSXMLParser(data: data)
    //                self.xmlParser.delegate = self
    //
    //                // Initialize the mutable string that we'll use during parsing.
    //                self.foundValue = NSMutableString()
    //
    //                print("Starting parsing of XML data received from API")
    //
    //                // Start parsing.
    //                self.xmlParser.parse()
    //
    //            }
    //
    //        })
    //
    //    }
    //
    //    func amazonRequestUsingManager() {
    //
    //        print("Making Amazon request now")
    //
    //        // Your AWS Access Key ID, as taken from the AWS Your Account page
    //        let awsAccessKeyId = "AKIAJITU3IRXRV4C2NHA"
    //
    //        // Your AWS Secret Key corresponding to the above ID, as taken from the AWS Your Account page
    //        let awsSecretKey = "jk3vWIhUNXETvUcFieKntunwlEdBEONPx2DbfyiU"
    //
    //        var amazonManager = RWMAmazonProductAdvertisingManager(accessKeyID: awsAccessKeyId, secret: awsSecretKey)
    //
    //        amazonManager.responseSerializer = AFHTTPResponseSerializer()
    //
    //        var parameters = ["Service": "AWSECommerceService", "Operation": "ItemSearch", "SubscriptionId": "AKIAJITU3IRXRV4C2NHA", "AssociateTag": "like05a-20", "SearchIndex": "Electronics", "Keywords": "macbook", "ResponseGroup": "Images,ItemAttributes,Offers", "Sort": "price"]
    //
    //        amazonManager.enqueueRequestOperationWithMethod("GET", parameters: parameters, success: { (responseObject: AnyObject!) in
    //            //print("Got this back from the request: \(responseObject))")
    //
    //            if let data = responseObject as? NSData {
    //                print(data)
    //
    //            }
    //
    //            //            print(responseObject.result)
    //            //            print(responseObject.results)
    //        }) { (error: NSError!) in
    //            print("Error: \(error.localizedDescription)")
    //        }
    //        
    //    }
    //    
    //    private func hmac(string: NSString, key: NSData) -> NSData {
    //        let keyBytes = UnsafePointer<CUnsignedChar>(key.bytes)
    //        let data = string.cStringUsingEncoding(NSUTF8StringEncoding)
    //        let dataLen = Int(string.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
    //        let digestLen = Int(CC_SHA256_DIGEST_LENGTH)
    //        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
    //        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), keyBytes, key.length, data, dataLen, result);
    //        return NSData(bytes: result, length: digestLen)
    //    }    
    
}
