require 'graphviz'

module View
  # Topology controller's GUI (graphviz).
  class Graphviz
    def initialize(output = 'topology.png')
      @output = output
    end

    # rubocop:disable AbcSize
    def update(_event, _changed, topology)
      GraphViz.new(:G, use: 'neato', overlap: false, splines: true) do |gviz|
        nodes = topology.switches.each_with_object({}) do |each, tmp|
          tmp[each] = gviz.add_nodes(each.to_hex, shape: 'box')
        end

        topology.hosts.each do |each|
          gviz.add_nodes(each[1].to_s, shape: 'ellipse')
          gviz.add_edges nodes[each[2]], each[1].to_s, arrowhead: "none", arrowtail: "none"
        end

        topology.links.each do |each|
          next unless nodes[each.dpid_a] && nodes[each.dpid_b]
          gviz.add_edges nodes[each.dpid_a], nodes[each.dpid_b], arrowhead: "none", arrowtail: "none"
        end
        gviz.output png: @output
      end
    end
    # rubocop:enable AbcSize

    def to_s
      "Graphviz mode, output = #{@output}"
    end
  end
end
