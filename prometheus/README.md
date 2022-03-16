dbpulse average runtime:

    sum(rate(dbpulse_runtime_sum[5m])) / sum(rate(dbpulse_runtime_count[5m]))
