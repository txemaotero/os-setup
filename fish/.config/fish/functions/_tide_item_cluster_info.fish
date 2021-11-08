function _tide_item_cluster_info

    set -l lines (sinfo -hN -p sun,sunGPU)
    set -l nidle (echo $lines | grep "idle" | wc -l)
    set -l nalloc (echo $lines | grep "alloc" | wc -l)
    set -l nmix (echo $lines | grep "mix" | wc -l)
    set -l ndown (echo $lines | grep "down" | wc -l)
    set -l ndrain (echo $lines | grep "drain" | wc -l)
    set ndown (math $ndown + $ndrain )
    set -l SLURM_STATUS_ICON "\uf111"


    set_color green
    echo -n "$nidle "
    set_color blue
    echo -n "$nalloc "
    set_color yellow
    echo -n "$nmix "
    set_color red
    echo -n "$ndown "

end
