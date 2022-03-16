.PHONY: all add build down ps clean stop ha

all:
	docker run \
		-p 9090:9090 \
		-v ${PWD}/data/prometheus.yml:/etc/prometheus/prometheus.yml \
		prom/prometheus
