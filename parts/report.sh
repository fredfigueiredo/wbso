# Create the WBSO week report

# Required vars
reports_folder='reports'
today=$(gdate +%Y-%m-%d)
current_year_week=$(gdate +%Y-%V)

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
    day_week=$(gdate +%a)

    # Get gdate for this week Mon, Tue, ...
    case $day_week in
      Mon)
        mon=$(gdate +%F)
        tue=$(gdate -d '+1 day' +%F)
        wed=$(gdate -d '+2 day' +%F)
        thu=$(gdate -d '+3 day' +%F)
        fri=$(gdate -d '+4 day' +%F)
        ;;
      Tue)
        mon=$(gdate -d '-1 day' +%F)
        tue=$(gdate +%F)
        wed=$(gdate -d '+1 day' +%F)
        thu=$(gdate -d '+2 day' +%F)
        fri=$(gdate -d '+3 day' +%F)
        ;;
      Wed)
        mon=$(gdate -d '-2 day' +%F)
        tue=$(gdate -d '-1 day' +%F)
        wed=$(gdate +%F)
        thu=$(gdate -d '+1 day' +%F)
        fri=$(gdate -d '+2 day' +%F)
        ;;
      Thu)
        mon=$(gdate -d '-3 day' +%F)
        tue=$(gdate -d '-2 day' +%F)
        wed=$(gdate -d '-1 day' +%F)
        thu=$(gdate +%F)
        fri=$(gdate -d '+1 day' +%F)
      ;;
      Fri)
        mon=$(gdate -d '-4 day' +%F)
        tue=$(gdate -d '-3 day' +%F)
        wed=$(gdate -d '-2 day' +%F)
        thu=$(gdate -d '-1 day' +%F)
        fri=$(gdate +%F)
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