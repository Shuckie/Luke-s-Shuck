// Add this at the top of your script
function onLoad()
{
    // Register your custom event
    game.addEvent("HUD visibility");
}

// Your existing code
function onEvent(name, v1, v2)
{
    if (name == "HUD visibility")
    {
        setProperty('camHUD.visible', !getProperty('camHUD.visible'));
    }
}