local ai_text = get("input-content")
local ai_result = get("ai-results")
ai_result.set_content("Waiting...")
get("send-ai").on_click(function()
  local response = fetch(
    url="https://skibidi.24a.fun/aigc/sparkdesk-v1.5?question=" .. ai_text.get_content(),
    method="GET")
  ai_result.set_content(response)
end)
