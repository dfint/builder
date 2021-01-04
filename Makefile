.PHONY: clean download base install_requirements update_requirements

clean:
	rm -rf download
	rm -rf base

base_pack.zip: base_pack_url.txt
	mkdir -p download
	rm base_pack.zip || true
	wget -i base_pack_url.txt -O base_pack.zip
	touch base_pack.zip

download: base_pack.zip

base: base_pack.zip
	rm -rf base
	mkdir -p base
	unzip base_pack.zip -d base

install_requirements: requirements.txt
	pip3 install -r requirements.txt

update_requirements: requirements.txt
	pip3 install -U -r requirements.txt
