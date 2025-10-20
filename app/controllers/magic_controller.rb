class MagicController < ApplicationController
  def new
  end

  def create
    my_til = params[:my_til]

    prompt_template = Rails.application.credentials.gemini[:prompt]

    prompt = prompt_template.sub("{my_til}", my_til)

    begin
      result = GEMINI_CLIENT.stream_generate_content(
        { contents: { role: "user", parts: { text: prompt } } },
      )
      # puts "==================="
      # puts result
      # puts "==================="

      raw_response = result.map { |res| res.dig("candidates", 0, "content", "parts", 0, "text") }.join

      cleaned_json_string = raw_response.gsub(/```(json)?/, "").strip

      # puts "~~~~~~~~~~~~~~~~~~~"
      # puts cleaned_json_string
      # puts "~~~~~~~~~~~~~~~~~~~"

      @magic = JSON.parse(cleaned_json_string)

      # puts "-------------------"
      # puts @magic
      # puts "-------------------"

    rescue Gemini::Errors::RequestError => e
      @error_message = "🧙‍♀️「魔法がうまくかからないようです⋯。」: #{e.message}"
    rescue JSON::ParserError => e
      @error_message = "🧙‍♀️「私でも読めない魔法が⋯。もう一度お試しいただけますでしょうか。」#{e.message}"
    end
  end
end
