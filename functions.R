library(httr)
library(jsonlite)
library(dplyr)

# Save api key as a character string, from single line file
key = Sys.getenv("BETA_SAM_API_KEY")


# The start and end date strings have to be strings in the format: mm/dd/yyyy
searchDate = function(apikey, start_date_string, end_date_string, limit){
	baseurl = paste0('https://api.sam.gov/prod/opportunities/v1/search')
	key_url = paste0('?api_key=',apikey)
	# Parameters have to be & separated
	parameters = paste0(
				'&limit=',limit,
				'&postedFrom=',start_date_string,
				'&postedTo=',end_date_string
				
	)
	url = paste0(baseurl,key_url,parameters)
	raw = GET(url)
#	content = content(raw, as = 'text', encoding = 'UTF-8')
#	# Convert to json
#	from_json = fromJSON(content)
#	print(paste0('Status Code: ', raw$status_code))
#	print(from_json$results$name)
	return(raw)
}


