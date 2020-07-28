#Set-PSDebug -Trace 1

ipmo PSCredentials -verbose -force

$sbhooshi_at_corpnet = New-PSCredential -Username "shalom.bhooshi" -Domain "CORPNET" -Password "S3up34P455w0rd"

$NetworkPrinters = @{
  'MyQ' = @{
    'unc'        = '\\share-1-sk.CORPNET.eu\MyQ';
    'credential' = $sbhooshi_at_corpnet;
    'default'    = $True;
   };
};

$MappedDrives = @{

  'host-homedir' = @{
    'description' = 'Homedrive on the host';
    'drive'       = 'h:';
    'unc'         = '\\vmware-host\Shared Folders\unop';
  };

  'host-tmpdir' = @{
    'description' = 'tmpdir on the host';
    'drive'       = 't:';
    'unc'         = '\\vmware-host\Shared Folders\tmp';
  };

  'corp-shared' = @{
    'description' = 'Public drive on the corporate network';
    'drive'       = 'w:';
    'unc'         = '\\CORPNET.eu\CORPNET\public';
    'credential'  = $sbhooshi_at_corpnet;
  };

  'corp-homedir' = @{
    'description' = 'Homedrive on the corporate network';
    'drive'       = 'z:';
    'unc'         = '\\CORPNET.eu\CORPNET\SK-Home\shalom.bhooshi';
    'credential'  = $sbhooshi_at_corpnet;
  };

};
