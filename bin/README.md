## Step 1. Perform an Active Places search for each of the UK Postcode outcodes

This will download the search results page for *all* of the UK Postcode outcodes, into the /path/to/data/search-results directory.

    $ DATA_DIR=~/path/to/data ruby bin/download-search-results.rb

Optionally download the search results page for specific UK Postcodes, using something like:

    $ DATA_DIR=~/path/to/data POSTCODES=E1 ruby bin/download-search-results.rb

## Step 2. Create the facility types in the database

    $ DATA_DIR=~/path/to/data ruby bin/download-search-form.rb
    $ DATA_DIR=~/path/to/data ruby bin/create-facility-types.rb

## Step 3. Create the sites in the database, by extracting data from the downloaded search results

This will create a site in the database for each of the sites in the search result pages downloaded in step 1.

    $ DATA_DIR=~/path/to/data ruby bin/create-sites-from-search-results.rb

To create sites for specific postcodes, use:

    $ DATA_DIR=~/path/to/data POSTCODES=E1 ruby bin/create-sites-from-search-results.rb

## Step 4. Download site details for each of the sites created in step 3.

    $ DATA_DIR=~/path/to/data ruby bin/download-site-details.rb

## Step 5. Create facilities for each of the sites downloaded in Step 4.

This will create facilities and sub types as required.

    $ ruby bin/update_access_information.rb ~/path/to/site-data

## Step 6. Geocode the sites in the database

    $ ruby bin/geocode-postcodes.rb