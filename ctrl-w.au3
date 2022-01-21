#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         https://github.com/korolev-oleg

 Script Function:
    Setup ctrl+w hotkey for global backward-delete-word in windows
    support vim backward delete word

#ce ----------------------------------------------------------------------------

#include <MsgBoxConstants.au3>
#Include <WinAPI.au3>

HotKeySet("^w", "backward_delete_word")

Func backward_delete_word()
    $cur_win_title = stringlower(wingettitle("[ACTIVE]"))
    $cur_win_class = _WinAPI_GetClassName(WinGetHandle("[ACTIVE]"))
    if $cur_win_class = 'CASCADIA_HOSTING_WINDOW_CLASS' then
        if stringinstr('vim', $cur_win_title) Then
            send("^c")
            send('dawa')
        else
            send("^{backspace}")
        endif
    else
        send("^{backspace}")
    endif
EndFunc

While 1
    Sleep(100)
wend

