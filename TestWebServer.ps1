
#counter for counting number of iterations
$counter = 0
$maxIterations = 200
#how long to pause between requests depending on load
$pause = 0
#root site, I used this for SharePoint testing so may need to adjust this
$RootSite = "https://<URL goes here>"

"------------------------------------------"
"------------------------------------------"
"Begin"
get-date
#let's you know when it started.
"------------------------------------------"
"------------------------------------------"


#loop through however many times you chose
while ($counter -lt $maxIterations){

#get a randmo number between min and max number of URL options 
$UrlNumber = Get-Random -Maximum 14 -Minimum 0

#switch to pick one of the URLs
switch ($UrlNumber) {

  #each option requires number then URL inside {}
  1 { $URL = $RootSite }
  2 { $URL = $RootSite + "/Shared%20Documents/Forms/AllItems.aspx" }
  3 { $URL = $RootSite + "/_layouts/15/viewlsts.aspx" }
  4 { $URL = $RootSite + "/SitePages/How%20To%20Use%20This%20Library.aspx" }
  5 { $URL = $RootSite + "/_layouts/15/settings.aspx" }
  6 { $URL = $RootSite + "/Shared%20Documents/BoxCat_Games_-_06_-_Young_Love.mp3" }
  7 { $URL = $RootSite + "/_layouts/15/listedit.aspx?List=%7B9E226335%2D9BF3%2D449C%2DB5A7%2D7B4C782AF4EB%7D" }
  8 { $URL = $RootSite + "/_layouts/15/ManageFeatures.aspx" }
  9 { $URL = $RootSite + "/_layouts/15/designgallery.aspx" }
  10 { $URL = $RootSite + "/_layouts/15/mngfield.aspx" }
  11 { $URL = $RootSite + "/_layouts/15/mngctype.aspx" }
  12 { $URL = $RootSite + "/Shared%20Documents/BoxCat_Games_-_15_-_Meeting_MtFox.mp3" }
  13 { $URL = $RootSite + "/_layouts/15/start.aspx#/_layouts/15/viewlsts.aspx" }

}

#request URL using the current person running the powershell and show the status code (200 equals good)
(Invoke-WebRequest -Uri $URL -UseDefaultCredentials).statuscode

#pause if needed
Start-Sleep -Seconds $pause

#increment counter and loop
$counter++
}

#let you know it's done and what time it finished
"End"
get-date