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
    New-Item -Path $BackupFolder -ItemType Directory -Force
}

# This is the core command for copying.
#       -Recurse : ensures that all subfolders and their contents are copied.
#       -Force : allows overwriting existing files if they have the same name in the destination.
#       -ErrorAction SilentlyContinue : Suppresses errors during the copy process
# Copy the items from source to destination:
Copy-Item -Path $SourcePath -Destination $BackupFolder -Recurse -Force -ErrorAction SilentlyContinue

## Optional: Add compression to save space
# $zipFileName = Join-Path -Path $BackupFolder -ChildPath "Backup_$Timestamp"
# Compress-Archive -Path $BackupFolder -DestinationPath $zipFileName -CompressionLevel Optimal
# Remove-Item -Path $BackupFolder -Recurse -Force
# Optional: Delete the uncompressed folder after zipping

Write-Host "Backup of $SourcePath to $BackupFolder completed successfully."
