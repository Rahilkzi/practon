
Option Explicit

Dim DestFolder, FolderName, FileName, FileName2, FileName3
DestFolder = CreateObject("WScript.Shell").SpecialFolders("Desktop") & "\"
FolderName = "files"
FileName = "fume.py"
FileName2 = "openpi.py"
FileName3 = "delete.vbs"

' Create the destination folder if it doesn't exist
Dim fso
Set fso = CreateObject("Scripting.FileSystemObject")


If fso.FolderExists(FolderName) Then
 	fso.DeleteFolder(FolderName)
End If
If fso.FileExists(FileName) Then
 	fso.DeleteFile(FileName)
End If
If fso.FileExists(FileName2) Then
 	fso.DeleteFile(FileName2)
End If

If fso.FileExists(FileName3) Then
 	fso.DeleteFile(FileName3)
End If

WScript.Echo "Delete!"

