# frozen_string_literal: true

class AudioProcessingService
  include ServiceBase

  attr_reader :audio_url

  def initialize(audio_url)
    @audio_url = audio_url
  end

  def call
    # Step 1: Download the audio file
    file = download_audio

    file

    # Step 2: Transcribe the audio
    # transcription = transcribe_audio(file)

    # Step 3: Analyze the transcribed text
    # analysis = analyze_text(transcription)

    # Step 4: Return the processed information
    # {
    #   transcription: transcription,
    #   analysis: analysis
    # }
  end

  private

  # TODO we should actually create a call and attach this audio file to it
  def download_audio
    response = HTTParty.get(audio_url)

    raise StandardError, "Failed to download audio from #{audio_url}" unless response.success?

    temp_file = Tempfile.new(['audio', File.extname(@audio_url)])
    temp_file.binmode
    temp_file.write(response.body)
    temp_file.rewind

    begin
      # Attach file to the call model
      call = Call.new
      call.audio_file.attach(
        io: temp_file,
        filename: File.basename(audio_url),
        content_type: response.headers['content-type']
      )

      raise StandardError, "Unable to create call: #{call.errors.full_messages.join(', ')}" unless call.save

      call
    ensure
      temp_file.close
      temp_file.unlink
    end
  end

  def transcribe_audio(file_path)
    # For example, using PocketSphinx or an external transcription service.
    # Assuming transcription returns a text string from audio.
    # Example (replace with your transcription logic):
    "Transcribed text from #{file_path}"
  end

  def analyze_text(transcription)
    # Analyze the transcription for emotional tone, topic, etc.
    # Example:
    {
      topic: 'customer support',
      emotion: 'positive',
      category: 'technical issue'
    }
  end
end
