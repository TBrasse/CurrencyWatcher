function Start-RatesWatcherJob{
    Start-Job -Name CurrencyWatcher -ScriptBlock {
        param(
            [string] $path
        )
        Import-Module D:\Workspace\Projects\CurrencyWatcher\CurrencyWatcher.psm1
        while($true){
            Get-Rates
            Start-Sleep 60
        }
    } -ArgumentList $PSScriptRoot
}