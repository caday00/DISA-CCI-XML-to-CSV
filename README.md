# DISA-CCI-XML-to-CSV
This script was developed in order to parse the DISA CCI List XML file into CSV format for easier import and parsing into other tools. 

Download the CCI list from: https://iase.disa.mil/stigs/cci/Pages/index.aspx

Usage: 

Convert_DISA_CCIs_to_CSV.ps1 

Parameters:
  -InputFile <path to U_CCI_List.xml> 
  -OutputFile <path to save location.csv> 
  -SCCFilter <version number 1, 3, or 4> 
  
SCCFilter Corresponds to:
  - NIST SP 800-53A revision 1
  - NIST SP 800-53  revision 3
  - NIST SP 800-35  revision 4

Example:

PS C:\Temp\u_cci_list> .\Convert_DISA_CCIs_to_CSV.ps1 -InputFile U_CCI_List.xml -OutputFile cciList.csv -SCCFilter 1
