FROM opensearchproject/opensearch-dashboards:2.7.0

WORKDIR /usr/share/opensearch-dashboards

ENV PATH=/usr/share/opensearch-dashboards/bin:$PATH

#
# Plugins installation & configuration
#

# Install visualization plugins
RUN opensearch-dashboards-plugin install "https://github.com/dlumbrer/kbn_radar/releases/download/osd-2.7.0/kbn_radar-7.10.0_2.7.0.zip" && \
    opensearch-dashboards-plugin install "https://github.com/dlumbrer/kbn_network/releases/download/osd-2.7.0/kbn_network-7.10.0_2.7.0.zip" && \
    opensearch-dashboards-plugin install "https://github.com/dlumbrer/kbn_dotplot/releases/download/osd-2.7.0/kbn_dotplot-7.10.0_2.7.0.zip" && \
    opensearch-dashboards-plugin install "https:/github.com/dlumbrer/kbn_polar/releases/download/osd-2.7.0/kbn_polar-1.0.0_2.7.0.zip"

# Install enhanced table plugin
RUN opensearch-dashboards-plugin install "https://github.com/fbaligand/kibana-enhanced-table/releases/download/v1.13.3/enhanced-table-1.13.3_osd-2.7.0.zip"

# Install Bitergia Analytics plugins
RUN opensearch-dashboards-plugin install "https://github.com/evamillan/bitergia-analytics-plugin/releases/download/0.4.0/bitergia_analytics-0.4.0_2.7.0.zip"

# Remove plugins not supported on this release
RUN opensearch-dashboards-plugin remove reportsDashboards

#
# Default configuration
#

COPY opensearch_dashboards.yml config/