get-wmiobject win32_service | where-object {$_.Name -like 'Apache CouchDB*'} | select Description
