7-Zip 24.09
-----------------

Package of modules of 7-Zip. 

Source code of binaries can be found at:
  http://www.7-zip.org/

This package contains the following files:
  7za.exe     - standalone console version of 7-Zip with reduced formats support.
  7za.dll     - library for working with 7z archives
  7zxa.dll    - library for extracting from 7z archives

7za.exe 
-------

7za.exe - is a standalone console version of 7-Zip with reduced formats support.

  7za.exe             : support for only some formats of 7-Zip.
  7z.exe with 7z.dll  : support for all formats of 7-Zip.

7za.exe and 7z.exe from 7-Zip have same command line interface.
7za.exe doesn't use external DLL files.

You can read Help File (7-zip.chm) from 7-Zip package for description 
of all commands and switches for 7za.exe and 7z.exe.

7za.exe features:

  - High compression ratio in 7z format
  - Supported formats:
      - Packing / unpacking: 7z, xz, ZIP, GZIP, BZIP2 and TAR 
      - Unpacking only: lzma, CAB, ZSTD.
  - Highest compression ratio for ZIP and GZIP formats.
  - Fast compression and decompression
  - Strong AES-256 encryption in 7z and ZIP formats.

Note: another package "LZMA SDK" contains 7zr.exe - that is reduced version of 7za.exe.
But you can use 7zr.exe as "public domain" code.


DLL files
---------

7za.dll and 7zxa.dll are reduced versions of 7z.dll from 7-Zip.
7za.dll and 7zxa.dll support only 7z format.
Note: 7z.dll is main DLL file that works with all archive types in 7-Zip.

7za.dll and 7zxa.dll support the following decoding methods:
    - LZMA, LZMA2, PPMD, BCJ, BCJ2, COPY, 7zAES, BZip2, Deflate.

7za.dll also supports 7z encoding with the following encoding methods:
    - LZMA, LZMA2, PPMD, BCJ, BCJ2, COPY, 7zAES.

7za.dll and 7zxa.dll work via COM interfaces.
But these DLLs don't use standard COM interfaces for objects creating.
