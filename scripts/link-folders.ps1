param(
    [string]$USUARIO = $(Read-Host 'Enter the username: '),
    [string]$PROJECT_PATH = $(Read-Host 'Enter the project path: ')
)

function New-Symlink {
    param(
        [string]$Source,
        [string]$Target
    )
    if (Test-Path $Target) {
        $answer = Read-Host "Target $Target already exists. Overwrite? (y/n)"
        if ($answer -eq 'y' -or $answer -eq 'Y') {
            Remove-Item -Path $Target -Recurse -Force
            New-Item -ItemType SymbolicLink -Path $Target -Target $Source -Force | Out-Null
            Write-Host "Symlink overwritten: $Target -> $Source" -ForegroundColor Green
        } else {
            Write-Host "Skipped: $Target was not overwritten." -ForegroundColor Yellow
        }
    } else {
        New-Item -ItemType SymbolicLink -Path $Target -Target $Source -Force | Out-Null
        Write-Host "Symlink created: $Target -> $Source" -ForegroundColor Green
    }
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# 1. agents -> C:\Users\{USUARIO}\.claude\agents
$srcAgents = Join-Path $scriptDir '..\agents'
$dstAgents = "C:\Users\$USUARIO\.claude\agents"
New-Symlink -Source $srcAgents -Target $dstAgents

# 2. context -> {PROJECT_PATH}\.claude\context
$srcContext = Join-Path $scriptDir '..\context'
$dstContext = Join-Path $PROJECT_PATH '.claude\context'
New-Symlink -Source $srcContext -Target $dstContext

# 3. prompts -> {PROJECT_PATH}\.claude\prompts
$srcPrompts = Join-Path $scriptDir '..\prompts'
$dstPrompts = Join-Path $PROJECT_PATH '.claude\prompts'
New-Symlink -Source $srcPrompts -Target $dstPrompts

# 4. templates -> {PROJECT_PATH}\.claude\templates
$srcTemplates = Join-Path $scriptDir '..\templates'
$dstTemplates = Join-Path $PROJECT_PATH '.claude\templates'
New-Symlink -Source $srcTemplates -Target $dstTemplates

Write-Host "\nAll symbolic links have been processed." -ForegroundColor Cyan
