$p = Start-Process -FilePath $args[0] -ArgumentList "/VerySilent /CLOSEAPPLICATIONS" -Wait -PassThru
$p.WaitForExit()
if ($p.ExitCode -ne 0) {
    throw "failed"
}

