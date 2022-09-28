chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
    chrome.tabs.sendMessage(tabs[0].id, {type:"test"}, function(response){
        setInterval(function () {window.close();}, 1);
    });
});