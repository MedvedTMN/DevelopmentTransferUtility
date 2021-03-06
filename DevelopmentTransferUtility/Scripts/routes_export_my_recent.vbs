' Скрипт выгрузки изменений ТМ.
' Выгружаются изменения, которые были выполнены сегодня текущим пользователем.

Set shell = CreateObject("WScript.Shell")
Set network = CreateObject("WScript.Network")

packageTransformerPath = ""
developmentFolderName = ""
clientPartPathName = ""
exportServerName = ""
exportDatabaseName = ""
exportUserName = ""
exportUserPassword = ""
exportUserAuthentication = "Sql" ' Возможные варианты: Sql/Windows
fromDateFilter = Date()
toDateFilter = Now()
currentUserName = network.UserName
packageType = "routes"

commandLine = _
  "{0}\DevelopmentTransferUtility.exe " & _
  "--mode export " & _
  "--devfolder ""{1}"" " & _
  "--clientpartpath ""{2}"" " & _
  "--server ""{3}"" " & _
  "--database ""{4}"" " & _
  "--username ""{5}"" " & _
  "--password ""{6}"" " & _
  "--authtype ""{7}"" " & _
  "--fromdate ""{8}"" " & _
  "--todate ""{9}"" " & _
  "--userfilter ""{10}"" " & _
  "--type ""{11}"""
commandLine = Replace(commandLine, "{0}", packageTransformerPath)
commandLine = Replace(commandLine, "{1}", developmentFolderName)
commandLine = Replace(commandLine, "{2}", clientPartPathName)
commandLine = Replace(commandLine, "{3}", exportServerName)
commandLine = Replace(commandLine, "{4}", exportDatabaseName)
commandLine = Replace(commandLine, "{5}", exportUserName)
commandLine = Replace(commandLine, "{6}", exportUserPassword)
commandLine = Replace(commandLine, "{7}", exportUserAuthentication)
commandLine = Replace(commandLine, "{8}", fromDateFilter)
commandLine = Replace(commandLine, "{9}", toDateFilter)
commandLine = Replace(commandLine, "{10}", currentUserName)
commandLine = Replace(commandLine, "{11}", packageType)

Call shell.Run(commandLine, 10, True)