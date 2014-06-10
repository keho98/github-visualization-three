require 'octokit'
Octokit.auto_paginate = false
client = Octokit::Client.new(:netrc => true)
client.login
ORGANIZATION_INDEX = 3

repos = client.get(client.orgs[ORGANIZATION_INDEX].repos_url, :per_page => 100)
nil_count = 0
language_obj = {}

repo_data = []

repos.each do |repo|
    # sometimes language can be nil
    if repo.languages_url
        repo_data.push :data => client.get(repo.languages_url).to_h, :name => repo.name, :updated_at => repo.updated_at, :created_at => repo.created_at
    end
end

puts repo_data.to_json
