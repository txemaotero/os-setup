function vmd_render
    echo -e "display depthcue off\naxes location off\nrender POV3 vmdscene.pov\npovray +W720 +H720 -Ivmdscene.pov -O$argv[2].tga +D +X +UA +FT\nquit\n" | vmd -e $argv[1] -size 720 720
end
