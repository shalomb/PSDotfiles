# PS Shell/Window Decorations

$Host.UI.RawUI.CursorSize=2

function Set-WindowSize {
  Param(
    [int] $Width  = $Host.UI.RawUI.WindowSize.Width,
    [int] $Height = $Host.UI.RawUI.WindowSize.heigth,
    [Int] $BufferHeight = 9999,
    [Int] $BufferWidth  = $Width
  )

    $Host.UI.RawUI.WindowSize = `
      New-Object System.Management.Automation.Host.Size($Width, $Height)

    $Host.UI.RawUI.BufferSize = `
      New-Object System.Management.Automation.Host.Size($BufferWidth, $BufferHeight)
}

Set-WindowSize 144 60
