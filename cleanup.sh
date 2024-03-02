#! /bin/bash


moved=0


size_finish=0

#Array Cause this is easier
declare -A The_Grid
The_grid[images]=0
The_grid[documents]=0
The_grid[pdfs]=0
The_grid[executables]=0
The_grid[data]=0
The_grid[unknown]=0

declare -A Thine_files
Thine_files[images]=0
Thine_files[documents]=0
Thine_files[pdfs]=0
Thine_files[executables]=0
Thine_files[data]=0
Thine_files[unknown]=0


for dir in images documents pdfs executables data unknown; do
    if [ ! -d "$dir" ]; then
        echo "Directory '$dir' does not exist. Creating directory..."
        mkdir "$dir"
    else
        echo "Directory '$dir' already exists. Skipping creation."
    fi
done 

echo "Moving files into their respective directories..."

# now we find the files

for file in my_directory/*; do 


    if [ ! -d "$file" ]; then


        size=$(stat -c %s "file")


        ((size_finish += size))


        if [ -x "$file" ]; then

            mv "$file" executables/
            ((The_grid[executables]++)) 
            ((Thine_files[executables] += size)) 
        else
    ((moved++)) 


        case "$file" in 
            *.jpg|*.jpeg|*.png|*.gif)
                mv "$file" images/
                ((The_grid[images]++))
                ((Thine_files[images] += size))
                ;;


            *.txt|*.docx|*.doc|*.pages|*.key|*.pptx|*.ppt|*.odt|*.md)
                mv "$file" documents/
                ((The_grid[documents]++))
                ((Thine_files[documents] += size))
                ;;


            *pdf)
                mv "$file" pdfs/
                ((The_grid[pdfs]++))
                ((Thine_files[pdfs]+= size))
                ;;


            *.sh|*.exe)
                mv "$file" executables/
                ((The_grid[executables]++))
                ((Thine_files[executables]+= size))
                ;;


            *.csv|*.xlsx|*.json)
                mv "$file" data/
                ((The_grid[data]++))
                ((Thine_files[data] += size))
                ;;


            *)
                mv "$file" unknown/ 
                ((The_grid[unknown]++))
                ((Thine_files[unknown] += size))
                ;;
        esac
    fi
    fi



    
done

echo "File move complete. Total Files moved:    $moved"
echo "Total size of files moved:     $size_finish bytes"


average=$((size_finish / moved))
echo "Average file size for all files: $average bytes"

   
echo "** Breakdown per category **"

echo "**Images**"
echo "Total moved ${The_grid[images]}, total size ${Thine_files[images]}"
if [ "$moved" -ne 0 ]; then

    first_images=$((Thine_files[images] / The_grid[images]))
    echo "Average file size: $average_images bytes"
else
    echo "No files moved in the Images category."
fi


echo "**Documents**"
echo "Total moved: ${Thine_files[documents]}"
echo "Total size: ${Thine_files[documents]} bytes"
if [ "$moved" -ne 0 ]; then

    average_pdfs=$((Thine_files[pdfs] / The_grid[pdfs]))
    echo "Average file size: $average_pdfs bytes"
else
    echo "No files moved in the pdfs category."
fi

echo "**Executables**"
echo "Total moved: ${Thine_files[executables]}"
echo "Total size: ${Thine_files[executables]} bytes"
if [ "$moved" -ne 0 ]; then

    average_executables=$((Thine_files[executables] / The_grid[executables]))
    echo "Average file size: $average_executables bytes"
else
    echo "No files moved in the executables category."
fi

echo "**Data**"
echo "Total moved: ${Thine_files[data]}"
echo "Total size: ${Thine_files[data]} bytes"
if [ "$moved" -ne 0 ]; then

    average_data=$((Thine_files[data] / The_grid[data]))
    echo "Average file size: $average_data bytes"
else
    echo "No files moved in the data category."
fi

echo "**Unknown**"
echo "Total moved: ${Thine_files[unknown]}"
echo "Total size: ${Thine_files[unknown]} bytes"
if [ "$moved" -ne 0 ]; then

    average_unknown=$((Thine_files[unknown] / The_grid[unknown]))
    echo "Average file size: $average_unknown bytes"
else
    echo "No files moved in the unknown category."
    if  [ "$moved" -ne 0 ]; then

    average_documents=$((Thine_files[documents] / The_grid[documents]))
    echo "Average file size: $average_documents bytes"
else
    echo "No files moved in the Documents category."
fi

echo "**PDFs**"
echo "Total moved: ${Thine_files[pdfs]}"
echo "Total size: ${Thine_files[pdfs]} bytes"


fi