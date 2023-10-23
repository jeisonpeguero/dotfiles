# Colocar en el archivo $PROFILE C:\Users\jeison\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
# . "$ENV:USERPROFILE\.dotfiles\powershell\personal.ps1"

# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Alias
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias touch ni
Set-Alias which Get-Command
# Set-Alias cdcode goCode
function cdcode { set-location "D:\Code\" }

# Icons
#Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons

#PSReadLine
# Install-Module -Name PSReadLine -Force
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView -EditMode Windows

#PSFzf
# Install-Module -Name PSFzf
Import-Module -Name PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

#Starship
$ENV:STARSHIP_CONFIG = "$ENV:USERPROFILE\.dotfiles\.starship\config.toml"
$ENV:STARSHIP_CACHE = "$ENV:USERPROFILE\.starship\cache"

# Utilities
# function which ($command) {
#   Get-Command -Name $command -ErrorAction SilentlyContinue |
#   Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
# }

Invoke-Expression (&starship init powershell)
