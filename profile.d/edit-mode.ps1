# Edit Mode Configuration

Set-PSReadlineOption -EditMode Vi

Set-PSReadlineKeyHandler -Function ReverseSearchHistory -Chord 'Ctrl+r'

Set-PSReadlineKeyHandler -ViMode Insert  -Chord 'Ctrl+h' -Function BackwardChar

Set-PSReadlineKeyHandler -ViMode Insert  -Chord 'Ctrl+r' -Function ReverseSearchHistory
Set-PSReadlineKeyHandler -ViMode Command -Chord 'Ctrl+r' -Function ReverseSearchHistory
Set-PSReadlineKeyHandler -ViMode Command -Chord 'Ctrl+p' -Function PreviousHistory
Set-PSReadlineKeyHandler -ViMode Insert  -Chord 'Ctrl+p' -Function PreviousHistory
Set-PSReadlineKeyHandler -ViMode Command -Chord 'Ctrl+n' -Function NextHistory
Set-PSReadlineKeyHandler -ViMode Insert  -Chord 'Ctrl+n' -Function NextHistory
Set-PSReadlineKeyHandler -ViMode Command -Chord 'Ctrl+o' -Function AcceptAndGetNext
Set-PSReadlineKeyHandler -ViMode Insert  -Chord 'Ctrl+o' -Function AcceptAndGetNext


Set-PSReadlineKeyHandler -ViMode Insert  -Chord 'UpArrow' -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::PreviousHistory()
  [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('')
}
Set-PSReadlineKeyHandler -ViMode Command -Chord 'k' -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::PreviousHistory()
  [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('')
}

Set-PSReadlineKeyHandler -ViMode Insert  -Chord 'DownArrow' -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::NextHistory()
  [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('')
}
Set-PSReadlineKeyHandler -ViMode Command -Chord 'j' -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::NextHistory()
  [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('')
}

Set-PSReadlineKeyHandler -ViMode Command -Chord '#' -ScriptBlock { 
  [Microsoft.PowerShell.PSConsoleReadLine]::GotoFirstNonBlankOfLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('#')
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}


