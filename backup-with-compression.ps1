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

# Define the path to the 7z.exe executable:
#$7ZipPath = "C:\Program Files\7-Zip\7z.exe"
$7ZipPath = "7-Zip\7za.exe"

# Define the source folder to compress:
$SourceFolder = ""

# Define the desired ouput 7z archive file path:
$DestinationArchive = ""

# Construct the command to call 7z.exe for compression:
#& $7ZipPath a $DestinationArchive $SourceFolder -r
#   & $7ZipPath : This executes the 7-Zip executable.
#   a : This is the 7-Zip command-line switch for "Add to archive".
#   $DestinationArchive : This specifies the name and path of the 7-Zip archive to be created.
#   $SourceFolder : This specifies the folder whose contents you want to compress. 7-Zip will
#                   automatically include all files and subfolders within this directory.
#   -r : Include all subdirectories when compressing the folder.

## Optional:

# Password Protection:
# To add a password, use the -p switch:
#& $7ZipPath a $DestinationArchive $SourceFolder -p"Password"

# Compression Level:
# To specify a compression level (e.g., maximum compression), use the -mx switch:
#& $7ZipPath a $DestinationArchive $SourceFolder -mx9
# (where 9 is the highest compression level)

# Note: If you frequently use 7-Zip in PowerShell, consider installing the 7Zip4PowerShell
#       module for a more PowerShell-native experience with dedicated cmdlets like Compress-7Zip.
