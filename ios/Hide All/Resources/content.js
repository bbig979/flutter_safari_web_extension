chrome.runtime.onMessage.addListener(
    function(message, sender, sendResponse) {
        switch(message.type) {
            case "test":
                chrome.runtime.sendMessage({type: "connect"}, function(response) {
                    console.log(response);
                });
                break;
        }
        
        return true;
    }
);