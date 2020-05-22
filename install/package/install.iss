
[Setup]
AppName=StarCitizen Helper
AppVersion=1.0.2.8
DefaultDirName={commonpf}\StarCitizen Helper
DefaultGroupName=StarCitizen Helper
SourceDir=C:\google\programming\GitHub\StarCitizen-Helper\install\package\Input
OutputDir=C:\google\programming\GitHub\StarCitizen-Helper\install\package\Output
ArchitecturesInstallIn64BitMode=x64
UninstallDisplayIcon={app}\StarCitizen Helper.exe

[Files]
Source: "StarCitizen Helper.exe"; DestDir: "{app}"; Components: main
Source: "Shin0by soft.ico"; DestDir: "{app}"; Components: main
Source: "config.ini"; DestDir: "{app}"; Components: main; Permissions: users-modify
Source: "INIFileParser.dll"; DestDir: "{app}"; Components: main
Source: "required\NDP472-KB4054531-Web.exe"; DestDir: "{tmp}"; Components: framework; AfterInstall: AfterInstallProcedure

[Types]
Name: "full"; Description: "������ ���������"
Name: "compact"; Description: "����������� ���������"
Name: "custom"; Description: "���������� ���������"; Flags: iscustom

[Icons]
Name: "{commondesktop}\StarCitizen Helper"; Filename: "{app}\StarCitizen Helper.exe"; Components: links\desktop;
Name: "{commondesktop}\StarCitizen Helper"; Filename: "{app}\StarCitizen Helper.exe"; Components: links\desktop;

[Components]
Name: "main"; Description: "StarCitizen Helper"; Types: full compact custom; Flags: fixed
Name: "framework"; Description: "Microsoft .Net Framework 4.7.2"; Types: full
Name: "links"; Description: "������:"; Types: full
Name: "links\desktop"; Description: "�� ������� �����"; Types: full
Name: "links\mainmenu"; Description: "� ������� ����"; Types: full



[Code]
procedure AfterInstallProcedure();
	var
		ResultCode: Integer;
	begin
		if not Exec(ExpandConstant('{tmp}\NDP472-KB4054531-Web.exe'), '', '', SW_SHOWNORMAL, ewWaitUntilTerminated, ResultCode)
		then
			MsgBox('��������� �������������� ����������� ����������� � �������' + #13#13 + SysErrorMessage(ResultCode), mbError, MB_OK);
	end;

//function InitializeSetup(): Boolean;
//begin
//  MsgBox('��������!'#13
//         '��� ������ ��������� ������� Microsoft .NET Framework 4.5 � �����, ���� �� �� ����������, �� �� ������ ���������� ��� ��������������.'#13#13
//         '������ �� ��� ������ Microsoft .NET Framework: https://dotnet.microsoft.com/download/dotnet-framework'#13#13
//         '������� �� ��� ����������� ���������', mbInformation, MB_OK);
//  result := true;
//end;
