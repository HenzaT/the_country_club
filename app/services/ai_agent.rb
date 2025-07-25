require 'claude/client'

class AiAgent
  def anthropic_api_key
    @anthropic_api_key ||= ENV['CLAUDE_API_KEY']
  end

  def claude
    @claude ||= Claude::Client.new(anthropic_api_key)
  end

  def format_claude_response(response)
    claude.parse_response(response) rescue "ERROR: Couldn't extract text from Claude response"
  end
end
