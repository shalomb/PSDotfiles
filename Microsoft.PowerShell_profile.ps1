$Whoami   = ($Env:USERNAME).ToLower()
$Domain   = ($Env:USERDOMAIN).ToLower()

$ProfileD = Join-Path $PSScriptRoot 'profile.d'

if ( Test-Path $ProfileD ) {
  foreach ($file in $(ls $ProfileD/*.ps1)) {
    Write-Verbose "Sourcing $file"
    . $file
  }
} else {
  mkdir $ProfileD
}

function reload {
  Write-Verbose "reload $profile"
  . $profile
}

