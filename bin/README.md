## Perform an Active Places search for each of the UK Postcode outcodes

This will download the search results page for *all* of the UK Postcode outcodes, into the /path/to/data/search-results directory.

    $ DATA_DIR=~/path/to/data ruby bin/download-search-results.rb

Optionally download the search results page for specific UK Postcodes, using something like:

    $ DATA_DIR=~/path/to/data POSTCODES=E1 ruby bin/download-search-results.rb