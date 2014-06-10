require 'octokit'
Octokit.auto_paginate = false
client = Octokit::Client.new(:netrc => true)
client.login
ORGANIZATION_INDEX = 3 

repos = client.get(client.orgs[ORGANIZATION_INDEX].repos_url, :per_page => 100)
nil_count = 0
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


languages = []
language_obj.each do |lang, count|
    languages.push :language => lang, :count => count
end

# puts languages.to_json
