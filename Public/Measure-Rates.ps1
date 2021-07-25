function Measure-Rates{
    param(

    )
    $currencyCode = "USDPLN"
    $rates = [System.Collections.ArrayList]::new()
    $previous = @{
        "CurrencyCode" = $currencyCode
        "Rate" = 0
        "Timestamp" =  (Get-Date -UFormat %s)
    }
    while($true){
        $rate = Get-Rates -CurrencyCode $currencyCode
        $rate.Differential = "{0:00.0000}" -f ((($rate.Rate-$previous.Rate)/$previous.Rate)*100)
        $null = $rates.Add($rate)
        $rate
        Save-Hash $rate
        Start-Sleep 60
        $previous = $rate
    }
}