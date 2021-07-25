function Start-RatesWatcherJob{
    Start-Job -Name CurrencyWatcher -ScriptBlock {
        param(
            [string] $path
        )
        Import-Module "$path\..\CurrencyWatcher.psm1"
        while($true){
            $rate = Get-Rates
            $rate.Differential = Measure-D
            # Save-Rates $rats
            Start-Sleep 60
        }
    } -ArgumentList $PSScriptRoot
}