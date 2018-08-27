document.addEventListener("DOMContentLoaded", function(event) {
    console.log('DOM Loaded');
    safari.extension.dispatchMessage("DOMContentLoaded");
  });

safari.self.addEventListener("message", messageHandler);

function messageHandler(event) {
    if(event.name === "MessagePassing") {
        console.log("message is", event.message);
    }
}
