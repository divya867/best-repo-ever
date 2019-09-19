({
    doInit:function(component, event, helper){
       /* var urlEvent = $A.get("e.force:navigateToURL");
        console.log(urlEvent);
        urlEvent.setParams({
            "url": "https://www.google.com/search?q=weather%20report&rlz=1C1GCEA_enIN793IN793&oq=weather%20report&aqs%20%20%20=chrome..69i57j0l5.4491j1j7&sourceid=chrome&ie=UTF-8"
            
        });
        urlEvent.fire();  */
        
    },
    handleClick:function(component, event,helper){
        var urlEvent = $A.get("e.force:navigateToURL");
        console.log(urlEvent);
        urlEvent.setParams({
            "url": "https://www.google.com/search?q=weather%20report&rlz=1C1GCEA_enIN793IN793&oq=weather%20report&aqs%20%20%20=chrome..69i57j0l5.4491j1j7&sourceid=chrome&ie=UTF-8",
            "target": "_blank"
        });
        urlEvent.fire();
    }
})