##############################################
#設定資料夾位置及資料庫連線
#自動將資料夾內的檔案批次執行sqlcmd
##############################################
$Path="D:\SVN\Update\Terapower更新201804\SQL"#Script路徑
$HostName="192.168.1.24"#主機位置
$DB="TERAPOWERHR"#資料名稱
$UserId="jb"#帳號
$Passwd="JB8421"#密碼
$files=Get-ChildItem -Path $Path | where-object {$_.Extension -eq ".sql"}
foreach($file in $files)
{
    Write-Output Join("正在執行：",$file.FullName.ToString())
    "---------------------------------------------------------------------------"
    sqlcmd -S $HostName -d $DB -U $UserId -P $Passwd -i  $file.FullName
}
Write-Output "---------------------------------------------------------------------------"
