#1.Получите справку о командлете справки
Get-Help Get-Help


#2.Пункт 1, но детальную справку, затем только примеры
Get-Help Get-Help -Detailed
(Get-Help Get-Help).examples


#3.Получите справку о новых возможностях в PowerShell 4.0 (или выше)
Get-Help about_Windows_PowerShell_5.0


#4.Получите все командлеты установки значений
Get-Command -Verb Set | Where-Object -Property CommandType -EQ Cmdlet


#5.Получить список команд работы с файлами
Get-Command -Noun *Item*


#6.Получить список команд работы с объектами
Get-Command -Noun *Object*


#7.Получите список всех псевдонимов
Get-Alias


#8.Создайте свой псевдоним для любого командлета
New-Alias -Name GtPr -Value Get-Process


#9.Просмотреть список методов и свойств объекта типа процесс
Get-Process | Get-Member


#10.Просмотреть список методов и свойств объекта типа строка
$a = 'Hello, world!'
$a | Get-Member


#11.Получить список запущенных процессов, данные об определённом процессе
Get-Process
Get-Process -Name 'NVIDIA Web Helper'


#12.Получить список всех сервисов, данные об определённом сервисе
Get-Service
Get-Service -Name Spooler


#13.Получить список обновлений системы
Get-Hotfix


#14.Узнайте, какой язык установлен для UI Windows
Get-WinUILanguageOverride #если результат NULL язык определяется значением из WinUserLanguageList
Get-WinUserLanguageList


#15.Получите текущее время и дату
Get-Date


#16.Сгенерируйте случайное число (любым способом)
Get-Random


#17.Выведите дату и время, когда был запущен процесс «explorer». Получите какой это день недели
Get-Process -Name explorer | Select-Object -Property StartTime

     #StartTime           
     #---------           
     #9/24/2019 8:39:59 AM

$proc = Get-Process -Name explorer | Select-Object -Property StartTime
$proc.StartTime.DayOfWeek
     
     #Tuesday


#18.Откройте любой документ в MS Word (не важно как) и закройте его с помощью PowerShell
Invoke-Item -Path D:\Mod1_Lab1.docx
$Word = [Runtime.Interopservices.Marshal]::GetActiveObject('Word.Application')   #Используем метод .NET для соединения с активным приложением WORD (Запускать от имени пользователя открывшего документ)
$Word.Documents | Where-Object -FilterScript { $_.Name -eq 'Mod1_Lab1.docx' } |  #Находим и закрываем только нужный документ
                  ForEach-Object -Process {$_.Close()}


#19.Подсчитать значение выражения S = 3 * i . N – изменяемый параметр. Каждый шаг выводить в виде строки. (Пример: На шаге 2 сумма S равна 9)
for ($i = 1; $i -le 6; $i++)  #Берём N равное шести
{ 
    [int]$T = 3 * $i
    [int]$S = $T + $S
    Write-Host ("На шаге $i сумма S равна $S")
    
}
Write-Host ("Итоговый результат уравнения равен $S")
$T = 0; $S = 0;    #Обнуляем переменные если захотим провести повторный расчёт

#На шаге 1 сумма S равна 3
#На шаге 2 сумма S равна 9
#На шаге 3 сумма S равна 18
#На шаге 4 сумма S равна 30
#На шаге 5 сумма S равна 45
#На шаге 6 сумма S равна 63
#Итоговый результат уравнения равен 63


#20.Напишите функцию для предыдущего задания. Запустите её на выполнение.
function Lab1_Sum ([Int]$Count)  
          {
                         for ($i = 1; $i -le $Count; $i++)
                   { 
                        [int]$T = 3 * $i
                        [int]$S = $T + $S
                                Write-Host ("На шаге $i сумма S равна $S")
    
                   }
              Write-Host ("Итоговый результат уравнения равен $S")
              $T = 0; $S = 0;
          }

Lab1_Sum (9)
#На шаге 1 сумма S равна 3
#На шаге 2 сумма S равна 9
#На шаге 3 сумма S равна 18
#На шаге 4 сумма S равна 30
#На шаге 5 сумма S равна 45
#На шаге 6 сумма S равна 63
#На шаге 7 сумма S равна 84
#На шаге 8 сумма S равна 108
#На шаге 9 сумма S равна 135
#Итоговый результат уравнения равен 135