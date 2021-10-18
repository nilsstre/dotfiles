
# kill ports easily
function killport
	if set -q argv[1]
		kill -9 (lsof -t -i:$argv[1])
	end
end