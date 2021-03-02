require 'aws-sdk'

class TextractController < ApplicationController

    def index

        #Client AWS->Textract
        client = Aws::Textract::Client.new(
            region: 'us-east-2',
            access_key_id: 'KEY-AQUI',
            secret_access_key: 'KEY-AQUI',
        )

        #Disparo do job para analise do documento. A função presente é async, que tem como retorno o ip do JOB.
        job_id = client.start_document_analysis({
            document_location: { 
            s3_object: {
                bucket: "textract14",
                name: "arquivo.pdf",
            },
        },

        #Pega o resultado da analise usando 'job_id' como parametro.
        @resp = @client.get_document_analysis({
            job_id: "17b622851e05d953396f928411b705231b484e07d0ba6f7090342e50bc887791"
        })
       
    end

end
