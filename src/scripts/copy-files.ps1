
# WARNING: CLAUDE process must not be running
Write-Host "IMPORTANT: The CLAUDE process on this computer MUST NOT be running or changes will not be applied." -ForegroundColor Yellow

# Prompt for username
$localUser = Read-Host "Enter the Windows username for the destination (e.g., johndoe)"


# Prompt for project path (destination for project .claude)
$destProjectDir = Read-Host "Enter the full project path (e.g., C:\Projects\MyApp)"

# Validate project path
if (!(Test-Path $destProjectDir)) {
	Write-Host "ERROR: The specified project path does not exist: $destProjectDir" -ForegroundColor Red
	exit 1
}

# Copy .claude folders with interactive overwrite prompts and summary

function Copy-WithPrompt {
	param(
		[string]$Source,
		[string]$Destination,
		[ref]$Summary,
		[ref]$OverwriteAll
	)

	$items = Get-ChildItem -Path $Source -Recurse -Force
	foreach ($item in $items) {
		$relativePath = $item.FullName.Substring($Source.Length)
		$destPath = Join-Path $Destination $relativePath.TrimStart('\','/')

		if ($item.PSIsContainer) {
			if (!(Test-Path $destPath)) {
				New-Item -ItemType Directory -Path $destPath | Out-Null
				$Summary.Value.Add("Created folder: $destPath")
			}
		} else {
			$shouldCopy = $true
			if (Test-Path $destPath) {
				if (-not $OverwriteAll.Value) {
					Write-Host "File exists: $destPath"
					$choice = $null
					while ($null -eq $choice) {
						Write-Host "Overwrite? (no [n] / yes, this time [y] / yes, always [a]): " -NoNewline
						$input = Read-Host
						switch ($input.ToLower()) {
							'no' { $shouldCopy = $false; $choice = 'no' }
							'n' { $shouldCopy = $false; $choice = 'no' }
							'yes, this time' { $shouldCopy = $true; $choice = 'once' }
							'y' { $shouldCopy = $true; $choice = 'once' }
							'yes, always' { $shouldCopy = $true; $OverwriteAll.Value = $true; $choice = 'always' }
							'a' { $shouldCopy = $true; $OverwriteAll.Value = $true; $choice = 'always' }
							default { Write-Host "Please enter 'no' [n], 'yes, this time' [y], or 'yes, always' [a]." }
						}
					}
				}
			}
			if ($shouldCopy) {
				$destDir = Split-Path $destPath -Parent
				if (!(Test-Path $destDir)) {
					New-Item -ItemType Directory -Path $destDir -Force | Out-Null
				}
				Copy-Item -Path $item.FullName -Destination $destPath -Force
				$Summary.Value.Add("Copied file: $destPath")
			} else {
				$Summary.Value.Add("Skipped file: $destPath")
			}
		}
	}
}



# Always use script's project directory for sources
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $scriptDir

$userSource = Join-Path $projectRoot '\user\.claude'
$userDest = "C:\Users\$localUser\.claude"
$projSource = Join-Path $projectRoot '\project\.claude'
$projDest = Join-Path $destProjectDir '.claude'

# Prepare summary and overwrite flag
$summary = [System.Collections.Generic.List[string]]::new()
$overwriteAll = $false

Write-Host "Copying $userSource to $userDest..."
Copy-WithPrompt -Source $userSource -Destination $userDest -Summary ([ref]$summary) -OverwriteAll ([ref]$overwriteAll)

$overwriteAll = $false # Reset for second copy
Write-Host "Copying $projSource to $projDest..."
Copy-WithPrompt -Source $projSource -Destination $projDest -Summary ([ref]$summary) -OverwriteAll ([ref]$overwriteAll)

# Summary output
Write-Host "\n===== SUMMARY OUTPUT ====="
foreach ($line in $summary) {
	Write-Host $line
}
Write-Host "===== END OF SUMMARY ====="
