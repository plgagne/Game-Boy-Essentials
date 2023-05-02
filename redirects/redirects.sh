#!/bin/zsh
source_file=redirects.json
file=temp/final-redirects.json

echo "${RED}Removing old version of final file ..."
rm $file

echo "${RED}Copying pre-prepared redirections ..."
cp $source_file $file

echo "${RED}Building redirection of articles folder ..."
find "../_site/articles" -type f -name '*' -print0 | while IFS= read -r -d '' line; do
  filename=$(basename "$line")
  printf ",
  {
    \"Condition\": {
      \"KeyPrefixEquals\": \"$filename\\\\\"
    },
    \"Redirect\": {
      \"HostName\": \"gameboyessentials.com\",
      \"ReplaceKeyWith\": \"$filename\"
    }
  },
  {
    \"Condition\": {
      \"KeyPrefixEquals\": \"$filename.html\"
    },
    \"Redirect\": {
      \"HostName\": \"gameboyessentials.com\",
      \"ReplaceKeyWith\": \"$filename\"
    }
  }" >> $file
done
printf "\n]" >> $file

aws_redirect() {
    aws s3api create-bucket --bucket $1 --region us-east-1

    local json_file=`mktemp`
    printf '{"RedirectAllRequestsTo":{"HostName": "%s"}}\n' $2 > $json_file

    aws s3api put-bucket-website --bucket $1 --website-configuration file://$json_file

    rm $json_file
}