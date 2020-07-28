
function ssh {
  [CmdLetBinding()]
  Param(
    [String] $user = $Env:USERNAME,
    [Parameter(Mandatory=$true, Position=1)]
      [String] $hostname,
    [Switch] $1,
    [Switch] $2,
    [Switch] $a,
    [Switch] $C,
    [System.IO.FileInfo][String]$i,
    [System.IO.FileInfo][String]$m,
    [String] $L,
    [Int] $p,
    [String] $pw,
    [String] $R,
    [Switch] $t,
    [Switch] $v,
    [Switch] $x,
    [String] $args
  )

  $puttyArgs = @()

  foreach ($key in $MyInvocation.BoundParameters.keys) {
    if ($key -cmatch '^a$') { $puttyArgs += ( "-a " ) }
    if ($key -cmatch '^A$') { $puttyArgs += ( "-A " ) }
  }

  if ($v) { $puttyArgs += ( "-v " ) }
  if ($a) { $puttyArgs += ( "-$a " ) }
  if ($1) { $puttyArgs += ( "-1 " ) }
  if ($2) { $puttyArgs += ( "-2 " ) }
  if ($C) { $puttyArgs += ( "-C " ) }
  if ($pw) { $puttyArgs += ( "-pw $pw " ) }
  if ($L) { $puttyArgs += ( "-L $L " ) }
  if ($l) { $puttyArgs += ( "-l $l " ) }
  if ($i) { $puttyArgs += ( "-i $i " ) }
  if ($m) { $puttyArgs += ( "-m $m " ) }
  if ($p) { $puttyArgs += ( "-p $p " ) }
  if ($R) { $puttyArgs += ( "-R $R " ) }
  if ($t) { $puttyArgs += ( "-$t " ) }
  if ($x) { $puttyArgs += ( "-$x " ) }
  if ($args) { $puttyArgs += ( "$args " ) }
  & "$Env:programfiles\putty\putty.exe" $puttyArgs $user@$hostname
}

function Get-GuestIPAddress {
  Get-NetIPConfiguration | ?{
    $_.InterfaceDescription -inotmatch 'Fortinet' -and $_.IPv4DefaultGateway -eq $null
  } | Select -Expand IPv4Address | Select -Expand IPAddress
}

function Get-HypervisorIPAddress {
  $GuestIPAddress = Get-GuestIPAddress
  Write-Warning "Determined Guest IP Address to be $GuestIPAddress"
  $Bytes = ([Net.IPAddress]$GuestIPAddress).GetAddressBytes()
  $Bytes[3] = 1
  $Bytes -join "."
}

function ssh-hypervisor {
  [CmdletBinding()]
  Param(
    [String] $Hypervisor = $(Get-HypervisorIPAddress)
  )
  ssh $Hypervisor
}

