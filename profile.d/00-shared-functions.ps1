# Shared Functions

function Is-PSElevated {
  $current = [security.principal.windowsprincipal][security.principal.windowsidentity]::GetCurrent()
  $current.IsInRole([security.principal.windowsbuiltinrole]::administrator)
}

function Add-MappedDrive {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory)] [String] $Drive,
    [Parameter(Mandatory)] [String] $Unc,
    [PSCredential] $Credential  = (New-PSCredential -Username $Env:USERNAME -Password '.'),
    [String]  $Description = "$Drive on $Unc",
    [Boolean] $Persist     = $True,
    [String]  $Scope       = 'Global'
  )

  if ( -not(Test-Path $Drive) ) {
    New-PSDrive -Name $Drive -PSProvider 'FileSystem' `
                -Root $Unc   -Credential $Credential  `
                -Description $Description -Persist:$Persist `
                -Scope $Scope
  }
}

