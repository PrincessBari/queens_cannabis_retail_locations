# queens_cannabis_retail_locations

SUMMARY:

In the spirit of celebrating the long-awaited opening of legal storefronts for adult recreational-
use cannabis in NYC beginning in December 2022, I thought up the following
scenario:

You are a retail cannabis entrepreneur who’s been awarded a license by NY State and the
NYC government, and your time has come to choose a retail location. You live in Queens
and, therefore, would like your storefront to be located there.

However, your storefront cannot be located just anywhere. According to the NY State Office
of Cannabis Management’s [“Guidance for Adult-Use Retail Dispensaries” document, under
section 23 (“Location of Licensed Premises”)](https://cannabis.ny.gov/system/files/documents/2023/02/guidance-for-adult-use-retail-dispensaries-2.1.pdf), assuming that the potential location of a
licensed cannabis storefront complies with local zoning ordinances, it cannot be located:
1) within 500 feet of a school. (I downloaded this [dataset of public school locations
from NYC Open Data](https://data.cityofnewyork.us/Education/School-Point-Locations/jfju-ynrr).)
2) within 1000 feet of another for-recreational-use or for-medical-use cannabis
storefront. ([Good Grades in Jamaica](https://www.nbcnews.com/news/nbcblk/new-york-citys-newest-weed-dispensary-opens-black-woman-helm-rcna78191) is the first - and so far the only - recreational-use
storefront in Queens, having opened on March 30th, and my dataset of the three
medical-use dispensaries that exist in Queens were compiled from www.silive.com.)
3) on the same street or avenue and within 200 feet of a building occupied exclusively
as a house of worship. (I will not be applying this rule for this assignment, but wanted
to point it out in case of future research.)

I also scraped using Python retail spaces currently available for lease listed on
https://www.propertyshark.com/. The website showed that there are 179 listings in Queens.
(At first, I was also interested in scraping the pricing info, but for most of the listings, it says,
“Contact for pricing,” so I left this out.) 

Then, I went through the list and deleted a few rows
where there was only ambiguous building info and no address (such as “MTA Master Leasing
Opportunity”). Then, I geocoded all the addresses in R via the Google Maps API. There were
54 addresses that resulted in “NA”s, which is quite a few, but for the sake of time, I decided to
remove these rows instead of trying to figure out what happened this time. In the end, I had
150 locations, but once I pulled the data into ArcGIS, I noticed that seven locations were not
in Queens, so I removed those and was left with 143 locations.

Next, I used the Buffer tool in ArcGIS to create 500-ft buffers around existing school
locations and 1000-ft buffers around the existing cannabis store locations. Then, I used the
Merge tool to merge the two layers of buffers together and dissolve them to form one
combined buffer. Then, I used the Dissolve tool to create a single buffer layer to be used as
the Clip features to extract retail site prospects. Then, I used the Clip tool and selected my
current possible retail sites as the input layer and as the Clip features selected the newly
created Public Schools and Existing Cannabis Stores Dissolve layer.

After opening up the attribute table for the newly created Clip layer, we see 23 retail
locations that fall within the buffer zones. This means that these are too close to the schools
and existing cannabis facilities and, therefore, they cannot be potential storefront sites. This
leaves us with 120 potential locations.

IN THE FUTURE:

Next, I’d be interested in bringing in the data of all the locations of houses of worship and
doing yet another merge/dissolve to weed out more retail site prospects.
