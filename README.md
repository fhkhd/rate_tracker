# rate_tracker

A Flutter app for viewing currency-related news and calculating paired rates.

## Features

- **Real-Time News**: Fetches the latest articles from News API.
- **Currency Exchange Rates**: Retrieves current exchange rates for various currencies and allows users to easily calculate conversions.
- **Local Symbols**: Stores rate symbols in a local JSON file for quick access.
- **GitHub Actions Workflow**: Automates the APK build and allows downloading the latest APK from latest successful build while keeping API keys secure.

## Screenshots

![Screenshot 2024-10-28 171824](https://github.com/user-attachments/assets/5f043f77-4adc-4aca-8f73-fc70d7aae226)

![Screenshot 2024-10-28 171939](https://github.com/user-attachments/assets/39c907c0-e44a-4a3e-a661-6c99b670b99e)

### Prerequisites

- **API Keys** from [News API](https://newsapi.org/) and [Exchange Rate API](https://www.exchangerate-api.com/) (if needed)

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/fhkhd/rate_tracker.git
   cd rate_tracker

2. **Install Dependencies**:
   ```bash
   flutter pub get

3. **Set Up API Keys**:
   Obtain your API keys from News API and Exchange Rate API.

   Create a JSON file in assets/secret/ directory named secret.json and add your keys as shown below:
   ```bash
   {
     "rate_api_key": "YOUR_RATE_API_KEY",
     "news_api_key": "YOUR_NEWS_API_KEY"
   }
4. **Run the App**:
   ```bash
   flutter run

#### Currency Calculation
The app not only retrieves exchange rates but also provides a simple interface to calculate currency conversions. Users can easily enter amounts and see conversions in real time, making it a handy tool for tracking and comparing currencies.

##### GitHub Actions Workflow
The project includes a GitHub Actions workflow that builds an APK for each push to the master branch. Secrets are stored securely and injected into the build process.
Workflow File:
    
    name: Build APK

    on:
      push:
        branches:
          - master

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
          - name: Checkout code
            uses: actions/checkout@v2

          - name: Set up JDK 17
            uses: actions/setup-java@v1
            with:
              java-version: '17'

          - name: Set up Flutter
            uses: subosito/flutter-action@v1
            with:
              channel: 'stable'
              flutter-version: '3.24.1'

          - name: Store secrets in json file
            run: |
              mkdir -p assets/secret
              echo "{\"rate_api_key\": \"${{ secrets.RATE_API_KEY }}\", \"news_api_key\": \"${{ secrets.NEWS_API_KEY }}\"}" > assets/secret/secret.json

          - name: Install dependencies
            run: flutter pub get

          - name: Build APK
            run: flutter build apk --release

          - name: Verify APK contents
            run: unzip -l build/app/outputs/flutter-apk/app-release.apk | grep 'assets/secret/secret.json'

          - name: Upload APK
            uses: actions/upload-artifact@v3
            with:
              name: app-release.apk
              path: build/app/outputs/flutter-apk/app-release.apk


###### Downloading the Latest APK
The latest APK file from a successful build is available as an artifact. You can download it directly from the GitHub Actions workflow on the GitHub repository. This makes it easy for users to test the app without needing to set up the project locally.




