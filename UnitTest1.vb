Imports System
Imports Xunit

Namespace TestProject3
    Public Class UnitTest1
        <Fact>
        Sub TestSub()
            Dim a As New Process
            a.StartInfo.FileName = "C:\Users\sandbox\source\repos\WindowsApp1\WindowsApp1\bin\Debug\WindowsApp1.exe"
            a.Start()
            a.WaitForExit()
        End Sub
    End Class
End Namespace

