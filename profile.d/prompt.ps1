# Set the PS prompt

function Set-PSTitle {
  [CmdletBinding()]
  Param(
    [String] $Title = "PowerShell $Whoami@$Hostname"
  )
  $Host.UI.RawUI.WindowTitle=$Title
}

function prompt {
  $ec = if ($LastExitCode) { $LastExitCode } else { 0 }
  $d = $pwd.path.Split('\')[-1]
  Write-Host -ForegroundColor DarkGray -NoNewline  "$( get-date -UFormat %H:%M:%S ) "
  Write-Host -ForegroundColor DarkCyan   -NoNewline  "$d "
  Write-Host -ForegroundColor DarkYellow -NoNewline  "$ec "
  Set-PSTitle "$Whoami@$Domain $($PWD.ProviderPath)"
  if (Is-PSElevated) {
    Write-Host -ForegroundColor Red     -NoNewline  "#"
    " "
  } else {
    Write-Host -ForegroundColor DarkMagenta -NoNewline  "$"
    " "
  }
}

