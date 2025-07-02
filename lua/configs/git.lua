GitSite = {}
GitSite.__index = GitSite

function GitSite:new(url_prefix)
	local o = {}
	setmetatable(o, GitSite)
	o.prefix = url_prefix or ""
	o.format = url_prefix .. "%s.git"
	return o
end

function GitSite:url(repo)
	return string.format(self.format, repo)
end

local url_type = string.lower(vim.g.NVIM_GIT_URL_TYPE or "ssh")
local url_format_table = {
	ssh = "git@%s.com:",
	https = "https://%s/"
}

if not url_format_table[url_format_table] then
	url_type = "ssh"
end
local url_format = url_format_table[url_type]

local site = {
	github = GitSite:new(string.format(url_format, "github")),
	gitlab = GitSite:new(string.format(url_format, "gitlab"))
}

return {
	type = url_type,
	site = site
}
