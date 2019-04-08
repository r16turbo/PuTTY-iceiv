; -*- no -*-
;
; -- Inno Setup installer script for PuTTY and its related tools.
;    Last tested with Inno Setup 5.0.8.
;
; TODO for future releases:
;
;  - It might be nice to have an option to add PSCP, Plink and PSFTP to
;    the PATH. See wish `installer-addpath'.
;
;  - Maybe a "custom" installation might be useful? Hassle with
;    UninstallDisplayIcon, though.
#define VERSION 20190321

[Setup]
AppId=PuTTY
AppName=PuTTY D2D/DW
AppVersion={#VERSION}
AppVerName=PuTTY D2D/DW
AppPublisher=MATSUI Nag
AppPublisherURL=http://ice.hotmint.com/putty/
AppReadmeFile={app}\README.txt
DefaultDirName={code:DefaultBaseDir}\PuTTY
DefaultGroupName=PuTTY
AllowNoIcons=yes
LicenseFile=putty-d2ddw-{#VERSION}\LICENCE
UninstallDisplayIcon={app}\putty.exe
ChangesAssociations=yes
;ChangesEnvironment=yes -- when PATH munging is sorted (probably)
OutputDir=output
OutputBaseFilename=putty-d2ddw-{#VERSION}
Compression=lzma2/max
SolidCompression=yes
PrivilegesRequired=none
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x86 x64

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl,lang\Default.isl"
Name: "ja"; MessagesFile: "compiler:Languages\Japanese.isl,lang\Japanese.isl"

[Components]
Name: "PuTTY"; Description: "{cm:PuTTYComment}"; Types: full compact custom; Flags: fixed
Name: "source"; Description: "{cm:SourceComponent}"; Types: full

[Files]
; We flag all files with "restartreplace" et al primarily for the benefit
; of unattended un/installations/upgrades, when the user is running one
; of the apps at a time. Without it, the operation will fail noisily in
; this situation.
; This does mean that the user will be prompted to restart their machine
; if any of the files _were_ open during installation (or, if /VERYSILENT
; is used, the machine will be restarted automatically!). The /NORESTART
; flag avoids this.
; It might be nicer to have a "no worries, replace the file next time you
; reboot" option, but the developers have no interest in adding one.
; NB: apparently, using long (non-8.3) filenames with restartreplace is a
; bad idea. (Not that we do.)
; 32bit
Source: "putty-d2ddw-{#VERSION}\putty.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\pageant.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\puttygen.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\pscp.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\psftp.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\plink.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
; 64bit
Source: "putty-d2ddw-{#VERSION}\x64\putty.exe"; DestDir: "{app}"; Check: Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\x64\pageant.exe"; DestDir: "{app}"; Check: Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\x64\puttygen.exe"; DestDir: "{app}"; Check: Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\x64\pscp.exe"; DestDir: "{app}"; Check: Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\x64\psftp.exe"; DestDir: "{app}"; Check: Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\x64\plink.exe"; DestDir: "{app}"; Check: Is64BitInstallMode; Flags: promptifolder replacesameversion restartreplace uninsrestartdelete
; misc
Source: "putty-d2ddw-{#VERSION}\ini\putty.ini"; DestDir: "{app}\ini"; Flags: restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\putty.chm"; DestDir: "{app}"; Flags: restartreplace uninsrestartdelete
Source: "putty-d2ddw-{#VERSION}\README"; DestDir: "{app}"; DestName: "README.txt"; Flags: isreadme restartreplace uninsrestartdelete
; japanese
Source: "putty-d2ddw-{#VERSION}\ja-JP\putty.lng"; DestDir: "{app}"; Languages: ja; Flags: restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\ja-JP\pageant.lng"; DestDir: "{app}"; Languages: ja; Flags: restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\ja-JP\puttygen.lng"; DestDir: "{app}"; Languages: ja; Flags: restartreplace uninsrestartdelete
Source: "putty-gdi-{#VERSION}\ja-JP\puttytel.lng"; DestDir: "{app}"; Languages: ja; Flags: restartreplace uninsrestartdelete
; source
Source: "putty-d2ddw-{#VERSION}\patch\d2ddw.diff"; DestDir: "{app}\patch"; Components: source; Flags: restartreplace uninsrestartdelete

[Icons]
Name: "{group}\{cm:PuTTYShortcutName}"; Filename: "{app}\putty.exe"; Comment: {cm:PuTTYComment}
; We have to fall back from the .chm to the older .hlp file on some Windows
; versions.
Name: "{group}\{cm:PuTTYManualShortcutName}"; Filename: "{app}\putty.chm"; MinVersion: 4.1,5.0
Name: "{group}\{cm:PSFTPShortcutName}"; Filename: "{app}\psftp.exe"; Comment: {cm:PSFTPComment}
Name: "{group}\{cm:PuTTYgenShortcutName}"; Filename: "{app}\puttygen.exe"; Comment: {cm:PuTTYgenComment}
Name: "{group}\{cm:PageantShortcutName}"; Filename: "{app}\pageant.exe"; Comment: {cm:PageantComment}
Name: "{commondesktop}\{cm:PuTTYShortcutName}"; Filename: "{app}\putty.exe"; Tasks: desktopicon; Check: IsAdminLoggedOn
Name: "{userdesktop}\{cm:PuTTYShortcutName}"; Filename: "{app}\putty.exe"; Tasks: desktopicon; Check: not IsAdminLoggedOn

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "associate"; Description: "{cm:AssocFileExtension,{cm:PPKTools},.ppk}"

[Registry]
; LOCAL_MACHINE
Root: HKLM; Subkey: "Software\Classes\.ppk"; ValueType: string; ValueName: ""; ValueData: "PuTTYPrivateKey"; Check: IsAdminLoggedOn; Flags: uninsdeletevalue; Tasks: associate
Root: HKLM; Subkey: "Software\Classes\PuTTYPrivateKey"; ValueType: string; ValueName: ""; ValueData: "{cm:PPKTypeDescription}"; Check: IsAdminLoggedOn; Flags: uninsdeletekey; Tasks: associate
Root: HKLM; Subkey: "Software\Classes\PuTTYPrivateKey\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\pageant.exe,0"; Check: IsAdminLoggedOn; Tasks: associate
Root: HKLM; Subkey: "Software\Classes\PuTTYPrivateKey\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\pageant.exe"" ""%1"""; Check: IsAdminLoggedOn; Tasks: associate
Root: HKLM; Subkey: "Software\Classes\PuTTYPrivateKey\shell\edit"; ValueType: string; ValueName: ""; ValueData: "{cm:PPKEditLabel}"; Check: IsAdminLoggedOn; Tasks: associate
Root: HKLM; Subkey: "Software\Classes\PuTTYPrivateKey\shell\edit\command"; ValueType: string; ValueName: ""; ValueData: """{app}\puttygen.exe"" ""%1"""; Check: IsAdminLoggedOn; Tasks: associate
; CURRENT_USER
Root: HKCU; Subkey: "Software\Classes\.ppk"; ValueType: string; ValueName: ""; ValueData: "PuTTYPrivateKey"; Check: not IsAdminLoggedOn; Flags: uninsdeletevalue; Tasks: associate
Root: HKCU; Subkey: "Software\Classes\PuTTYPrivateKey"; ValueType: string; ValueName: ""; ValueData: "{cm:PPKTypeDescription}"; Check: not IsAdminLoggedOn; Flags: uninsdeletekey; Tasks: associate
Root: HKCU; Subkey: "Software\Classes\PuTTYPrivateKey\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\pageant.exe,0"; Check: not IsAdminLoggedOn; Tasks: associate
Root: HKCU; Subkey: "Software\Classes\PuTTYPrivateKey\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\pageant.exe"" ""%1"""; Check: not IsAdminLoggedOn; Tasks: associate
Root: HKCU; Subkey: "Software\Classes\PuTTYPrivateKey\shell\edit"; ValueType: string; ValueName: ""; ValueData: "{cm:PPKEditLabel}"; Check: not IsAdminLoggedOn; Tasks: associate
Root: HKCU; Subkey: "Software\Classes\PuTTYPrivateKey\shell\edit\command"; ValueType: string; ValueName: ""; ValueData: """{app}\puttygen.exe"" ""%1"""; Check: not IsAdminLoggedOn; Tasks: associate
; Add to PATH on NT-class OS?

[UninstallRun]
; -cleanup-during-uninstall is an undocumented option that tailors the
; message displayed.
; XXX: it would be nice if this task weren't run if a silent uninstall is
;      requested, but "skipifsilent" is disallowed.
Filename: "{app}\putty.exe"; Parameters: "-cleanup-during-uninstall"; RunOnceId: "PuTTYCleanup"; StatusMsg: "{cm:UninstallStatusMsg}"

[Code]
function DefaultBaseDir(Param: String) : String;
begin
  if IsAdminLoggedOn then
    Result := ExpandConstant('{pf}')
  else
    Result := ExpandConstant('{localappdata}');
end;