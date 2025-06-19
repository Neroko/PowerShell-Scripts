# These variables define the location of the files/folders to be backed up and the target location
# for the backup, respectively.
# Define source and destination paths:
$SourcePath = ""
$DestinationPath = ""

# A timestamp is generated and incorporated into the backup folder name to create unique backups
# each time the script is run.
# Create a timestamp for the backup folder:
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$BackupFolder = Join-Path -Path $DestinationPath -ChildPath "Backup_$Timestamp"

# These cmdlets check if the destination backup folder exists and create it if it doesn't.
# Create the backup destination folder if it doesn't exist:
If (-not (Test-Path -Path $BackupFolder)) {
    New-Item -Path $BackupFolder -ItemType Directory
}

# This is the core command for copying.
#       -Recurse : ensures that all subfolders and their contents are copied.
#       -Force : allows overwriting existing files if they have the same name in the destination.
# Copy the items from source to destination:
Copy-Item -Path $SourcePath -Destination $BackupFolder -Recurse -Force

Write-Host "Backup completed successfully to: $BackupFolder"
