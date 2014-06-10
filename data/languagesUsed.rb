require 'octokit'

client = Octokit::Client.new(:netrc => true)
client.login

repos = client.repositories

language_obj = {}
repos.each do |repo|
    # sometimes language can be nil
    if repo.language
        if !language_obj[repo.language]
            language_obj[repo.language] = 1
        else
            language_obj[repo.language] += 1
        end
    end
end

puts language_obj.to_s

languages = []
language_obj.each do |lang, count|
      languages.push :language => lang, :count => count
end

puts languages.to_json
