Clear-Host

Remove-Module [p]sake

$psakeModule = (Get-ChildItem (".\src\BuildToolKit\Packages\psake*\tools\psake.psm1")).FullName | Sort-Object $_ | select -Last 1

Import-Module $psakeModule

Invoke-psake -buildFile  .\src\BuildToolKit\Build\default.ps1 `
			 -taskList Test `
             -framework 4.5.2 `
			 -properties @{ "buildConfiguration" = "Release"
                            "buildPlatform" = "Any CPU"} `
			 -parameters @{ "solutionFile" = "..\BuildToolKit.sln" } 

Write-Host "Build exit code:" $LASTEXITCODE

exit $LASTEXITCODE