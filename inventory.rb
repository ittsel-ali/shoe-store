require 'kafka'

kafka = Kafka.new(["localhost:9092"])

producer = kafka.async_producer


STORE_STORES = ['ALDO Centre Eaton', 'ALDO Destiny USA Mall', 'ALDO Pheasant Lane Mall', 'ALDO Holyoke Mall', 'ALDO Maine Mall', 'ALDO Crossgates Mall', 'ALDO Burlington Mall', 'ALDO Solomon Pond Mall', 'ALDO Auburn Mall', 'ALDO Waterloo Premium Outlets']
SHOES_MODELS = ['ADERI', 'MIRIRA', 'CAELAN', 'BUTAUD', 'SCHOOLER', 'SODANO', 'MCTYRE', 'CADAUDIA', 'RASIEN', 'WUMA', 'GRELIDIEN', 'CADEVEN', 'SEVIDE', 'ELOILLAN', 'BEODA', 'VENDOGNUS', 'ABOEN', 'ALALIWEN', 'GREG', 'BOZZA' ]
INVENTORY = Array(0..100)
RANDOMNESS = Array(1..3)

loop do
  message = {
    id: (Time.now.to_f * 1_000_000).to_i,
    store: STORE_STORES.sample,
    model: SHOES_MODELS.sample,
    inventory: INVENTORY.sample,
  }

  producer.produce(message.to_json, topic: "inventory_updates")
  producer.deliver_messages

  sleep 1
end