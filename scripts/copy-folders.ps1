param(
    [string]$USUARIO = $(Read-Host 'Enter the username: '),
    [string]$PROJECT_PATH = $(Read-Host 'Enter the project path: ')
)

function Copy-Folder {
    param(
        [string]$Source,
        [string]$Target,
        [ref]$OverwriteAll
    )
    if (Test-Path $Target) {
        if ($OverwriteAll.Value) {
            Remove-Item -Path $Target -Recurse -Force
            Copy-Item -Path $Source -Destination $Target -Recurse -Force
            Write-Host "Folder copied (overwritten): $Target <- $Source" -ForegroundColor Green
        } else {
            $answer = Read-Host "Target $Target already exists. Overwrite? (y/n/a = yes to all)"
            if ($answer -eq 'a' -or $answer -eq 'A') {
                $OverwriteAll.Value = $true
                Remove-Item -Path $Target -Recurse -Force
                Copy-Item -Path $Source -Destination $Target -Recurse -Force
                Write-Host "Folder copied (overwritten): $Target <- $Source" -ForegroundColor Green
            } elseif ($answer -eq 'y' -or $answer -eq 'Y') {
                Remove-Item -Path $Target -Recurse -Force
                Copy-Item -Path $Source -Destination $Target -Recurse -Force
                Write-Host "Folder copied (overwritten): $Target <- $Source" -ForegroundColor Green
            } else {
                Write-Host "Skipped: $Target was not overwritten." -ForegroundColor Yellow
            }
        }
    } else {
        Copy-Item -Path $Source -Destination $Target -Recurse -Force
        Write-Host "Folder copied: $Target <- $Source" -ForegroundColor Green
    }
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Variable para controlar el modo "yes to all"
$OverwriteAll = $false

# 1. agents -> C:\Users\{USUARIO}\.claude\agents
$srcAgents = Join-Path $scriptDir '..\agents'
$dstAgents = "C:\Users\$USUARIO\.claude\agents"
Copy-Folder -Source $srcAgents -Target $dstAgents -OverwriteAll ([ref]$OverwriteAll)


# 2. agents/skills -> {PROJECT_PATH}\.claude\skills
$srcSkills = Join-Path $scriptDir '..\agents\skills'
$dstSkills = Join-Path $PROJECT_PATH '.claude\skills'
Copy-Folder -Source $srcSkills -Target $dstSkills -OverwriteAll ([ref]$OverwriteAll)

# 2b. agents/skills/xml-doc -> {PROJECT_PATH}\.claude\skills\xml-doc
$srcXmlDoc = Join-Path $scriptDir '..\agents\skills\xml-doc'
$dstXmlDoc = Join-Path $PROJECT_PATH '.claude\skills\xml-doc'
Copy-Folder -Source $srcXmlDoc -Target $dstXmlDoc -OverwriteAll ([ref]$OverwriteAll)

# 2. context -> {PROJECT_PATH}\.claude\context
$srcContext = Join-Path $scriptDir '..\context'
$dstContext = Join-Path $PROJECT_PATH '.claude\context'
Copy-Folder -Source $srcContext -Target $dstContext -OverwriteAll ([ref]$OverwriteAll)

# 3. prompts -> {PROJECT_PATH}\.claude\prompts
$srcPrompts = Join-Path $scriptDir '..\prompts'
$dstPrompts = Join-Path $PROJECT_PATH '.claude\prompts'
Copy-Folder -Source $srcPrompts -Target $dstPrompts -OverwriteAll ([ref]$OverwriteAll)

# 4. templates -> {PROJECT_PATH}\.claude\templates
$srcTemplates = Join-Path $scriptDir '..\templates'
$dstTemplates = Join-Path $PROJECT_PATH '.claude\templates'
Copy-Folder -Source $srcTemplates -Target $dstTemplates -OverwriteAll ([ref]$OverwriteAll)



Write-Host "\nAll folders have been processed (copied)." -ForegroundColor Cyan
