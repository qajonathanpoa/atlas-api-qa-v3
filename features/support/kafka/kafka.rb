require "kafka"
require_relative "../utils"

class KafkaConect
  @@utils_project = UtilsProject.new

  #Método para Escrever na fila de QA do Kafka
  def send_kafka_qa(msg)
    @kafka = Kafka.new("kfkh-customhlg-1.dc.nova:9093", client_id: "kafka-preventivo")
    @topic = @@utils_project.obter_caminho("topicos", ENV["CONFIG"])["atlasOn"]
    pretty_msg = JSON.pretty_generate(msg)
    @kafka.deliver_message(pretty_msg.to_s, topic: @topic.to_s)
  end

  #Método para Escrever na fila de SIT do Kafka
  def send_kafka_sit(msg)
    @kafka = Kafka.new("kfkh-customhlg-1.dc.nova:9093", client_id: "kafka-preventivo")
    @topic = @@utils_project.obter_caminho("topicos", ENV["CONFIG"])["sit"]
    pretty_msg = JSON.pretty_generate(msg)
    @kafka.deliver_message(pretty_msg.to_s, topic: @topic.to_s)
  end
end
