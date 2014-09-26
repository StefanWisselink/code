# Enter Base URL 
baseurl="http://api.nytimes.com/svc/search/v2/articlesearch.json"

# Enter API key"
key="enter your own key here"
# Establish a query --> since we want to see all articles no specific query is established, this field, at this moment, has no function in this code.
query=""
# Select the field we want to specify, in this case we would like to specify the source field. 
field="source"
# Enter a query to be searched within the specified field.
search_field="The+New+York+Times"
# Since the first results immediately show the total number of hits we only need page 0
page=0

# Establish the specific URL based on the pre-defined variables (as of this moment this only works for a query in a specific field, other variables might be added later on by adapting the script) 
requestUrl="$baseurl?fq=$field:(%22$search_field%22)&api-key=$key&page=$page"

# Filter the number of hits from the results (this part of the code is still a bit messy)
results=`curl -s $requestUrl | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

# Display the results
echo "hits=" $results
