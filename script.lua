local ai_text = get("input-content")
local ai_result = get("ai-results")
print("Script loaded")

-- URL Encode: https://smolkit.com/blog/posts/how-to-url-encode-in-lua/
local function url_encode(str)
    str = string.gsub(str, "([^%w%.%- ])", function(c)
      return string.format("%%%02X", string.byte(c))
    end)
    str = string.gsub(str, " ", "+")
    return str
end

get("send-ai").on_click(function()
  print("Sending resuest to the skibidi API")
  local response = fetch({
    url="https://skibidi.24a.fun/aigc/sparkdesk-v1.5?question=" .. url_encode(ai_text.get_content()),
    method="GET"})
  ai_result.set_content(response["choices"][0]["message"]["content"])
end)
