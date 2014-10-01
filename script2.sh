# Print number of news-items with New York Times as a source, and give a total count per decade. Paste results into a text file.
cat nytimes_humanities_tabbed.csv | awk -F '\t' '{print int($1/10)*10,$6}' | grep 'The New York Times' | sort | uniq -c | awk '{print $1 "\t" $2}' > artikelen_per_decennium.txt

# Print number of Front-page-articles with New York Times as a source (the dataset only contains Front-page-articles from the New York Times), and give a total count per decade.  Paste results into a text file.
cat nytimes_humanities_tabbed.csv | awk -F '\t' '{if ($2 ~ "Front Page" || $8 ~ "Front Page") print int($1/10)*10}' | sort | uniq -c | awk '{print $1}' > voorpagina_artikelen_per_decennium.txt

# Show an explanation of output (create legenda):
echo -e "art\tdec\tfront_art"

# Create output by pasting the previously created text files
paste artikelen_per_decennium.txt voorpagina_artikelen_per_decennium.txt
