#Requires AutoHotkey v2.0
#SingleInstance Force

; Include UIA-v2
#Include "Lib\UIA.ahk"

hiddenHwnds := Map()

; Các Từ cần chặn
blockedTexts := ["Phạm Huyền My", "Bùi Thị Bảo Anh"]

SetTimer CheckLarkPopup, 10
return


CheckLarkPopup() {
    global hiddenHwnds, blockedTexts
    
    hwndList := WinGetList("ahk_exe Lark.exe ahk_class Chrome_WidgetWin_1")

    for hwnd in hwndList {
        if (hiddenHwnds.Has(hwnd))
            continue
            
        x := y := w := h := 0
        WinGetPos &x, &y, &w, &h, hwnd

        if (w >= 800 && h >= 500)
            continue

        root := UIA.ElementFromHandle(hwnd)
        if !root
            continue

        foundTarget := false
        texts := []
        CollectTextWithCheck(root, &texts, blockedTexts, &foundTarget)

        if (foundTarget) {
            WinSetTransparent 0, "ahk_id " hwnd
            WinHide "ahk_id " hwnd
            hiddenHwnds[hwnd] := true
        }
    }
}


CollectTextWithCheck(el, &texts, targetTexts, &foundTarget) {
    try {
        name := el.Name
        if (name != "") {
            trimmedName := Trim(name)
            texts.Push(trimmedName)
            for targetText in targetTexts {
                if (InStr(trimmedName, targetText)) {
                    foundTarget := true
                    return
                }
            }
        }

        if (!foundTarget) {
            for child in el.Children {
                CollectTextWithCheck(child, &texts, targetTexts, &foundTarget)
                if (foundTarget)
                    return
            }
        }
    }
}
