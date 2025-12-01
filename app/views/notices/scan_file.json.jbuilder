json.extract! @notice, :title, :content
json.content_html markdown(@notice.content)
