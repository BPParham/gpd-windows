@ECHO OFF
COLOR 1F
TITLE %~n0%~x0
SETLOCAL EnableDelayedExpansion
SET YEAR=%DATE:~-4%
SET currentVers=2.2.0273
SET currentDrive=%~d0
SET currentPath=%~dp0
REM CALL :Get-SystemInformation
REM CALL :Get-DriveAssignments
SET devDrive=D:

IF [%1] NEQ [] (
  SET domain="%1"
) ELSE (
	:home
	CLS
	ECHO ============================================================================
	ECHO                            %~n0
	ECHO ============================================================================
	ECHO.
	ECHO BPTechNet %~n0 version %currentVers%
	ECHO Copyright ^(c^) 2000-%YEAR% BP Technology Network
	ECHO.
	ECHO.What type of top level domain will be used?
	ECHO.
	ECHO.1. Commercial
	ECHO.2. Educational
	ECHO.3. Networking
	ECHO.4. Organizational
	REM ECHO.5. 
	REM ECHO.6. 
	REM ECHO.7. 
	REM ECHO.8. 
	ECHO.9. Enter manually ...
	ECHO.
	ECHO.0. Quit
	ECHO.

	SET /p "decide=Enter your choice: "
	IF "!decide!"=="1" SET domain=com& GOTO start
	IF "!decide!"=="2" SET domain=edu& GOTO start
	IF "!decide!"=="3" SET domain=net& GOTO start
	IF "!decide!"=="4" SET domain=org& GOTO start
	REM IF "!decide!"=="5" SET domain=& GOTO start
	REM IF "!decide!"=="6" SET domain=& GOTO start
	REM IF "!decide!"=="7" SET domain=& GOTO start
	REM IF "!decide!"=="8" SET domain=& GOTO start
	IF "!decide!"=="9" GOTO :manual
	IF "!decide!"=="0" EXIT
	ECHO.Invalid choice: %decide%
	ECHO.
	PAUSE
	CLS
	GOTO :home

	:manual
	CLS
	ECHO ============================================================================
	ECHO                            %~n0
	ECHO ============================================================================
	ECHO.
	ECHO BPTechNet %~n0 version %currentVers%
	ECHO Copyright ^(c^) 2000-%YEAR% BP Technology Network
	ECHO.
	SET /P "domain=Enter the abbreviation of the domain: (i.e. 'int' for International) "
	ECHO.
	ECHO.
	ECHO.Domain Abbreviation: !domain!
	ECHO.
	SET /P "domainQuery=Is this the correct domain abbreviation (Y/N)? "
	IF /I "%domainQuery%"=="N" (
		GOTO :home
	)
)

:start
IF [%2] NEQ [] (
  SET clientNAME="%2"
) ELSE (
	CLS
	ECHO ============================================================================
	ECHO                            %~n0
	ECHO ============================================================================
	ECHO.
	ECHO BPTechNet %~n0 version %currentVers%
	ECHO Copyright ^(c^) 2000-%YEAR% BP Technology Network
	ECHO.
	SET /P "clientNAME=Enter the entity abbreviated name (i.e. BPTech): "
	ECHO.
	ECHO.
	ECHO.Entity Name: !clientNAME!
	ECHO.
	SET /P "profileQuery=Is this the correct entity (Y/N)? "
	IF /I "%profileQuery%"=="N" (
		GOTO :start
	)
	ECHO.
)

IF [%3] NEQ [] (
  SET projectCONTAINER="%3"
) ELSE (
	:next
	CLS
	ECHO ============================================================================
	ECHO                            %~n0
	ECHO ============================================================================
	ECHO.
	ECHO BPTechNet %~n0 version %currentVers%
	ECHO Copyright ^(c^) 2000-%YEAR% BP Technology Network
	ECHO.
	SET /P "projectCONTAINER=Enter the name of the project directory: "
	ECHO.
	ECHO.
	ECHO.Project Directory: !projectCONTAINER!
	ECHO.
	SET /P "changeQuery=Is this the correct directory name (Y/N)? "
	IF /I "%changeQuery%"=="N" (
		GOTO :next
	)
)

IF [%4] NEQ [] (
  SET APPLICATION="%4"
	CLS
	ECHO ============================================================================
	ECHO                            %~n0
	ECHO ============================================================================
	ECHO.
	ECHO BPTechNet %~n0 version %currentVers%
	ECHO Copyright ^(c^) 2000-%YEAR% BP Technology Network
	ECHO.
	ECHO.Creating the branches directories...
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches"
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches\develop"
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches\feature"
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches\hotfix"
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches\release"
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches\training"
	ECHO.Creating the tags directories...
	MKDIR "%devDrive%\GITRepositories\%domain%\%clientNAME%\%projectCONTAINER%\tags"
	ECHO.Creating the trunk directories...
	MKDIR "%devDrive%\GITRepositories\%domain%\%clientNAME%\%projectCONTAINER%\trunk\Documentation"
	ECHO.>"%devDrive%\GITRepositories\%domain%\%clientNAME%\%projectCONTAINER%\trunk\Documentation\ReadMe.txt"
	ECHO.
  REM MKDIR "%devDrive%/GITRepositories/%DOMAIN%/%clientNAME%/%projectCONTAINER%/trunk/%APPLICATION%"
  CD "%devDrive%/GITRepositories/%DOMAIN%/%clientNAME%/%projectCONTAINER%/trunk"
  rails new %APPLICATION%
) ELSE (
	CLS
	ECHO ============================================================================
	ECHO                            %~n0
	ECHO ============================================================================
	ECHO.
	ECHO BPTechNet %~n0 version %currentVers%
	ECHO Copyright ^(c^) 2000-%YEAR% BP Technology Network
	ECHO.
	ECHO.Creating the branches directories...
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches"
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches\develop"
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches\feature"
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches\hotfix"
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches\release"
	MKDIR "!devDrive!\GITRepositories\!domain!\!clientNAME!\!projectCONTAINER!\branches\training"
	ECHO.Creating the tags directories...
	MKDIR "%devDrive%\GITRepositories\%domain%\%clientNAME%\%projectCONTAINER%\tags"
	ECHO.Creating the trunk directories...
	MKDIR "%devDrive%\GITRepositories\%domain%\%clientNAME%\%projectCONTAINER%\trunk"
	REM ECHO.>"%devDrive%\GITRepositories\%domain%\%clientNAME%\%projectCONTAINER%\trunk\Documentation\ReadMe.md"
	ECHO.
)

ECHO."Done!"
TIMEOUT /T 5
GOTO :EOF


::---------------------------------------------------------------------------------
::                       Function Get-SystemInformation
::
:: This function
:: Example
::   Get-SystemInformation
:: Returns
:: manufacturer
:: model
:: systemtype
:: serialnumber
::---------------------------------------------------------------------------------
  :Get-SystemInformation
	
	FOR /F "tokens=2 delims='='" %%A IN ('wmic ComputerSystem Get Manufacturer /value') DO SET make=%%A
	FOR /F "tokens=2 delims='='" %%B IN ('wmic ComputerSystem Get Model /value') DO SET nomenclature=%%B
	FOR /F "tokens=2 delims='='" %%C IN ('wmic ComputerSystem Get SystemType /value')DO SET architecture=%%C
	IF "%systemtype%"=="" (
		IF %PROCESSOR_ARCHITECTURE% == AMD64 (
		 SET bitness=64
		)
		IF %PROCESSOR_ARCHITECTURE% == x86 (
		 IF NOT DEFINED PROCESSOR_ARCHITEW6432 SET bitness=86
		)
		SET systemtype=x%bitness%-based PC
	)
	FOR /F "tokens=2 delims='='" %%D IN ('wmic Bios Get SerialNumber /value')DO SET serno=%%D
	
  CALL :Trim-String make
	SET manufacturer=%make%
  CALL :Trim-String nomenclature
	SET model=%nomenclature%
  CALL :Trim-String architecture
	SET systemtype=%architecture%
  CALL :Trim-String serno
	SET serialnumber=%serno%
	
	SET manufacturer=%manufacturer: =-%
	SET model=%model: =-%
	REM SET systemtype=%systemtype: =-%
	REM SET serialnumber=%serialnumber: =-%
	
  GOTO :EOF

::---------------------------------------------------------------------------------
::                       Function Get-DriveAssignments
::
:: This function
:: Example
::   Get-DriveAssignments
:: Returns
:: Drive letter assignments
::---------------------------------------------------------------------------------
  :Get-DriveAssignments

	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='SYSTEM'" GET Name /FORMAT:value') DO SET systemDrive=%%A
	REM ECHO.SYSTEM is drive %systemDrive%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='APPLICATION'" GET Name /FORMAT:value') DO SET applicationDrive=%%A
	REM ECHO.APPLICATION is drive %applicationDrive%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='REPO'" GET Name /FORMAT:value') DO SET repositoryDrive=%%A
	REM ECHO.REPO is drive %repositoryDrive%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='LOGS'" GET Name /FORMAT:value') DO SET logsDrive=%%A
	REM ECHO.LOGS is drive %logsDrive%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='PAGE'" GET Name /FORMAT:value') DO SET pageDrive=%%A
	REM ECHO.PAGE is drive %pageDrive%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='DATABAK'" GET Name /FORMAT:value') DO SET databakDrive=%%A
	REM ECHO.DATABAK is drive %databakDrive%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='DATANDX'" GET Name /FORMAT:value') DO SET datandxDrive=%%A
	REM ECHO.DATANDX is drive %A%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='DATASYS'" GET Name /FORMAT:value') DO SET datasysDrive=%%A
	REM ECHO.DATASYS is drive %A%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='DATATMP'" GET Name /FORMAT:value') DO SET datatmpDrive=%%A
	REM ECHO.DATATMP is drive %A%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='DATAUSR'" GET Name /FORMAT:value') DO SET datausrDrive=%%A
	REM ECHO.DATAUSR is drive %A%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='DATAUSR1'" GET Name /FORMAT:value') DO SET datausr1Drive=%%A
	REM ECHO.DATAUSR1 is drive %A%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='DATAUSR2'" GET Name /FORMAT:value') DO SET datausr2Drive=%%A
	REM ECHO.DATAUSR2 is drive %A%
	FOR /F "Tokens=2 Delims='='" %%A IN ('WMIC LOGICALDISK WHERE "VolumeName='DEVELOPMENT'" GET Name /FORMAT:value') DO SET devDrive=%%A
	REM ECHO.DEVELOPMENT is drive %A%

	IF [%applicationDrive%]==[] (
		SET applicationDrive=%systemDrive%
		IF [%datasysDrive%] NEQ [] (
			SET applicationDrive=%datasysDrive%
		)
	)
	
	ECHO.applicationDrive set to "%applicationDrive%"
	
	IF [%repositoryDrive%]==[] (
		SET repositoryDrive=%systemDrive%
		IF [%applicationDrive%] NEQ [] (
			SET repositoryDrive=%applicationDrive%
		)
	)
	
	IF [%devDrive%]==[] (
		SET devDrive=%systemDrive%
		IF [%applicationDrive%] NEQ [] (
			SET devDrive=%applicationDrive%
		)
		IF [%repositoryDrive%] NEQ [] (
			SET devDrive=%repositoryDrive%
		)
	)
	
	ECHO.devDrive set to "%devDrive%"

	IF [%datausr2Drive%] NEQ [] (
		SET repositoryDrive=%datausr2Drive%
	)
	IF [%datausr1Drive%] NEQ [] (
		SET repositoryDrive=%datausr1Drive%
	)
	IF [%datausrDrive%] NEQ [] (
		SET repositoryDrive=%datausrDrive%
	)
	
	ECHO.repositoryDrive set to "%repositoryDrive%"

	IF [%repositoryDrive%] NEQ [] (
		SET installationDrive=%repositoryDrive%
	)
	IF [%logsDrive%] NEQ [] (
		SET installationDrive=%logsDrive%
	)
	IF [%datatmpDrive%] NEQ [] (
		SET installationDrive=%datatmpDrive%
	)
	IF [%datausrDrive%] NEQ [] (
		SET installationDrive=%datausrDrive%
	)
	IF [%datausr1Drive%] NEQ [] (
		SET installationDrive=%datausr1Drive%
	)
	IF [%datausr2Drive%] NEQ [] (
		SET installationDrive=%datausr2Drive%
	)
	
	ECHO.installationDrive set to "%installationDrive%"
	
	IF [%applicationDrive%]==[] (
		SET devDrive=%systemDrive%
		IF [%datasysDrive%] NEQ [] (
			SET devDrive=%datasysDrive%
		)
	)
	
	IF [%logsDrive%] NEQ [] (
		SET devDrive=%logsDrive%
	)
	IF [%datatmpDrive%] NEQ [] (
		SET devDrive=%datatmpDrive%
	)
	IF [%datausrDrive%] NEQ [] (
		SET devDrive=%datausrDrive%
	)
	IF [%datausr1Drive%] NEQ [] (
		SET devDrive=%datausr1Drive%
	)
	IF [%datausr2Drive%] NEQ [] (
		SET devDrive=%datausr2Drive%
	)
	IF [%devDrive%] NEQ [] (
		SET devDrive=%devDrive%
	)
	
	ECHO.devDrive set to "%devDrive%"

  GOTO :EOF

::---------------------------------------------------------------------------------
::                       Function Trim-String
::
:: This function
:: strText
:: Example
::   Trim-String strText
:: Returns
:: strTemp
::---------------------------------------------------------------------------------
  :Trim-String
	CALL :Trim-StringSub %%%1%%
	SET %1=%strTemp%
  GOTO :EOF

::---------------------------------------------------------------------------------
::                       Function Trim-StringSub
::
:: This function
:: strText
:: Example
::   Trim-StringSub strText
:: Returns
:: strTemp
::---------------------------------------------------------------------------------
  :Trim-StringSub
	SET strTemp=%*
  GOTO :EOF

