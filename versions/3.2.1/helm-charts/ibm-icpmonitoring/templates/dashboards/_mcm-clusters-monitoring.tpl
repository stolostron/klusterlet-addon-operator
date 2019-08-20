{{/*
  Licensed Materials - Property of IBM
  5737-E67
  @ Copyright IBM Corporation 2016, 2019. All Rights Reserved.
  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
*/}}

{{- define "MCMClustersDashboard" }}
{
    "annotations": {
    "list": [
        {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
        }
    ]
    },
    "description": "Monitors managed cluster using Prometheus. Shows overall cluster CPU / Memory / Filesystem usage as well as individual pod, containers, systemd services statistics. Uses cAdvisor metrics only.",
    "editable": true,
    "gnetId": 315,
    "graphTooltip": 0,
    "id": null,
    "iteration": 1544034411339,
    "links": [],
    "panels": [
    {
        "collapsed": true,
        "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
        },
        "id": 33,
        "panels": [
        {
            "aliasColors": {},
            "bars": false,
            "dashLength": 10,
            "dashes": false,
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "fill": 1,
            "grid": {},
            "gridPos": {
            "h": 5,
            "w": 24,
            "x": 0,
            "y": 1
            },
            "height": "200px",
            "id": 32,
            "isNew": true,
            "legend": {
            "alignAsTable": false,
            "avg": true,
            "current": true,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": false,
            "sideWidth": 200,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
            },
            "lines": true,
            "linewidth": 2,
            "links": [],
            "nullPointMode": "connected",
            "percentage": false,
            "pointradius": 5,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "spaceLength": 10,
            "stack": false,
            "steppedLine": false,
            "targets": [
            {
                "expr": "sum (rate (container_network_receive_bytes_total{cluster_name=~\"^$cluster$\"}[5m]))",
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "Received",
                "metric": "network",
                "refId": "A",
                "step": 10
            },
            {
                "expr": "- sum (rate (container_network_transmit_bytes_total{cluster_name=~\"^$cluster$\"}[5m]))",
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "Sent",
                "metric": "network",
                "refId": "B",
                "step": 10
            }
            ],
            "thresholds": [],
            "timeFrom": null,
            "timeShift": null,
            "title": "Network I/O pressure",
            "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
            },
            "transparent": false,
            "type": "graph",
            "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
            },
            "yaxes": [
            {
                "format": "Bps",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": true
            },
            {
                "format": "Bps",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": false
            }
            ],
            "yaxis": {
            "align": false,
            "alignLevel": null
            }
        }
        ],
        "title": "Network I/O pressure",
        "type": "row"
    },
    {
        "collapsed": true,
        "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 1
        },
        "id": 34,
        "panels": [
        {
            "cacheTimeout": null,
            "colorBackground": false,
            "colorValue": true,
            "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
            ],
            "datasource": "prometheus",
            "editable": true,
            "error": false,
            "format": "percent",
            "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": true,
            "thresholdLabels": false,
            "thresholdMarkers": true
            },
            "gridPos": {
            "h": 5,
            "w": 8,
            "x": 0,
            "y": 2
            },
            "height": "180px",
            "id": 4,
            "interval": null,
            "isNew": true,
            "links": [],
            "mappingType": 1,
            "mappingTypes": [
            {
                "name": "value to text",
                "value": 1
            },
            {
                "name": "range to text",
                "value": 2
            }
            ],
            "maxDataPoints": 100,
            "nullPointMode": "connected",
            "nullText": null,
            "postfix": "",
            "postfixFontSize": "50%",
            "prefix": "",
            "prefixFontSize": "50%",
            "rangeMaps": [
            {
                "from": "null",
                "text": "N/A",
                "to": "null"
            }
            ],
            "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
            },
            "tableColumn": "",
            "targets": [
            {
                "expr": "sum (container_memory_working_set_bytes{id=\"/\",cluster_name=~\"^$cluster$\"}) / sum (machine_memory_bytes{cluster_name=~\"^$cluster$\"}) * 100",
                "interval": "10s",
                "intervalFactor": 1,
                "refId": "A",
                "step": 10
            }
            ],
            "thresholds": "65, 90",
            "title": "Cluster memory usage",
            "transparent": false,
            "type": "singlestat",
            "valueFontSize": "80%",
            "valueMaps": [
            {
                "op": "=",
                "text": "N/A",
                "value": "null"
            }
            ],
            "valueName": "current"
        },
        {
            "cacheTimeout": null,
            "colorBackground": false,
            "colorValue": true,
            "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
            ],
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "format": "percent",
            "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": true,
            "thresholdLabels": false,
            "thresholdMarkers": true
            },
            "gridPos": {
            "h": 5,
            "w": 8,
            "x": 8,
            "y": 2
            },
            "height": "180px",
            "id": 6,
            "interval": null,
            "isNew": true,
            "links": [],
            "mappingType": 1,
            "mappingTypes": [
            {
                "name": "value to text",
                "value": 1
            },
            {
                "name": "range to text",
                "value": 2
            }
            ],
            "maxDataPoints": 100,
            "nullPointMode": "connected",
            "nullText": null,
            "postfix": "",
            "postfixFontSize": "50%",
            "prefix": "",
            "prefixFontSize": "50%",
            "rangeMaps": [
            {
                "from": "null",
                "text": "N/A",
                "to": "null"
            }
            ],
            "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
            },
            "tableColumn": "",
            "targets": [
            {
                "expr": "sum (rate (container_cpu_usage_seconds_total{id=\"/\",cluster_name=~\"^$cluster$\"}[5m])) / sum (machine_cpu_cores{cluster_name=~\"^$cluster$\"}) * 100",
                "interval": "10s",
                "intervalFactor": 1,
                "refId": "A",
                "step": 10
            }
            ],
            "thresholds": "65, 90",
            "title": "Cluster CPU usage (5m avg)",
            "type": "singlestat",
            "valueFontSize": "80%",
            "valueMaps": [
            {
                "op": "=",
                "text": "N/A",
                "value": "null"
            }
            ],
            "valueName": "current"
        },
        {
            "cacheTimeout": null,
            "colorBackground": false,
            "colorValue": true,
            "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
            ],
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "format": "percent",
            "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": true,
            "thresholdLabels": false,
            "thresholdMarkers": true
            },
            "gridPos": {
            "h": 5,
            "w": 8,
            "x": 16,
            "y": 2
            },
            "height": "180px",
            "id": 7,
            "interval": null,
            "isNew": true,
            "links": [],
            "mappingType": 1,
            "mappingTypes": [
            {
                "name": "value to text",
                "value": 1
            },
            {
                "name": "range to text",
                "value": 2
            }
            ],
            "maxDataPoints": 100,
            "nullPointMode": "connected",
            "nullText": null,
            "postfix": "",
            "postfixFontSize": "50%",
            "prefix": "",
            "prefixFontSize": "50%",
            "rangeMaps": [
            {
                "from": "null",
                "text": "N/A",
                "to": "null"
            }
            ],
            "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
            },
            "tableColumn": "",
            "targets": [
            {
                "expr": "sum (container_fs_usage_bytes{device=~\"^/dev/mapper/.+$\",id=\"/\",cluster_name=~\"^$cluster$\"}) / sum (container_fs_limit_bytes{device=~\"^/dev/mapper/.+$\",id=\"/\",cluster_name=~\"^$cluster$\"}) * 100",
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "",
                "metric": "",
                "refId": "A",
                "step": 10
            }
            ],
            "thresholds": "65, 90",
            "title": "Cluster filesystem usage",
            "type": "singlestat",
            "valueFontSize": "80%",
            "valueMaps": [
            {
                "op": "=",
                "text": "N/A",
                "value": "null"
            }
            ],
            "valueName": "current"
        },
        {
            "cacheTimeout": null,
            "colorBackground": false,
            "colorValue": false,
            "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
            ],
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "format": "bytes",
            "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
            },
            "gridPos": {
            "h": 3,
            "w": 4,
            "x": 0,
            "y": 7
            },
            "height": "1px",
            "id": 9,
            "interval": null,
            "isNew": true,
            "links": [],
            "mappingType": 1,
            "mappingTypes": [
            {
                "name": "value to text",
                "value": 1
            },
            {
                "name": "range to text",
                "value": 2
            }
            ],
            "maxDataPoints": 100,
            "nullPointMode": "connected",
            "nullText": null,
            "postfix": "",
            "postfixFontSize": "20%",
            "prefix": "",
            "prefixFontSize": "20%",
            "rangeMaps": [
            {
                "from": "null",
                "text": "N/A",
                "to": "null"
            }
            ],
            "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
            },
            "tableColumn": "",
            "targets": [
            {
                "expr": "sum (container_memory_working_set_bytes{id=\"/\",cluster_name=~\"^$cluster$\"})",
                "interval": "10s",
                "intervalFactor": 1,
                "refId": "A",
                "step": 10
            }
            ],
            "thresholds": "",
            "title": "Used",
            "type": "singlestat",
            "valueFontSize": "50%",
            "valueMaps": [
            {
                "op": "=",
                "text": "N/A",
                "value": "null"
            }
            ],
            "valueName": "current"
        },
        {
            "cacheTimeout": null,
            "colorBackground": false,
            "colorValue": false,
            "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
            ],
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "format": "bytes",
            "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
            },
            "gridPos": {
            "h": 3,
            "w": 4,
            "x": 4,
            "y": 7
            },
            "height": "1px",
            "id": 10,
            "interval": null,
            "isNew": true,
            "links": [],
            "mappingType": 1,
            "mappingTypes": [
            {
                "name": "value to text",
                "value": 1
            },
            {
                "name": "range to text",
                "value": 2
            }
            ],
            "maxDataPoints": 100,
            "nullPointMode": "connected",
            "nullText": null,
            "postfix": "",
            "postfixFontSize": "50%",
            "prefix": "",
            "prefixFontSize": "50%",
            "rangeMaps": [
            {
                "from": "null",
                "text": "N/A",
                "to": "null"
            }
            ],
            "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
            },
            "tableColumn": "",
            "targets": [
            {
                "expr": "sum (machine_memory_bytes{cluster_name=~\"^$cluster$\"})",
                "interval": "10s",
                "intervalFactor": 1,
                "refId": "A",
                "step": 10
            }
            ],
            "thresholds": "",
            "title": "Total",
            "type": "singlestat",
            "valueFontSize": "50%",
            "valueMaps": [
            {
                "op": "=",
                "text": "N/A",
                "value": "null"
            }
            ],
            "valueName": "current"
        },
        {
            "cacheTimeout": null,
            "colorBackground": false,
            "colorValue": false,
            "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
            ],
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "format": "none",
            "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
            },
            "gridPos": {
            "h": 3,
            "w": 4,
            "x": 8,
            "y": 7
            },
            "height": "1px",
            "id": 11,
            "interval": null,
            "isNew": true,
            "links": [],
            "mappingType": 1,
            "mappingTypes": [
            {
                "name": "value to text",
                "value": 1
            },
            {
                "name": "range to text",
                "value": 2
            }
            ],
            "maxDataPoints": 100,
            "nullPointMode": "connected",
            "nullText": null,
            "postfix": " cores",
            "postfixFontSize": "30%",
            "prefix": "",
            "prefixFontSize": "50%",
            "rangeMaps": [
            {
                "from": "null",
                "text": "N/A",
                "to": "null"
            }
            ],
            "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
            },
            "tableColumn": "",
            "targets": [
            {
                "expr": "sum (rate (container_cpu_usage_seconds_total{id=\"/\",cluster_name=~\"^$cluster$\"}[5m]))",
                "interval": "10s",
                "intervalFactor": 1,
                "refId": "A",
                "step": 10
            }
            ],
            "thresholds": "",
            "title": "Used",
            "type": "singlestat",
            "valueFontSize": "50%",
            "valueMaps": [
            {
                "op": "=",
                "text": "N/A",
                "value": "null"
            }
            ],
            "valueName": "current"
        },
        {
            "cacheTimeout": null,
            "colorBackground": false,
            "colorValue": false,
            "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
            ],
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "format": "none",
            "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
            },
            "gridPos": {
            "h": 3,
            "w": 4,
            "x": 12,
            "y": 7
            },
            "height": "1px",
            "id": 12,
            "interval": null,
            "isNew": true,
            "links": [],
            "mappingType": 1,
            "mappingTypes": [
            {
                "name": "value to text",
                "value": 1
            },
            {
                "name": "range to text",
                "value": 2
            }
            ],
            "maxDataPoints": 100,
            "nullPointMode": "connected",
            "nullText": null,
            "postfix": " cores",
            "postfixFontSize": "30%",
            "prefix": "",
            "prefixFontSize": "50%",
            "rangeMaps": [
            {
                "from": "null",
                "text": "N/A",
                "to": "null"
            }
            ],
            "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
            },
            "tableColumn": "",
            "targets": [
            {
                "expr": "sum (machine_cpu_cores{cluster_name=~\"^$cluster$\"})",
                "interval": "10s",
                "intervalFactor": 1,
                "refId": "A",
                "step": 10
            }
            ],
            "thresholds": "",
            "title": "Total",
            "type": "singlestat",
            "valueFontSize": "50%",
            "valueMaps": [
            {
                "op": "=",
                "text": "N/A",
                "value": "null"
            }
            ],
            "valueName": "current"
        },
        {
            "cacheTimeout": null,
            "colorBackground": false,
            "colorValue": false,
            "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
            ],
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "format": "bytes",
            "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
            },
            "gridPos": {
            "h": 3,
            "w": 4,
            "x": 16,
            "y": 7
            },
            "height": "1px",
            "id": 13,
            "interval": null,
            "isNew": true,
            "links": [],
            "mappingType": 1,
            "mappingTypes": [
            {
                "name": "value to text",
                "value": 1
            },
            {
                "name": "range to text",
                "value": 2
            }
            ],
            "maxDataPoints": 100,
            "nullPointMode": "connected",
            "nullText": null,
            "postfix": "",
            "postfixFontSize": "50%",
            "prefix": "",
            "prefixFontSize": "50%",
            "rangeMaps": [
            {
                "from": "null",
                "text": "N/A",
                "to": "null"
            }
            ],
            "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
            },
            "tableColumn": "",
            "targets": [
            {
                "expr": "sum (container_fs_usage_bytes{device=~\"^/dev/mapper/.+$\",id=\"/\",cluster_name=~\"^$cluster$\"})",
                "interval": "10s",
                "intervalFactor": 1,
                "refId": "A",
                "step": 10
            }
            ],
            "thresholds": "",
            "title": "Used",
            "type": "singlestat",
            "valueFontSize": "50%",
            "valueMaps": [
            {
                "op": "=",
                "text": "N/A",
                "value": "null"
            }
            ],
            "valueName": "current"
        },
        {
            "cacheTimeout": null,
            "colorBackground": false,
            "colorValue": false,
            "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
            ],
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "format": "bytes",
            "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
            },
            "gridPos": {
            "h": 3,
            "w": 4,
            "x": 20,
            "y": 7
            },
            "height": "1px",
            "id": 14,
            "interval": null,
            "isNew": true,
            "links": [],
            "mappingType": 1,
            "mappingTypes": [
            {
                "name": "value to text",
                "value": 1
            },
            {
                "name": "range to text",
                "value": 2
            }
            ],
            "maxDataPoints": 100,
            "nullPointMode": "connected",
            "nullText": null,
            "postfix": "",
            "postfixFontSize": "50%",
            "prefix": "",
            "prefixFontSize": "50%",
            "rangeMaps": [
            {
                "from": "null",
                "text": "N/A",
                "to": "null"
            }
            ],
            "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
            },
            "tableColumn": "",
            "targets": [
            {
                "expr": "sum (container_fs_limit_bytes{device=~\"^/dev/mapper/.+$\",id=\"/\",cluster_name=~\"^$cluster$\"})",
                "interval": "10s",
                "intervalFactor": 1,
                "refId": "A",
                "step": 10
            }
            ],
            "thresholds": "",
            "title": "Total",
            "type": "singlestat",
            "valueFontSize": "50%",
            "valueMaps": [
            {
                "op": "=",
                "text": "N/A",
                "value": "null"
            }
            ],
            "valueName": "current"
        }
        ],
        "title": "Total usage",
        "type": "row"
    },
    {
        "collapsed": true,
        "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 2
        },
        "id": 35,
        "panels": [
        {
            "aliasColors": {},
            "bars": false,
            "datasource": "prometheus",
            "decimals": 3,
            "editable": true,
            "error": false,
            "fill": 0,
            "grid": {},
            "gridPos": {
            "h": 7,
            "w": 24,
            "x": 0,
            "y": 15
            },
            "height": "",
            "id": 24,
            "isNew": true,
            "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sideWidth": null,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
            },
            "lines": true,
            "linewidth": 2,
            "links": [],
            "nullPointMode": "connected",
            "percentage": false,
            "pointradius": 5,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "stack": false,
            "steppedLine": true,
            "targets": [
            {
                "expr": "sum (rate (container_cpu_usage_seconds_total{image!=\"\",name=~\"^k8s_.*\",container_name!=\"POD\",cluster_name=~\"^$cluster$\"}[5m])) by (container_name, pod_name)",
                "hide": false,
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "pod: {{ "{{" }} pod_name {{ "}}" }} | {{ "{{" }} container_name {{ "}}" }}",
                "metric": "container_cpu",
                "refId": "A",
                "step": 10
            },
            {
                "expr": "sum (rate (container_cpu_usage_seconds_total{image!=\"\",name!~\"^k8s_.*\",cluster_name=~\"^$cluster$\"}[5m])) by (cluster_name, name, image)",
                "hide": false,
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "docker: {{ "{{" }} cluster_name {{ "}}" }} | {{ "{{" }} image {{ "}}" }} ({{ "{{" }} name {{ "}}" }})",
                "metric": "container_cpu",
                "refId": "B",
                "step": 10
            },
            {
                "expr": "sum (rate (container_cpu_usage_seconds_total{rkt_container_name!=\"\",cluster_name=~\"^$cluster$\"}[5m])) by (cluster_name, rkt_container_name)",
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "rkt: {{ "{{" }} cluster_name {{ "}}" }} | {{ "{{" }} rkt_container_name {{ "}}" }}",
                "metric": "container_cpu",
                "refId": "C",
                "step": 10
            }
            ],
            "thresholds": [],
            "timeFrom": null,
            "timeShift": null,
            "title": "Containers CPU usage (5m avg)",
            "tooltip": {
            "msResolution": true,
            "shared": true,
            "sort": 2,
            "value_type": "cumulative"
            },
            "type": "graph",
            "xaxis": {
            "show": true
            },
            "yaxes": [
            {
                "format": "none",
                "label": "cores",
                "logBase": 1,
                "max": null,
                "min": null,
                "show": true
            },
            {
                "format": "short",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": false
            }
            ]
        }
        ],
        "title": "Containers CPU usage",
        "type": "row"
    },
    {
        "collapsed": true,
        "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 3
        },
        "id": 36,
        "panels": [
        {
            "aliasColors": {},
            "bars": false,
            "datasource": "prometheus",
            "decimals": 3,
            "editable": true,
            "error": false,
            "fill": 0,
            "grid": {},
            "gridPos": {
            "h": 13,
            "w": 24,
            "x": 0,
            "y": 16
            },
            "id": 20,
            "isNew": true,
            "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
            },
            "lines": true,
            "linewidth": 2,
            "links": [],
            "nullPointMode": "connected",
            "percentage": false,
            "pointradius": 5,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "stack": false,
            "steppedLine": true,
            "targets": [
            {
                "expr": "sum (rate (container_cpu_usage_seconds_total{id!=\"/\",cluster_name=~\"^$cluster$\"}[5m])) by (id)",
                "hide": false,
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "{{ "{{" }} id {{ "}}" }}",
                "metric": "container_cpu",
                "refId": "A",
                "step": 10
            }
            ],
            "thresholds": [],
            "timeFrom": null,
            "timeShift": null,
            "title": "All processes CPU usage (5m avg)",
            "tooltip": {
            "msResolution": true,
            "shared": true,
            "sort": 2,
            "value_type": "cumulative"
            },
            "type": "graph",
            "xaxis": {
            "show": true
            },
            "yaxes": [
            {
                "format": "none",
                "label": "cores",
                "logBase": 1,
                "max": null,
                "min": null,
                "show": true
            },
            {
                "format": "short",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": false
            }
            ]
        }
        ],
        "repeat": null,
        "title": "All processes CPU usage",
        "type": "row"
    },
    {
        "collapsed": true,
        "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 5
        },
        "id": 37,
        "panels": [
        {
            "aliasColors": {},
            "bars": false,
            "dashLength": 10,
            "dashes": false,
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "fill": 0,
            "grid": {},
            "gridPos": {
            "h": 7,
            "w": 24,
            "x": 0,
            "y": 6
            },
            "id": 27,
            "isNew": true,
            "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sideWidth": 200,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
            },
            "lines": true,
            "linewidth": 2,
            "links": [],
            "nullPointMode": "connected",
            "percentage": false,
            "pointradius": 5,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "spaceLength": 10,
            "stack": false,
            "steppedLine": true,
            "targets": [
            {
                "expr": "sum (container_memory_working_set_bytes{image!=\"\",name=~\"^k8s_.*\",container_name!=\"POD\",cluster_name=~\"^$cluster$\"}) by (container_name, pod_name)",
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "pod: {{ "{{" }} pod_name {{ "}}" }} | {{ "{{" }} container_name {{ "}}" }}",
                "metric": "container_memory_usage:sort_desc",
                "refId": "A",
                "step": 10
            },
            {
                "expr": "sum (container_memory_working_set_bytes{image!=\"\",name!~\"^k8s_.*\",cluster_name=~\"^$cluster$\"}) by (cluster_name, name, image)",
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "docker: {{ "{{" }} cluster_name {{ "}}" }} | {{ "{{" }} image {{ "}}" }} ({{ "{{" }} name {{ "}}" }})",
                "metric": "container_memory_usage:sort_desc",
                "refId": "B",
                "step": 10
            },
            {
                "expr": "sum (container_memory_working_set_bytes{rkt_container_name!=\"\",cluster_name=~\"^$cluster$\"}) by (cluster_name, rkt_container_name)",
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "rkt: {{ "{{" }} cluster_name {{ "}}" }} | {{ "{{" }} rkt_container_name {{ "}}" }}",
                "metric": "container_memory_usage:sort_desc",
                "refId": "C",
                "step": 10
            }
            ],
            "thresholds": [],
            "timeFrom": null,
            "timeShift": null,
            "title": "Containers memory usage",
            "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 2,
            "value_type": "cumulative"
            },
            "type": "graph",
            "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
            },
            "yaxes": [
            {
                "format": "bytes",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": true
            },
            {
                "format": "short",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": false
            }
            ],
            "yaxis": {
            "align": false,
            "alignLevel": null
            }
        }
        ],
        "title": "Containers memory usage",
        "type": "row"
    },
    {
        "collapsed": true,
        "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 6
        },
        "id": 38,
        "panels": [
        {
            "aliasColors": {},
            "bars": false,
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "fill": 0,
            "grid": {},
            "gridPos": {
            "h": 13,
            "w": 24,
            "x": 0,
            "y": 18
            },
            "id": 28,
            "isNew": true,
            "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "sideWidth": 200,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
            },
            "lines": true,
            "linewidth": 2,
            "links": [],
            "nullPointMode": "connected",
            "percentage": false,
            "pointradius": 5,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "stack": false,
            "steppedLine": true,
            "targets": [
            {
                "expr": "sum (container_memory_working_set_bytes{id!=\"/\",cluster_name=~\"^$cluster$\"}) by (id)",
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "{{ "{{" }} id {{ "}}" }}",
                "metric": "container_memory_usage:sort_desc",
                "refId": "A",
                "step": 10
            }
            ],
            "thresholds": [],
            "timeFrom": null,
            "timeShift": null,
            "title": "All processes memory usage",
            "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 2,
            "value_type": "cumulative"
            },
            "type": "graph",
            "xaxis": {
            "show": true
            },
            "yaxes": [
            {
                "format": "bytes",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": true
            },
            {
                "format": "short",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": false
            }
            ]
        }
        ],
        "title": "All processes memory usage",
        "type": "row"
    },
    {
        "collapsed": true,
        "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 8
        },
        "id": 39,
        "panels": [
        {
            "aliasColors": {},
            "bars": false,
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "fill": 1,
            "grid": {},
            "gridPos": {
            "h": 7,
            "w": 24,
            "x": 0,
            "y": 19
            },
            "id": 30,
            "isNew": true,
            "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sideWidth": 200,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
            },
            "lines": true,
            "linewidth": 2,
            "links": [],
            "nullPointMode": "connected",
            "percentage": false,
            "pointradius": 5,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "stack": false,
            "steppedLine": false,
            "targets": [
            {
                "expr": "sum (rate (container_network_receive_bytes_total{image!=\"\",name=~\"^k8s_.*\",cluster_name=~\"^$cluster$\"}[5m])) by (container_name, pod_name)",
                "hide": false,
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "-> pod: {{ "{{" }} pod_name {{ "}}" }} | {{ "{{" }} container_name {{ "}}" }}",
                "metric": "network",
                "refId": "B",
                "step": 10
            },
            {
                "expr": "- sum (rate (container_network_transmit_bytes_total{image!=\"\",name=~\"^k8s_.*\",cluster_name=~\"^$cluster$\"}[5m])) by (container_name, pod_name)",
                "hide": false,
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "<- pod: {{ "{{" }} pod_name {{ "}}" }} | {{ "{{" }} container_name {{ "}}" }}",
                "metric": "network",
                "refId": "D",
                "step": 10
            },
            {
                "expr": "sum (rate (container_network_receive_bytes_total{image!=\"\",name!~\"^k8s_.*\",cluster_name=~\"^$cluster$\"}[5m])) by (cluster_name, name, image)",
                "hide": false,
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "-> docker: {{ "{{" }} cluster_name {{ "}}" }} | {{ "{{" }} image {{ "}}" }} ({{ "{{" }} name {{ "}}" }})",
                "metric": "network",
                "refId": "A",
                "step": 10
            },
            {
                "expr": "- sum (rate (container_network_transmit_bytes_total{image!=\"\",name!~\"^k8s_.*\",cluster_name=~\"^$cluster$\"}[5m])) by (cluster_name, name, image)",
                "hide": false,
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "<- docker: {{ "{{" }} cluster_name {{ "}}" }} | {{ "{{" }} image {{ "}}" }} ({{ "{{" }} name {{ "}}" }})",
                "metric": "network",
                "refId": "C",
                "step": 10
            },
            {
                "expr": "sum (rate (container_network_transmit_bytes_total{rkt_container_name!=\"\",cluster_name=~\"^$cluster$\"}[5m])) by (cluster_name, rkt_container_name)",
                "hide": false,
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "-> rkt: {{ "{{" }} cluster_name {{ "}}" }} | {{ "{{" }} rkt_container_name {{ "}}" }}",
                "metric": "network",
                "refId": "E",
                "step": 10
            },
            {
                "expr": "- sum (rate (container_network_transmit_bytes_total{rkt_container_name!=\"\",cluster_name=~\"^$cluster$\"}[5m])) by (cluster_name, rkt_container_name)",
                "hide": false,
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "<- rkt: {{ "{{" }} cluster_name {{ "}}" }} | {{ "{{" }} rkt_container_name {{ "}}" }}",
                "metric": "network",
                "refId": "F",
                "step": 10
            }
            ],
            "thresholds": [],
            "timeFrom": null,
            "timeShift": null,
            "title": "Containers network I/O (5m avg)",
            "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 2,
            "value_type": "cumulative"
            },
            "type": "graph",
            "xaxis": {
            "show": true
            },
            "yaxes": [
            {
                "format": "Bps",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": true
            },
            {
                "format": "short",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": false
            }
            ]
        }
        ],
        "title": "Containers network I/O",
        "type": "row"
    },
    {
        "collapsed": true,
        "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 9
        },
        "id": 40,
        "panels": [
        {
            "aliasColors": {},
            "bars": false,
            "datasource": "prometheus",
            "decimals": 2,
            "editable": true,
            "error": false,
            "fill": 1,
            "grid": {},
            "gridPos": {
            "h": 13,
            "w": 24,
            "x": 0,
            "y": 20
            },
            "id": 29,
            "isNew": true,
            "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "sideWidth": 200,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
            },
            "lines": true,
            "linewidth": 2,
            "links": [],
            "nullPointMode": "connected",
            "percentage": false,
            "pointradius": 5,
            "points": false,
            "renderer": "flot",
            "seriesOverrides": [],
            "stack": false,
            "steppedLine": false,
            "targets": [
            {
                "expr": "sum (rate (container_network_receive_bytes_total{id!=\"/\",cluster_name=~\"^$cluster$\"}[5m])) by (id)",
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "-> {{ "{{" }} id {{ "}}" }}",
                "metric": "network",
                "refId": "A",
                "step": 10
            },
            {
                "expr": "- sum (rate (container_network_transmit_bytes_total{id!=\"/\",cluster_name=~\"^$cluster$\"}[5m])) by (id)",
                "interval": "10s",
                "intervalFactor": 1,
                "legendFormat": "<- {{ "{{" }} id {{ "}}" }}",
                "metric": "network",
                "refId": "B",
                "step": 10
            }
            ],
            "thresholds": [],
            "timeFrom": null,
            "timeShift": null,
            "title": "All processes network I/O (5m avg)",
            "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 2,
            "value_type": "cumulative"
            },
            "type": "graph",
            "xaxis": {
            "show": true
            },
            "yaxes": [
            {
                "format": "Bps",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": true
            },
            {
                "format": "short",
                "label": null,
                "logBase": 1,
                "max": null,
                "min": null,
                "show": false
            }
            ]
        }
        ],
        "title": "All processes network I/O",
        "type": "row"
    }
    ],
    "refresh": "1m",
    "schemaVersion": 16,
    "style": "dark",
    "tags": [
    "MCM"
    ],
    "templating": {
    "list": [
        {
        "allValue": null,
        "current": {},
        "datasource": "prometheus",
        "hide": 0,
        "includeAll": false,
        "label": null,
        "multi": false,
        "name": "cluster",
        "options": [],
        "query": "label_values(container_cpu_usage_seconds_total, cluster_name)",
        "refresh": 1,
        "regex": "",
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
        }
    ]
    },
    "time": {
    "from": "now-5m",
    "to": "now"
    },
    "timepicker": {
    "refresh_intervals": [
        "5s",
        "10s",
        "30s",
        "1m",
        "5m",
        "15m",
        "30m",
        "1h",
        "2h",
        "1d"
    ],
    "time_options": [
        "5m",
        "15m",
        "1h",
        "6h",
        "12h",
        "24h",
        "2d",
        "7d",
        "30d"
    ]
    },
    "timezone": "browser",
    "title": "MCM: Managed Cluster Monitoring",
    "version": 1
}
{{- end }}