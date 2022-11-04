Import-Module -Name WindowsCompatibility
Import-WinModule -Name ActiveDirectory

for ($i=1; $i -le 98; $i=$i+1 )
{
	$oldPass = ConvertTo-SecureString $("TempPass" + $i) -AsPlainText -Force
	$newPassIndex = $i + 1
	$newPass = $("TempPass" + $newPassIndex)
	$newPassSecure = ConvertTo-SecureString $newPass -AsPlainText -Force
	Set-ADAccountPassword -Identity kieran.devlin -NewPassword $newPassSecure -OldPassword $oldPass
	Write-Host $newPass
}
