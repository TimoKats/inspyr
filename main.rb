# main.rb
# requires sinatra, thin/puma and http, tokenizer and json
require 'sinatra'
require 'tokenizer'
require 'json'

def send_json(from_node, to_node)
    graph = JSON.parse(File.read('public/graph.json'))
    graph["nodes"].push({"id" => to_node})
    graph["edges"].push({"from" => from_node, "to" => to_node})
    File.write("public/graph.json", JSON.dump(graph))
end

def initiate_json(keyword)
    graph = Hash.new
    graph["nodes"] = []
    graph["edges"] = []
    graph["nodes"].push({"id" => keyword})
    File.write("public/graph.json", JSON.dump(graph))
end

def get_association_candidates(corpus, locations)
    candidates = Array.new
    locations.each do |location|
        for randomizer in -5..5 do
            index = location + randomizer
            if (index > 0) && (index < corpus.length()) && (randomizer != 0)
                candidates.push(corpus[index])
            end
        end
    end
    return candidates
end

def get_association(corpus, keyword)
    if corpus.include? keyword
        locations = corpus.each_index.select{|word| corpus[word] == keyword}
        candidates = get_association_candidates(corpus, locations)
        return candidates.sample
    else
        corpus.sample
    end
end

def get_corpus
    processed_corpus = Array.new
    corpus = File.open("lib/corpus.txt").read
    stopwords = File.open("lib/stopwords.txt").read
    punctuation = File.open("lib/punctuation.txt").read   
    en_tokenizer = Tokenizer::WhitespaceTokenizer.new
    words = en_tokenizer.tokenize(corpus)    
    words.each do |word|
        if (!stopwords.include? word) && (!punctuation.include? word)
            processed_corpus.push(word.downcase)
        end
    end
    return processed_corpus
end

### pages ###

get '/' do
    erb :index
end

post '/map' do
    if params[:form] == "start brainstorming"
        initiate_json(params["keyword"])
    else
        association = get_association(get_corpus, params[:from_node])
        send_json(params[:from_node], association) 
    end
    erb :map
end