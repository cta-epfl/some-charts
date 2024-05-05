release:
	helm package mariadb-galera
	helm repo index --url https://cta-epfl.github.io/some-charts/ .
