## Availability SLI
### The percentage of successful requests over the last 5m
sum(rate(flask_http_request_total{instance="18.191.144.96:80", status!~"5.*"}[5m]))/sum(rate(flask_http_request_total{instance="18.191.144.96:80"}[5m]))

## Latency SLI
### 90% of requests finish in these times
quantile(0.9, sum(rate(flask_http_request_duration_seconds_bucket{instance="18.191.144.96:80", status=~"2.*"}[10m])) by (le))

## Throughput
### Successful requests per second
sum(rate(flask_http_request_duration_seconds_count{instance="18.191.144.96:80", status=~"2.."}[1m]))

## Error Budget - Remaining Error Budget
### The error budget is 20%
1-(1-sum(rate(flask_http_request_duration_seconds_count{instance="18.191.144.96:80", status!="2.*"}[30d]))/sum(rate(flask_http_request_duration_seconds_count{instance="18.191.144.96:80"}[30d])))/0.2
