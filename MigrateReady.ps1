Configuration MigrateReady
{
  param ($MachineName)

  Import-DscResource -ModuleName PSDesiredStateConfiguration
  Import-DscResource -ModuleName cChoco -ModuleVersion 2.0.5.22

  Node $MachineName
  {
    #Install the IIS Role
    WindowsFeature IIS
    {
      Ensure = “Present”
      Name = “Web-Server”
    }

    WindowsFeature WebServer
    {
      Ensure = “Present”
      Name = “Web-WebServer”
    }

    WindowsFeature HttpFeatures
    {
      Ensure = “Present”
      Name = “Web-Common-Http”
    }

    WindowsFeature HttpFeatures1
    {
      Ensure = “Present”
      Name = “Web-Default-Doc”
    }
    WindowsFeature HttpFeatures2
    {
      Ensure = “Present”
      Name = “Web-Dir-Browsing”
    }
    WindowsFeature HttpFeatures3
    {
      Ensure = “Present”
      Name = “Web-Http-Errors”
    }
    WindowsFeature HttpFeatures4
    {
      Ensure = “Present”
      Name = “Web-Static-Content”
    }

    WindowsFeature HealthAndDiagnostics
    {
      Ensure = “Present”
      Name = “Web-Health”
    }
    WindowsFeature HealthAndDiagnostics1
    {
      Ensure = “Present”
      Name = “Web-Http-Logging”
    }
    WindowsFeature HealthAndDiagnostics2
    {
      Ensure = “Present”
      Name = “Web-Request-Monitor”
    }

    WindowsFeature Performance
    {
      Ensure = “Present”
      Name = “Web-Performance”
    }
    WindowsFeature Performance1
    {
      Ensure = “Present”
      Name = “Web-Stat-Compression”
    }

    WindowsFeature Security
    {
      Ensure = “Present”
      Name = “Web-Security”
    }
    WindowsFeature Security1
    {
      Ensure = “Present”
      Name = “Web-Filtering”
    }
    WindowsFeature Security2
    {
      Ensure = “Present”
      Name = “Web-Basic-Auth”
    }
    WindowsFeature Security3
    {
      Ensure = “Present”
      Name = “Web-IP-Security”
    }
    WindowsFeature Security4
    {
      Ensure = “Present”
      Name = “Web-Url-Auth”
    }
    WindowsFeature Security5
    {
      Ensure = “Present”
      Name = “Web-Windows-Auth”
    }
    
    WindowsFeature ApplicationDevelopment
    {
      Ensure = “Present”
      Name = “Web-App-Dev”
    }
    WindowsFeature ApplicationDevelopment1
    {
      Ensure = “Present”
      Name = “Web-Net-Ext”
    }
    WindowsFeature ApplicationDevelopment2
    {
      Ensure = “Present”
      Name = “Web-Net-Ext45”
    }
    WindowsFeature ApplicationDevelopment3
    {
      Ensure = “Present”
      Name = “Web-AppInit”
    }
    WindowsFeature ApplicationDevelopment4
    {
      Ensure = “Present”
      Name = “Web-Asp-Net”
    }
    WindowsFeature ApplicationDevelopment5
    {
      Ensure = “Present”
      Name = “Web-Asp-Net45”
    }
    WindowsFeature ApplicationDevelopment6
    {
      Ensure = “Present”
      Name = “Web-ISAPI-Ext”
    }
    WindowsFeature ApplicationDevelopment7
    {
      Ensure = “Present”
      Name = “Web-ISAPI-Filter”
    }

    WindowsFeature ManagementTools
    {
      Ensure = “Present”
      Name = “Web-Mgmt-Tools”
    }
    WindowsFeature ManagementTools1
    {
      Ensure = “Present”
      Name = “Web-Mgmt-Console”
    }
    WindowsFeature ManagementTools2
    {
      Ensure = “Present”
      Name = “Web-Mgmt-Compat”
      IncludeAllSubFeature = $True
    }
    WindowsFeature ManagementTools3
    {
      Ensure = “Present”
      Name = “Web-Scripting-Tools”     
    }

    WindowsFeature NET3.5
    {
      Ensure = “Present”
      Name = “NET-Framework-Features”
      IncludeAllSubFeature = $True
    }
 
    WindowsFeature NET4.5
    {
      Ensure = “Present”
      Name = “NET-Framework-45-Features”
      IncludeAllSubFeature = $True
    }

    WindowsFeature WindowsProcessActivation
    {
      Ensure = “Present”
      Name = “WAS”
      IncludeAllSubFeature = $True
    }

    WindowsFeature XPSViewer
    {
      Ensure = “Present”
      Name = “XPS-Viewer”
      IncludeAllSubFeature = $True
    }

	cChocoInstaller installChoco
	{
	  InstallDir = "c:\choco"
	}
	
	cChocoPackageInstaller installSqlServer
	{
	  Name = "mssqlserver2014express"
	  DependsOn = "[cChocoInstaller]installChoco"
	}



  }
} 