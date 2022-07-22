@echo off
echo Please wait, there will be magic soon.....
set curdir=%cd%


::check nuget is exist in foder
IF EXIST "C:\Users\Public\AppData\Roaming\python\nuget\nuget.exe" (
echo.
) ELSE (
::uzip if not exist
powershell.exe Expand-Archive -LiteralPath "S:\Soft\PyCAD\nuget.zip" -DestinationPath "C:\Users\Public\AppData\Roaming\python\nuget" -Force
)


::check python is exist in foder
IF EXIST "C:\Users\Public\AppData\Roaming\python\tools\python.exe" (
echo.
) ELSE (
::install if not exist
cd C:\Users\Public\AppData\Roaming\python\nuget
nuget.exe install python -ExcludeVersion -Version 3.10.0 -OutputDirectory "C:\Users\Public\AppData\Roaming">nul
)


::path for install packages
PATH="%PATH%; C:\Users\Public\AppData\Roaming\python\tools"
cd C:\Users\Public\AppData\Roaming\python\tools\


::add package name with comma in var
set var=ezdxf,openpyxl,progress,pyacadcom	

::install each package in var
for %%i in (%var%) do  (
    IF EXIST "C:\Users\Public\AppData\Roaming\python\tools\Lib\site-packages\%%i" (
	echo.
	) ELSE (
	python -m pip install %%i>nul
	)
)


::user input for scrypt name example "main" (without .py)
set /p pycmd="Enter Python command: "


::run script
python S:\Soft\PyCAD\Scripts\%pycmd%.py && (
  color 2f
  echo.
  echo Done
  echo.
) || (
  color 4f
  echo.
  echo Command is not correct. Close command window and try again.
  echo.
)


pause
