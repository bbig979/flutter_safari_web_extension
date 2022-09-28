//
//  SafariWebExtensionHandler.swift
//  Hide All
//
//  Created by yu kim on 9/21/22.
//

import SafariServices
import os.log

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling { 
    
    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as! NSExtensionItem
        let message = item.userInfo?[SFExtensionMessageKey]
        os_log(.default, "Received message from browser.runtime.sendNativeMessage: %@", message as! CVarArg)

        let sharedPrefs = UserDefaults.init(suiteName: "group.safari_web_extension")!
        let connectorValue = sharedPrefs.string(forKey: "connector")

        let response = NSExtensionItem()
        response.userInfo = [ SFExtensionMessageKey: [ "connector_value": connectorValue ] ]

        context.completeRequest(returningItems: [response], completionHandler: nil)
    }

}
