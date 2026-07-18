' Checkpoint Queue Helper — desktop launcher
' Double-click to open the app in its own clean window (no browser tabs/address bar).
' Uses Microsoft Edge or Google Chrome in "app mode". No install required.

Option Explicit
Dim fso, sh, appDir, url, exe, c, candidates
Set fso = CreateObject("Scripting.FileSystemObject")
Set sh  = CreateObject("WScript.Shell")

appDir = fso.GetParentFolderName(WScript.ScriptFullName)
If Not fso.FileExists(appDir & "\index.html") Then
  MsgBox "Could not find index.html next to this launcher." & vbCrLf & _
         "Keep 'Checkpoint Helper.vbs' and 'index.html' in the same folder.", 48, "Checkpoint Queue Helper"
  WScript.Quit
End If

' One-time: drop a branded desktop shortcut so the app gets the Destiny icon
' (the .vbs itself can't carry a custom icon). Points back to this launcher.
Dim ico, lnkPath, lnk
ico = appDir & "\icon.ico"
lnkPath = sh.SpecialFolders("Desktop") & "\Checkpoint Helper.lnk"
If fso.FileExists(ico) And Not fso.FileExists(lnkPath) Then
  On Error Resume Next
  Set lnk = sh.CreateShortcut(lnkPath)
  lnk.TargetPath = WScript.ScriptFullName
  lnk.WorkingDirectory = appDir
  lnk.IconLocation = ico & ",0"
  lnk.Description = "Destiny 2 — Checkpoint Queue Helper"
  lnk.Save
  On Error Goto 0
End If

url = "file:///" & Replace(appDir & "\index.html", "\", "/")

candidates = Array( _
  sh.ExpandEnvironmentStrings("%ProgramFiles%")      & "\Microsoft\Edge\Application\msedge.exe", _
  sh.ExpandEnvironmentStrings("%ProgramFiles(x86)%") & "\Microsoft\Edge\Application\msedge.exe", _
  sh.ExpandEnvironmentStrings("%ProgramFiles%")      & "\Google\Chrome\Application\chrome.exe", _
  sh.ExpandEnvironmentStrings("%ProgramFiles(x86)%") & "\Google\Chrome\Application\chrome.exe", _
  sh.ExpandEnvironmentStrings("%LocalAppData%")      & "\Google\Chrome\Application\chrome.exe" )

exe = ""
For Each c In candidates
  If fso.FileExists(c) Then exe = c : Exit For
Next

If exe <> "" Then
  ' --app gives a standalone, chromeless window; --user-data-dir gives the app its
  ' own persistent profile so your channels / Twitch token / Bungie name are saved.
  Dim dataDir
  dataDir = sh.ExpandEnvironmentStrings("%LocalAppData%") & "\CheckpointQueueHelper"
  sh.Run """" & exe & """ --app=""" & url & """ --user-data-dir=""" & dataDir & """ --window-size=820,1000", 1, False
Else
  ' No Chromium browser found — open in the default browser instead.
  sh.Run """" & url & """", 1, False
End If
