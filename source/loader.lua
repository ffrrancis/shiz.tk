-- Libraries
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "shiz.tk",
    LoadingTitle = "Shizuku",
    LoadingSubtitle = "Key System",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil,
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = false,
    },
    KeySystem = false,
    KeySettings = {
       Title = "Sirius Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = false,
       GrabKeyFromSite = false,
       Key = "Hello"
    }
})

-- Important Variables
local SupportedGames = game:HttpGet("https://shiz.tk/07ZgseiVVvipXbSPictF%20KWTbAmbt4L4Lh4tVK2F6%20o67M6Ferw6sJFe1USYB5/games.html")

-- Tabs
local Main = Window:CreateTab("Key System")
local Settings = Window:CreateTab("", 4431163567)

-- Main Tab
Main:CreateParagraph({
    Title = "Key System",
    Content = "Follow the instructions on our website to get a key. (https://shiz.tk/)"
})

Main:CreateInput({
    Name = "Key",
    PlaceholderText = "shiz.tk",
    RemoveTextAfterFocusLost = false,
    Callback = function(Key)
        if Key == game:HttpGet("https://shiz.tk/07ZgseiVVvipXbSPictF%20KWTbAmbt4L4Lh4tVK2F6%20o67M6Ferw6sJFe1USYB5/key.html") then
            Rayfield:Notify({
                Title = "Key is valid",
                Content = "Please wait while we check to see if your current game is supported.",
                Duration = 2.5,
                Image = 3944680095
            })

            if SupportedGames[game.PlaceId] then
                wait(0.8)
                Rayfield:Notify({
                    Title = "Game is supported",
                    Content = "Main script is now loading",
                    Duration = 2.5,
                    Image = 3944680095
                })

                loadstring(game:HttpGet("https://raw.githubusercontent.com/ffrrancis/shiz.tk/main/games/".. game.PlaceId))
            else
                wait(0.8)
                Rayfield:Notify({
                    Title = "Game is not supported",
                    Content = "Would you like to load the universal script?",
                    Duration = 2.5,
                    Image = 3944676352,
                    Actions = {
                        Yes = {
                            Name = "Yes",
                            Callback = function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/ffrrancis/shiz.tk/main/universal"))
                            end
                        },
                        No = {
                            Name = "No",
                            Callback = function()
                                Rayfield:Notify({
                                    Title = "Notice",
                                    Content = "GUI will destroy itself in 2.5 seconds.",
                                    Duration = 2.5,
                                    Image = 3944670656
                                })

                                wait(2.5)
                                Rayfield:Destroy()
                            end
                        },
                    }
                })
            end
        else
            Rayfield:Notify({
                Title = "Key is invalid",
                Content = "Please go to our website and fetch a new key.",
                Duration = 2.5,
                Image = 3944676352
            })
        end
    end,
})


Main:CreateButton({
    Name = "Copy to clipboard",
    Callback = function()
        setclipboard('https://shiz.tk/')
        Rayfield:Notify({
            Title = "Copied to Clipboard",
            Content = "Paste the copied link into your web browser to get a key.",
            Duration = 2.5,
            Image = 10802208997
         })
    end
})

-- Settings Tab
Settings:CreateParagraph({
    Title = "Changelog",
    Content = game:HttpGet("https://raw.githubusercontent.com/ffrrancis/shiz.tk/main/changelog.txt")
})