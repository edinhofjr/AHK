PDV :="ahk_exe chrome.exe"

;Apagar iten
#HotIf WinActive(PDV) 
    Del:: {
        Send "^i"
        Sleep(500)
        Send "98120292"
        Send "{ENTER}"
}

;Trocar teclas
#HotIf WinActive(PDV) 
NumLock::F8
Pause::F5
NumpadDiv::b
NumpadAdd::g 

