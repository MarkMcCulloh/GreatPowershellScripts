param($SvcDirectory)

cd $SvcDirectory

$files = (Get-ChildItem).Name

[regex]$regex = '\w+="[^"]+"'

 foreach ($file in $files) {
   foreach ($match in $regex.Matches((Get-Content $file)).Value){
    Invoke-Expression ('$' + $match)
   }

   Write-Host "<add service=""$($Service), $($Name)"" relativeAddress=""tmp/$($file)"" />"
 }