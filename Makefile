all:
	docker build . -t modicn/pandoc && docker push modicn/pandoc
