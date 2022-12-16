#powershell

Set-StrictMode -Version 2.0
$ErrorActionPreference='Inquire'

New-Item -ItemType SymbolicLink -Path "Home" -Target "\\Mac\Home\"

# Windows Directories
foreach ($dir in (
  "Desktop",  "Documents", "Downloads", "Documents"
)) {
  New-Item -ItemType SymbolicLink -Path "$dir" -Target "\\Mac\Home\$dir"
}
