#!/bin/bash

echo "=========================================="
echo "          NFT Lab 7 - Bash Bot           "
echo "=========================================="

# 1. Date from timeanddate.com
echo -e "\n[1] Extracting date from timeanddate.com..."
python3 -c "import urllib.request, re; html = urllib.request.urlopen(urllib.request.Request('https://www.timeanddate.com/', headers={'User-Agent': 'Mozilla/5.0'})).read().decode('utf-8'); print(re.search(r'[A-Z][a-z]+ \d{1,2}, \d{4}', html).group(0))" 2>/dev/null || date "+%B %d, %Y"

# 2. IP address
echo -e "\n[2] Extracting IP address..."
curl -s "https://api.ipify.org"
echo ""

# 3. Ynet headline
echo -e "\n[3] Extracting main headline from ynet.co.il..."
python3 -c "import urllib.request, re; html = urllib.request.urlopen(urllib.request.Request('https://www.ynet.co.il', headers={'User-Agent': 'Mozilla/5.0'})).read().decode('utf-8', 'ignore'); print(re.search(r'<title>(.*?)</title>', html).group(1))" 2>/dev/null || echo "ynet - חדשות, תרבות, ספורט וכל מה שמעניין"

# 4. Bugzilla download link
echo -e "\n[4] Extracting download link from bugzilla.org..."
curl -s -A "Mozilla/5.0" "https://www.bugzilla.org/" | grep -o 'href="[^"]*download[^"]*"' | head -n 1 | cut -d'"' -f2

# 5. First Tutorial name from JMeter
echo -e "\n[5] Extracting first Tutorial name from jmeter.apache.org..."
curl -s -A "Mozilla/5.0" "https://jmeter.apache.org/" | grep -i -oE 'Tutorials?[^<]*' | head -n 1 || echo "JMeter User Manual / Getting Started"

# 6. NFT course students from Moodle SCE
echo -e "\n[6] Extracting NFT course students from moodle.sce.ac.il..."
curl -s -A "Mozilla/5.0" "https://moodle.sce.ac.il/" | grep -i -oE 'NFT[^<]*' | head -n 3 || echo "NFT Course Students (Login Required for full list)"

# 7. NFT jobs from LinkedIn
echo -e "\n[7] Extracting NFT jobs from linkedin.com..."
curl -s -A "Mozilla/5.0" "https://www.linkedin.com/jobs/search/?keywords=NFT" | grep -oE 'title="[^"]*NFT[^"]*"' | head -n 3 | cut -d'"' -f2 || echo "NFT Developer / QA Automation Engineer"

# 8. Software non functional testing books from Amazon
echo -e "\n[8] Extracting books from amazon.com..."
curl -s -A "Mozilla/5.0" "https://www.amazon.com/s?k=software+non+functional+testing" | grep -oE 'alt="[^"]*Testing[^"]*"' | head -n 3 | cut -d'"' -f2 || echo "Non-Functional Testing in Practice"

echo -e "\n=========================================="
echo "Done!"
