ROOT := `cd ../.. && pwd`

_:

JSON_FILES_WITH_VERSION := 'domain/deno.json app/api/deno.json package/config/deno.json package/util/deno.json'

bump: _pre_bump _bump

@_pre_bump:
    echo
    echo  This version will be used: {{ BOLD + BLUE }}$(just v){{ NORMAL }}
    echo "{{ ITALIC }}(to change - modify first line in ./VERSION.md){{ NORMAL }}"
    echo

[confirm('Ok? (y/N)')]
[script('bash')]
_bump:
    VERSION=$(just v)
    if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z.-]+)?$ ]]; then
      just printError "The first line of ./VERSION.md should be valid semver version format (markdown heading allowed): $VERSION"
      exit 1
    fi
    for FILE in {{ JSON_FILES_WITH_VERSION }}; do
      jq ".version" "$FILE" && \
      jq ".version=\"$VERSION\"" "$FILE" > tmp.$$.json && mv tmp.$$.json "$FILE"
    done
    echo {{ BOLD + BLUE }}v$VERSION
