Set-StrictMode -Version 2.0

function New-PSCredential {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory)] [String] $Username,
    [Parameter(Mandatory)] [String] $Password,
    [String] $Domain
  )

  if ( $Username -match "\\" ) {
    ($D, $Username) = $Username -split "\\"
    $Domain = if ( $Domain ) { $Domain } else { $D }
  }

  $Username = "{1}\{0}" -f $Username, $Domain

  $secstring = ConvertTo-SecureString $Password -AsPlainText -Force
  New-Object System.Management.Automation.PSCredential ($Username, $secstring)
}

function Read-PSCredential {
  [CmdletBinding()]
  Param(
    [PSCredential] $PSCredential
  )
  $PSCredential.GetNetworkCredential()
}

Export-ModuleMember *-*
