param(
    [Parameter (Mandatory = $True)]
    [string]$InputFile, 
    [Parameter (Mandatory = $True)]
    [string]$OutputFile, 
    [Parameter (Mandatory = $True)]
    [string]$SCCFilter)

# Load U_CCI_List.xml into a XML object downloaded from https://iase.disa.mil/stigs/cci/Pages/index.aspx
[xml]$CCIx = Get-Content -Path $InputFile -EA Stop

if($CCIx){
    $cciCollection = @()
    foreach($cciItem in $CCIx.cci_list.cci_items.cci_item)
    {
        if($cciItem.references.reference.version -EQ $CCIFilter){
            $cci = New-Object -TypeName PSObject -Property ([ordered]@{
                cciID = $cciItem.id
                definition = $cciItem.definition
                type = $cciItem.type
                version = $cciItem.references.reference.version | Select-Object -Unique | Out-String
                references = $cciItem.references.reference.title | Select-Object -Unique | Out-String
                affectedControl = $cciItem.references.reference.index | Select-Object -Unique | Out-String
        })
    }   
    $cciCollection += $cci
    }
}  
$cciCollection | Export-Csv $OutputFile -NoTypeInformation