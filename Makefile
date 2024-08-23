files := compose.yml

default: ${files}
	@docker compose up 
