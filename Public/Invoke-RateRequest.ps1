function Invoke-RateRequest{
    param(
        [string] $CurrencyCode
    )
    $response = Invoke-WebRequest -Uri https://www.freeforexapi.com/api/live?pairs=USDPLN -Method Get
    $rate = $response.Content | ConvertFrom-Json -AsHashtable
    $rate.rates
}