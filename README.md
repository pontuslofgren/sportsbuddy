# Sportsbuddy

## Table of Contents

1. [Background](notion://www.notion.so/Readme-70b278c8b5d041eb9292c192f3e2cb87#background)
2. [Development Details](notion://www.notion.so/Readme-70b278c8b5d041eb9292c192f3e2cb87#development-details)
3. [Installation](notion://www.notion.so/Readme-70b278c8b5d041eb9292c192f3e2cb87#installation)
4. [Usage](notion://www.notion.so/Readme-70b278c8b5d041eb9292c192f3e2cb87#usage)
5. [Contributors](notion://www.notion.so/Readme-70b278c8b5d041eb9292c192f3e2cb87#contributors)

## Background

Sportsbuddy is an application developed as the final project for Le Wagon’s web development bootcamp (Batch #1463, Lisbon). It's a platform where users can create and join workout events, fostering a community of fitness enthusiasts.

## Development Details

- **Framework:** MVC architecture utilizing Ruby on Rails.
- **Image Handling:** Integration with Cloudinary for efficient image uploads.
- **Search Functionality:**  Multi-column search with hierarchy, powered by PGSearch.
- **User Authentication:** Secure user management with Devise.
- **Payment Processing:** Robust payment system using Stripe, including webhook support.
- **Real-time Communication:** Live chat feature implemented with ActionCable and Redis.
- **Mobile Responsiveness:** Adaptive design using Bootstrap for a seamless mobile experience.
- **Mapping:** Interactive maps powered by Mapbox for event location visualization, address autocomplete and geotagging.
- **Deployment:** Application hosted on Heroku for reliable access.

## Installation

Ensure Ruby and Rails are installed on your system. Follow these steps to set up the project:

1. Clone the repository:
    
    ```bash
    git clone <repository-url>
    
    ```
    
2. Navigate to the project directory:
    
    ```bash
    cd sportsbuddy
    
    ```
    
3. Install dependencies:
    
    ```bash
    bundle install
    
    ```
    
4. Set up environment variables:
    - Create a `.env` file in the root directory.
    - Add configuration for Cloudinary, Mapbox, and Stripe:
        
        ```
        CLOUDINARY_URL=<your_cloudinary_url>
        MAPBOX_API_KEY=<your_mapbox_api_key>
        STRIPE_API_KEY=<your_stripe_api_key>
        STRIPE_SECRET_KEY=<your_stripe_secret_key>
        STRIPE_WEBHOOK_SECRET_KEY=<your_stripe_webhook_secret_key>
        ```
        

## Usage

Sign upp to the application. Click on your avatar and select “Create workout” from the dropdown menu. Navigate to ‘Workouts’, select a workout and select ‘Join workout’. You will be redirected to Stripe Checkout (use card number 4242 4242 4242 4242). On the booking confirmation page, click “Open chat” to chat with the buddies and organiser. 

## Contributors

- Pontus Löfgren
- Wilmar Putz
- Hugo Duffoux
