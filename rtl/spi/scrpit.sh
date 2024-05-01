

files='ls *.sv'
for file in $files
do
	echo "processing file"
	mv -- "$file" "${file%.sv}.vhd"
done
