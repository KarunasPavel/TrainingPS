#1.�������� ������� � ���������� �������
Get-Help Get-Help


#2.����� 1, �� ��������� �������, ����� ������ �������
Get-Help Get-Help -Detailed
(Get-Help Get-Help).examples


#3.�������� ������� � ����� ������������ � PowerShell 4.0 (��� ����)
Get-Help about_Windows_PowerShell_5.0


#4.�������� ��� ���������� ��������� ��������
Get-Command -Verb Set | Where-Object -Property CommandType -EQ Cmdlet


#5.�������� ������ ������ ������ � �������
Get-Command -Noun *Item*


#6.�������� ������ ������ ������ � ���������
Get-Command -Noun *Object*


#7.�������� ������ ���� �����������
Get-Alias


#8.�������� ���� ��������� ��� ������ ����������
New-Alias -Name GtPr -Value Get-Process


#9.����������� ������ ������� � ������� ������� ���� �������
Get-Process | Get-Member


#10.����������� ������ ������� � ������� ������� ���� ������
$a = 'Hello, world!'
$a | Get-Member


#11.�������� ������ ���������� ���������, ������ �� ����������� ��������
Get-Process
Get-Process -Name 'NVIDIA Web Helper'


#12.�������� ������ ���� ��������, ������ �� ����������� �������
Get-Service
Get-Service -Name Spooler


#13.�������� ������ ���������� �������
Get-Hotfix


#14.�������, ����� ���� ���������� ��� UI Windows
Get-WinUILanguageOverride #���� ��������� NULL ���� ������������ ��������� �� WinUserLanguageList
Get-WinUserLanguageList


#15.�������� ������� ����� � ����
Get-Date


#16.������������ ��������� ����� (����� ��������)
Get-Random


#17.�������� ���� � �����, ����� ��� ������� ������� �explorer�. �������� ����� ��� ���� ������
Get-Process -Name explorer | Select-Object -Property StartTime

     #StartTime           
     #---------           
     #9/24/2019 8:39:59 AM

$proc = Get-Process -Name explorer | Select-Object -Property StartTime
$proc.StartTime.DayOfWeek
     
     #Tuesday


#18.�������� ����� �������� � MS Word (�� ����� ���) � �������� ��� � ������� PowerShell
Invoke-Item -Path D:\Mod1_Lab1.docx
$Word = [Runtime.Interopservices.Marshal]::GetActiveObject('Word.Application')   #���������� ����� .NET ��� ���������� � �������� ����������� WORD (��������� �� ����� ������������ ���������� ��������)
$Word.Documents | Where-Object -FilterScript { $_.Name -eq 'Mod1_Lab1.docx' } |  #������� � ��������� ������ ������ ��������
                  ForEach-Object -Process {$_.Close()}


#19.���������� �������� ��������� S = 3 * i . N � ���������� ��������. ������ ��� �������� � ���� ������. (������: �� ���� 2 ����� S ����� 9)
for ($i = 1; $i -le 6; $i++)  #���� N ������ �����
{ 
    [int]$T = 3 * $i
    [int]$S = $T + $S
    Write-Host ("�� ���� $i ����� S ����� $S")
    
}
Write-Host ("�������� ��������� ��������� ����� $S")
$T = 0; $S = 0;    #�������� ���������� ���� ������� �������� ��������� ������

#�� ���� 1 ����� S ����� 3
#�� ���� 2 ����� S ����� 9
#�� ���� 3 ����� S ����� 18
#�� ���� 4 ����� S ����� 30
#�� ���� 5 ����� S ����� 45
#�� ���� 6 ����� S ����� 63
#�������� ��������� ��������� ����� 63


#20.�������� ������� ��� ����������� �������. ��������� � �� ����������.
function Lab1_Sum ([Int]$Count)  
          {
                         for ($i = 1; $i -le $Count; $i++)
                   { 
                        [int]$T = 3 * $i
                        [int]$S = $T + $S
                                Write-Host ("�� ���� $i ����� S ����� $S")
    
                   }
              Write-Host ("�������� ��������� ��������� ����� $S")
              $T = 0; $S = 0;
          }

Lab1_Sum (9)
#�� ���� 1 ����� S ����� 3
#�� ���� 2 ����� S ����� 9
#�� ���� 3 ����� S ����� 18
#�� ���� 4 ����� S ����� 30
#�� ���� 5 ����� S ����� 45
#�� ���� 6 ����� S ����� 63
#�� ���� 7 ����� S ����� 84
#�� ���� 8 ����� S ����� 108
#�� ���� 9 ����� S ����� 135
#�������� ��������� ��������� ����� 135