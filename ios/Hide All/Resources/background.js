chrome.runtime.onMessage.addListener(
    function(message, sender, sendResponse) {
        switch(message.type) {
            case "connect":
                chrome.runtime.sendNativeMessage("application.id", {type: "connect"}, function(response) {
                    sendResponse(response);
                });
                break;
        }
        
        return true;
    }
);