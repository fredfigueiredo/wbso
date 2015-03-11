# Create the WBSO week report

# Required vars
reports_folder='reports'
today=$(date +%Y-%m-%d)
current_year_week=$(date +%Y-%V)

# This week file
wbso_week_file="$current_year_week.txt"
wbso_week_folder="$reports_folder/$current_year_week"
wbso_week_file_path="$wbso_week_folder/$wbso_week_file"

# This week result file
result_week_file="result-$wbso_week_file"
result_week_file_path="$wbso_week_folder/$result_week_file"

# Function to create current week report
function create_report() {

    # Get day of the week (Mon, Tue, ...)
    day_week=$(date +%a)

    # Get date for this week Mon, Tue, ...
    case $day_week in
      Mon)
        mon=$(date +%F)
        tue=$(date -v+1d +%F)
        wed=$(date -v+2d +%F)
        thu=$(date -v+3d +%F)
        fri=$(date -v+4d +%F)
        ;;
      Tue)
        mon=$(date -v-1d +%F)
        tue=$(date +%F)
        wed=$(date -v+1d +%F)
        thu=$(date -v+2d +%F)
        fri=$(date -v+3d +%F)
        ;;
      Wed)
        mon=$(date -v-2d +%F)
        tue=$(date -v-1d +%F)
        wed=$(date +%F)
        thu=$(date -v+1d +%F)
        fri=$(date -v+2d +%F)
        ;;
      Thu)
        mon=$(date -v-3d +%F)
        tue=$(date -v-2d +%F)
        wed=$(date -v-1d +%F)
        thu=$(date +%F)
        fri=$(date -v+2d +%F)
      ;;
      Fri)
        mon=$(date -v-4d +%F)
        tue=$(date -v-3d +%F)
        wed=$(date -v-2d +%F)
        thu=$(date -v-1d +%F)
        fri=$(date +%F)
        ;;
    esac

    # Create WSBO report file based on day template
    # TODO Change when we had more templates or support for variations (e.g. sick days)
    daily_report=$(sed '7q;d' parts/templates/day.txt)

    echo '"date","type","desc","story","duration"' > $wbso_week_file_path
    echo "$mon,$daily_report" >> $wbso_week_file_path
    echo "$tue,$daily_report" >> $wbso_week_file_path
    echo "$wed,$daily_report" >> $wbso_week_file_path
    echo "$thu,$daily_report" >> $wbso_week_file_path
    echo "$fri,$daily_report" >> $wbso_week_file_path

    echo -e '\nThis week Report created successfully.'

}

# Create reports folder if it does not exist
[ ! -d $reports_folder ] && mkdir $reports_folder
# Create week report folder if it does not exist
[ ! -d $wbso_week_folder ] && mkdir -p $wbso_week_folder

# Create week report if it does not exist
if [ ! -f $wbso_week_file_path ]; then
    create_report
else
    echo -e '\nThis week Report file already exists.'
fi