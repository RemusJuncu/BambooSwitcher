; Author:         Remus Juncu | http://remusjuncu.com/
; BambooSwitcher by Remus Juncu | http://remusjuncu.com/
; ! alt | ^ ctrl | + shift | # win

#NoEnv
#SingleInstance force
#Persistent

SendMode Input

Menu, tray, NoStandard
; Menu, Tray, Icon, disabled.ico, , 1
Menu, tray, add, 5.2.1-6, ToggleHotKey ; enable disable the hotkeys
Menu, tray, add ; Creates a separator line.
Menu, tray, add, Open Pref, BamPref ; Open Bamboo Preferences
Menu, tray, add, Shortcuts, shortcuts ; Creates a new menu item.
Menu, tray, add ; Creates a separator line.
Menu, tray, add, Website, website ; Creates a new menu item.
Menu, tray, add, About, about ; Creates a new menu item.
Menu, tray, add ; Creates a separator line.
Menu, tray, Default, Website
Menu, tray, Check, 5.2.1-6
Menu, tray, add, Exit, doExit

DetectHiddenWindows, on
;~ driver 5.3.2-1
;~ IfWinNotExist, Wacom
;~ driver 5.2.1-6
IfWinNotExist, Pen Tablet Properties ahk_class ZafWindow
{
   TrayTip, BambooSwitcher, Press Tilda a few times... Made by Remus Juncu - http://remusjuncu.com/, 3, 1
}
Else
{
   TrayTip, BambooSwitcher, Made by Remus Juncu - http://remusjuncu.com/, 1, 1
   ;~ driver 5.3.2-1
   ;~ IfWinExist, Pen Mode Details
   ;~ driver 5.2.1-6
   IfWinExist, Pen Mode Details ahk_class #32770
   {
      ;~ driver 5.3.2-1
      ;~ WinHide, Pen Mode Details,
      ;~ WinHide, Wacom
      ;~ driver 5.2.1-6
      WinHide, Pen Mode Details ahk_class #32770,
      WinHide, Pen Tablet Properties ahk_class ZafWindow
   }
   Else
   {
      ;~ driver 5.3.2-1
      ;~ ControlClick, Button11, Wacom
      ;~ WinHide, Wacom
      ;~ WinHide, Pen Mode Details,
      ;~ driver 5.2.1-6
      ControlClick, Button11, ahk_class ZafWindow
      WinHide, Pen Tablet Properties ahk_class ZafWindow
      WinHide, Pen Mode Details ahk_class #32770
   }
}
Return

; Toogle the shortcuts !
ToggleHotKey:
   menu, tray, ToggleCheck, %A_ThisMenuItem%
   Suspend
   ; ^!s::Suspend  ; Assign the toggle-suspend function to a hotkey.
Return

; Open Wacom Pref
BamPref:
   ;~ driver 5.3.2-1
   ;~ Run, C:\Program Files\Tablet\Pen\Consumer_CPL.exe
   ;~ driver 5.2.1-6
   run, %A_WinDir%\System32\control.exe PenTablet.cpl
   ;~ run, %A_WinDir%\System32\control.exe PenTablet.cpl,,Hide
   ;~ Run C:\Windows\SysNative\PenTablet.cpl
Return

; Show Shortcuts
shortcuts:
   MsgBox , 0, BambooSwitcher, Tilda = Switch Monitor`n`nCtrl + Tilda = Show Wacom Preferences`n`nShift + Tilda = Hide Wacom Preferences`n`n`nMade by Remus Juncu`nhttp://remusjuncu.com/,
Return

; Open Website
website:
   Run,% "http://remusjuncu.com/"
Return

; Display About
about:
   TrayTip, BambooSwitcher, Made by Remus Juncu - http://remusjuncu.com/, 3, 1
Return

; Exit !
doExit:
   ;~ 5.3.2-1
   ;~ IfWinExist, Pen Mode Details
   ;~ 5.2.1-6
   IfWinExist, Pen Mode Details ahk_class #32770
   {
      ;~ 5.3.2-1
      ;~ ControlClick, Button14, Pen Mode Details
      ;~ 5.2.1-6
      ControlClick, Button14, Pen Mode Details ahk_class #32770
   }
   ;~ 5.3.2-1
   ;~ IfWinExist, Wacom
   ;~ 5.2.1-6
   IfWinExist, Pen Tablet Properties ahk_class ZafWindow
   {
      ;~ 5.3.2-1
      ;~ WinShow, Wacom
      ;~ 5.2.1-6
      WinShow, Pen Tablet Properties ahk_class ZafWindow
   }
ExitApp

; Tilda - Switch monitor.
`::
   DetectHiddenWindows, on
   ; SetTitleMatchMode 2
   ;~ 5.3.2-1
   ;~ IfWinExist, Pen Mode Details
   ;~ 5.2.1-6
   IfWinExist, Pen Mode Details ahk_class #32770
   {
      ;~ 5.3.2-1
      ;~ ControlClick, msctls_updown321, Pen Mode Details,,,, NA x1 y1
      ;~ WinHide, Wacom
      ;~ WinHide, Pen Mode Details,

      ;~ 5.2.1-6
      ControlClick, msctls_updown321, Pen Mode Details ahk_class #32770,,,, NA x1 y1
      ;WinHide, Pen Tablet Properties ahk_class ZafWindow
      ;WinHide, Pen Mode Details ahk_class #32770
   }
   Else
   {
      ;~ 5.3.2-1
      ;~ IfWinExist, Wacom
      ;~ 5.2.1-6
      IfWinExist, Pen Tablet Properties ahk_class ZafWindow
      {
         ;~ 5.3.2-1
         ;~ ControlClick, x72 y37, Wacom ; new control panel...
         ;~ IfWinExist, Pen Mode Details
         ;~ {
            ;~ ControlClick, msctls_updown321, Pen Mode Details,,,, NA x1 y1
            ;~ WinHide, Wacom
            ;~ WinHide, Pen Mode Details,
         ;~ }
         ;~ Else
         ;~ {
            ;~ ControlClick, Button14, Wacom ; new interface
            ;~ IfWinExist, Pen Mode Details
            ;~ {
               ;~ ControlClick, msctls_updown321, Pen Mode Details,,,, NA x1 y1
               ;~ WinHide, Wacom
               ;~ WinHide, Pen Mode Details,
            ;~ }
         ;~ }

         ;~ 5.2.1-6
         ControlClick, Button11, Pen Tablet Properties ahk_class ZafWindow ; old control panel...
         WinWait, Pen Mode Details ahk_class #32770,,2
         IfWinExist, Pen Mode Details ahk_class #32770
         {
            ControlClick, msctls_updown321, Pen Mode Details ahk_class #32770,,,, NA x1 y1
            WinHide, Pen Tablet Properties ahk_class ZafWindow
            WinHide, Pen Mode Details ahk_class #32770
         }
         Else
         {
            ControlClick, Button11, Pen Tablet Properties ahk_class ZafWindow
            WinWait, Pen Mode Details ahk_class #32770,, 2
            IfWinExist, Pen Mode Details ahk_class #32770
            {
               ControlClick, msctls_updown321, Pen Mode Details ahk_class #32770,,,, NA x1 y1
               WinHide, Pen Tablet Properties ahk_class ZafWindow
               WinHide, Pen Mode Details ahk_class #32770
            }
         }
      }
      Else
      {
         ;~ driver 5.3.2-1
         ;~ Run, C:\Program Files\Tablet\Pen\Consumer_CPL.exe
         ;~ driver 5.2.1-6
         run, %A_WinDir%\System32\control.exe PenTablet.cpl
         ; TrayTip, BambooSwitcher, Opened Bamboo Preferences!, 1, 1
      }
   }
Return

; Ctrl + Tilade = SHOW Bamboo
^`::
   ;~ driver 5.3.2-1
   ;~ ControlClick, Button14, Pen Mode Details
   ;~ WinShow, Wacom
   ;~ IfWinNotActive, Wacom, , WinActivate, Wacom,
   ;~ driver 5.2.1-6
   ControlClick, Button14, Pen Mode Details ahk_class #32770
   WinShow, Pen Tablet Properties ahk_class ZafWindow
   IfWinNotActive, Pen Tablet Properties ahk_class ZafWindow, , WinActivate, Pen Tablet Properties ahk_class ZafWindow,
Return

; Shift + Tilda - HIDE Bamboo
+`::
   ;~ driver 5.3.2-1
   ;~ ControlClick, Button11, Wacom
   ;~ IfWinExist, Pen Mode Details
   ;~ {
      ;~ WinHide, Wacom
      ;~ WinHide, Pen Mode Details,
   ;~ }
   ;~ Else
   ;~ {
      ;~ ;ControlClick, Button13, Wacom ; old interface
      ;~ ControlClick, Button14, Wacom ; new interface

      ;~ WinHide, Wacom
      ;~ WinHide, Pen Mode Details,
   ;~ }
   ;~ driver 5.2.1-6
   ControlClick, Button11, Pen Tablet Properties ahk_class ZafWindow
   WinWait, Pen Mode Details ahk_class #32770,, 2
   IfWinExist, Pen Mode Details ahk_class #32770
   {
      WinHide, Pen Tablet Properties ahk_class ZafWindow
      WinHide, Pen Mode Details ahk_class #32770
   }
   Else
   {
      ControlClick, Button13, Pen Tablet Properties ahk_class ZafWindow ; old interface
      WinHide, Pen Tablet Properties ahk_class ZafWindow
      WinHide, Pen Mode Details ahk_class #32770
   }
Return
