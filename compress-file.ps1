# Define the path to the 7z.exe executable
$7ZipPath = "7-Zip\7z.exe"

# Define the source folder to compress:
$SourceFolder = ""

# Define the desired ouput 7z archive file path:
$DestinationArchive = ""

# Construct the command to call 7z.exe for compression:
& $7ZipPath a -t7z $DestinationArchive $SourceFolder -r

## Explanation:
#   & $7ZipPath : This executes the 7-Zip executable.
#   a : This is the 7-Zip command-line switch for "Add to archive".
#   -t7z : Use archive type 7z format. Other types are zip, 7z, gzip, bzip2, or tar
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
