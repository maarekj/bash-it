cite about-plugin
about-plugin 'jma tools'

purgeh()
{
    file=$(mktemp)
    cat -n ~/.bash_history | sort -k2 | uniq -f1 | sort -n -k1,1 | cut -f2 > ${file}
    cp ${file} .bash_history
}

lorem()
{
    echo 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Morbi ut orci ligula. Cum sociis natoque penatibus et magnis dis
parturient montes, nascetur ridiculus mus. Praesent dapibus, orci in
vulputate ultrices, mauris arcu sagittis arcu, et tincidunt mi lacus
eu nisi. Vivamus dictum mauris eget nulla elementum scelerisque. Nulla
ligula augue, tempor sit amet gravida ac, volutpat sed diam. Ut vel
volutpat enim. In pulvinar facilisis condimentum. Integer pulvinar
convallis risus, eu cursus turpis ultricies et. Nulla at scelerisque
neque. Aliquam posuere facilisis sapien, vitae venenatis enim scelerisque in.
Integer suscipit cursus tempor. Pellentesque ut adipiscing magna.
Donec pharetra, metus iaculis lobortis sagittis, nulla nunc sagittis
arcu, quis ultrices lectus orci ut ante. Aliquam mattis interdum porttitor.'

}

rmtemp()
{
    rm -fv *~
    rm -fv \#*
}

rmdouble()
{
	if [ $# -gt 0 ]; then local FILES="$1"; else local FILES='*'; fi

	local sum=""
	local oldsum=""
	md5sum $FILES > /tmp/md5files.txt && sort -n /tmp/md5files.txt | while read l
	do
		sum=$(echo $l | cut -d ' '  -f 1)
		if [ "X$sum" = "X$oldsum" ]
		then
			rm -fv "$(echo "$l" | cut -c 35-)"
		fi

		oldsum="$sum"
	done
}

nmline()
{
	local n=$1
	local m=$2
	local f=$3
	local str="NR==$n,NR==$m{print \$0}"
	awk "$str" $f
}
