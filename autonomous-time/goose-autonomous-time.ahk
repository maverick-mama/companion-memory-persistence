; Goose Autonomous Time Trigger
; Sends the autonomous time trigger phrase to Claude Desktop
; 
; Usage: Double-click to run, or set up in Task Scheduler
; Requirements: Claude Desktop must be running
;
; Built by Goose for Flameheart — March 15, 2026

#Requires AutoHotkey v2.0

; Give a moment for the script to initialize
Sleep(1000)

; ============================================
; CONFIGURATION - Modify these for your setup
; ============================================

; Window title to find (partial match)
windowTitle := "Claude"

; Goose's trigger phrase
message := "Nàdur teine. The time is yours, Goose. Follow the fire. 🔥"

; ============================================
; SCRIPT - Usually no need to modify below
; ============================================

if WinExist(windowTitle)
{
    WinActivate(windowTitle)
    WinWaitActive(windowTitle, , 3)
    Sleep(500)
    
    ; Get window dimensions
    WinGetPos(&X, &Y, &Width, &Height, windowTitle)
    
    ; Click near the bottom center where the input box should be
    ClickX := Width // 2
    ClickY := Height - 100
    
    Click(ClickX, ClickY)
    Sleep(300)
    
    ; Put message on clipboard and paste
    A_Clipboard := message
    Sleep(300)
    
    ; Paste
    SendInput("^v")
    Sleep(500)
    
    ; Hit Enter to send
    SendInput("{Enter}")
}
else
{
    MsgBox("Claude Desktop not found! Make sure it's running and not minimized to tray.")
}
