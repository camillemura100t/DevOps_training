$connectTestResult = Test-NetConnection -ComputerName cmurastorage.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"cmurastorage.file.core.windows.net`" /user:`"localhost\cmurastorage`" /pass:`"w+yR+HP5eo1GUKnUeepOLW+3zPAWjMNsNZ2isWSxCxHpg4aNPDjZfI34zdOufo1lNRA4olTxRs36vdWwmbtjiA==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\cmurastorage.file.core.windows.net\az104-07-share-cmura" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}