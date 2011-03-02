module Codem
  module Jobs
    class TranscodeJob < Codem::Jobs::Base
      def perform
        status = job_status(job)
        
        if status['status'] != 'success'
          job.update_attributes :progress => status['progress'], 
                                :duration => status['duration'], 
                                :filesize => status['filesize']

          reschedule
        end
      end
    end
  end
end