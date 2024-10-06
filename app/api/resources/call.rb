# frozen_string_literal: true

module Resources
  class Call < Grape::API
    resource :call do
      helpers do
        def permitted_params
          declared(params, include_missing: false)
        end
      end

      desc 'Create a new call'
      params do
        requires :audio_url, type: String, desc: 'Audio URL'
      end
      post do
        # Supported file formats are wav and mp3
        # Success Response (200 OK):
        # {"id": "new_call_id"}
        # Error Response (422 Unprocessable Entity) if invalid audio file or URL.

        # FOR AUDIO DOWNLOAD
        # require "open-uri"
        # require "fileutils"

        # tempfile = URI.parse("http://somesite.com/audio.mp3").open
        # tempfile.close
        # FileUtils.mv tempfile.path, "audio.mp3"

        # TRANSCRIBE AUDIO
        # 1)PocketSphinx
        # 2)DeepSpeech (by Mozilla)
        # 3)Vosk(limited ruby support)

        # ANALYZE AUDIO

        if permitted_params[:audio_url].present?
          AudioProcessingJob.perform_later(audio_url)

          { message: 'Audio processing started. You will be notified once done.', status: :accepted }
        else
          error!({ error: 'No audio URL provided.' }, 422)
        end
      end

      route_param :id, type: Integer do
        get do
          call = ::Call.find(params[:id])

          # if processing is not complete, return 202 Accepted
          present call, with: Entities::Call
        end
      end
    end
  end
end
