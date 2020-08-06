invoke_lambda_func() {
  payload=$(curl "https://vzvnfe3mqf.execute-api.us-east-1.amazonaws.com/test")
  echo $payload

  if [ $payload == '{"message":"Forbidden"}']
  then
    exit 1
  fi
}
