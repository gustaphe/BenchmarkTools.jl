@recipe function f(::Type{Trial}, t::Trial)
    seriestype --> :boxplot
    legend --> false
    yguide --> "t / ns"
    xticks --> false
    t.times
end

@recipe function f(g::BenchmarkGroup)
    legend --> false
    yguide --> "t / ns"
    for k in g.tags
        @series begin
            label --> string(k)
            xticks --> true
            [string(k)], g[k]
        end
    end
end
