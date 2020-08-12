# NOTE: requires env vars _ACCESS_TOKEN, _OTHER_TOKEN, and _BASE_URL

assert_status() {
  # usage: assert_status "$header_file" $status_code
  if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    exit 1
  fi

  printf -v pattern "HTTP/[1-9]\.?[1-9]? %d" $2

  if ! grep -qE "$pattern" "$1"; then
    >&2 printf "http status does not equal %d\n" $2
    >&2 cat "$1"
    exit 1
  fi
}

assert_equal() {
  # usage: assert_equal "$a" "$b"
  if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    exit 1
  fi

  if [[ "$1" != "$2" ]]; then
    >&2 printf "values are not equal\n" "$1" "$2"
    exit 1
  fi
}

assert_match() {
  # usage: assert_match "$string" $pattern
  if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    exit 1
  fi

  if [[ ! $1 =~ $2 ]]; then
    >&2 printf "string %s does not match pattern %s\n" "$1" "$2"
    exit 1
  fi
}

lurc() {
  curl -s --proto '=https' --tlsv1.2 "$@"
}

test_balance_get_200() {
  printf "test_balance_get_200\n"
  printf "$_BASE_URL"
  # resp_head="$(mktemp)"
  # resp_body="$(mktemp)"
  #
  # document_id="api-test-document-$(date +%s%N)"
  #
  # lurc \
  #   -X "GET" \
  #   -D "$resp_body" \
  #   "$_BASE_URL/balance"

  # echo $resp_body
  # assert_status "$resp_body" ''
  #
  # lurc \
  #   -X GET \
  #   -H "authorization: Bearer $_ACCESS_TOKEN" \
  #   -D "$resp_head" \
  #   "$_BASE_URL/documents/$document_id" \
  # > "$resp_body"
  #
  # assert_status "$resp_head" 200
  #
  # name="$(jq -r '.document.name' "$resp_body")"
  # lastModified="$(jq -r '.document.lastModified' "$resp_body")"
  # size=$(jq -r '.document.size' "$resp_body")
  # content="$(jq -r '.document.content' "$resp_body")"
  #
  # assert_equal "$name" "$document_id"
  #
  # assert_match "$lastModified" '^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$'
  #
  # assert_match "$size" '^[0-9]+$'
  #
  # assert_match "$content" '^<!doctype html>.+'
}
