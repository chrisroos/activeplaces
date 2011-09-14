This is made up of three (unnecessarily) tightly coupled components.  A scraper that grabs data from [activeplaces.com](http://activeplaces.com/), a parser that extracts the useful parts of that data and a rails app providing a basic interface on the data.

## History

* 13th Sep 2011 - I forked James Andrew's copy of activeplaces and started tidying some of the things that have been on my list for the last two years.

* 9th Mar 2009 - I wrote about [what we achieved at Rewired State](http://chrisroos.co.uk/blog/2009-03-09-hack-the-government-day-rewired-state).

* 7th Mar 2009 - We moved the repository to git (losing previous revision history) and pushed it to [James Andrews' github account](https://github.com/ja/activeplaces).

* 7th Mar 2009 - [James Adam](http://interblah.net/), [James Andrews](http://jamesandre.ws/) and [Tom Taylor](http://tomtaylor.co.uk/) helped me take the data that I'd scraped and present it in a basic web interface.

* 6th Mar 2009 - I have some crappy scripts that scrape data from activeplaces and attempt to parse the horrendous markup.

* 1st Mar 2009 - [I start work on the project](http://code.google.com/p/chrisroos/source/detail?r=1445)

* 31st Mar 2008 - [I stated that I was going to work on a basic rewrite of activeplaces](http://chrisroos.co.uk/blog/2008-03-31-another-project-public-swimming-pools-in-the-uk)

## Importing data from Active Places

### Step 1. Perform an Active Places search for each of the UK Postcode outcodes

This will download the search results page for *all* of the UK Postcode outcodes, into the /path/to/data/search-results directory.

    $ DATA_DIR=~/path/to/data ruby bin/download-search-results.rb

Optionally download the search results page for specific UK Postcodes, using something like:

    $ DATA_DIR=~/path/to/data POSTCODES=E1 ruby bin/download-search-results.rb

### Step 2. Create the facility types in the database

    $ DATA_DIR=~/path/to/data ruby bin/download-search-form.rb
    $ DATA_DIR=~/path/to/data ruby bin/create-facility-types.rb

### Step 3. Create the sites in the database, by extracting data from the downloaded search results

This will create a site in the database for each of the sites in the search result pages downloaded in step 1.

    $ DATA_DIR=~/path/to/data ruby bin/create-sites-from-search-results.rb

To create sites for specific postcodes, use:

    $ DATA_DIR=~/path/to/data POSTCODES=E1 ruby bin/create-sites-from-search-results.rb

### Step 4. Download site details for each of the sites created in step 3.

    $ DATA_DIR=~/path/to/data ruby bin/download-site-details.rb

### Step 5. Create facilities for each of the sites downloaded in Step 4.

This will create facilities and sub types as required.

    $ ruby bin/update_access_information.rb ~/path/to/site-data

### Step 6. Geocode the sites in the database

    $ ruby bin/geocode-postcodes.rb