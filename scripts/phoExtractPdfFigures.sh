


function install_sbt_if_needed() {
	# Install SDKMan and Scala's sbt:
	cd ~/repos/
	sdk install java $(sdk list java | grep -o "\b8\.[0-9]*\.[0-9]*\-tem" | head -1)
	sdk install sbt
}

function extract_pdf_figures() {
	pdf_path="$1"
	sbt_command="sbt 'runMain org.allenai.pdffigures2.FigureExtractorVisualizationCli \"$pdf_path\"'"
	eval $sbt_command
}

# extract_figures "/media/MAX/cloud/Dropbox_Personal/Active/Kamran Diba Lab/Personal Lab Meeting Summaries/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation.pdf"


function extract_pdf_figures_and_data() {
	# sbt "runMain org.allenai.pdffigures2.FigureExtractorBatchCli /path/to/pdf_directory/ -s stat_file.json -m /figure/image/output/prefix -d /figure/data/output/prefix"
	pdf_path="$1"
	parent_dir=$(dirname "$pdf_path")
	output_dir="$parent_dir/extracted_figures"
	output_data_dir="$parent_dir/extracted_data"
	mkdir -p "$output_dir"
	mkdir -p "$output_data_dir"
	sbt_command="sbt 'runMain org.allenai.pdffigures2.FigureExtractorBatchCli \"$parent_dir\" -s \"$output_data_dir/stat_file.json\" -m \"$output_dir/figure_image\" -d \"$output_data_dir/figure_data\"'"
	eval $sbt_command
}


# extract_pdf_figures_and_data "/path/to/pdf_directory/example.pdf"
extract_pdf_figures_and_data "/media/MAX/cloud/Dropbox_Personal/Active/Kamran Diba Lab/Personal Lab Meeting Summaries/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation.pdf"


# sbt 'runMain org.allenai.pdffigures2.FigureExtractorVisualizationCli "/media/MAX/cloud/Dropbox_Personal/Active/Kamran Diba Lab/Personal Lab Meeting Summaries/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation.pdf"'
sbt 'runMain org.allenai.pdffigures2.FigureExtractorBatchCli "/media/MAX/cloud/Dropbox_Personal/Active/Kamran Diba Lab/Personal Lab Meeting Summaries/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation.pdf" -s stat_file.json -m /media/MAX/cloud/Dropbox_Personal/Active/Kamran Diba Lab/Personal Lab Meeting Summaries/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation/extracted_figures -d "/media/MAX/cloud/Dropbox_Personal/Active/Kamran Diba Lab/Personal Lab Meeting Summaries/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation/extracted_data"'



sbt 'runMain org.allenai.pdffigures2.FigureExtractorBatchCli "/media/MAX/cloud/Dropbox_Personal/Active/Kamran Diba Lab/Personal Lab Meeting Summaries/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation.pdf" -s stat_file.json'
"/media/MAX/cloud/Dropbox_Personal/Active/Kamran Diba Lab/Personal Lab Meeting Summaries/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation/

"/media/MAX/cloud/Dropbox_Personal/Active/Kamran Diba Lab/Personal Lab Meeting Summaries/2022 Yu Davachi - Repetition accelerates neural markers of memory consolidation/extracted_data"