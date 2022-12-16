Set-Alias less more

function Recall-History { 
  param($s)
  if ($s -eq "!!") {
    $Cmd = (Get-History -id (Get-History).count).CommandLine
    Write-Warning "Executing [$Cmd]"
    iex $Cmd
  }
}

Set-Alias g Recall-History

function source {
  [CmdLetBinding()]
  Param(
    [String] $File
  )
  . $file
}

function dirname {
  [CmdLetBinding()]
  Param(
    [String] $File
  )
  ([IO.FileInfo]($File -replace '\\$', '')).Directory.FullName
}

function basename {
  [CmdLetBinding()]
  Param(
    [String] $File
  )
  ([IO.FileInfo]($File -replace '\\$', '')).Basename
}

function poweroff {
  shutdown.exe -s -t 0
}

function reboot {
  shutdown.exe -r -t 0
}

function open {
  explorer.exe $args
}

foreach ($editor in 'gvim', 'gim') {
 if ( $c = get-command $editor -ea 0 ) {
   $EDITOR=$c.Path;
   break;
 }
}

function edit {
  [CmdLetBinding()]
  Param(
    [String] $File
  )
  &$EDITOR "$File"
}
