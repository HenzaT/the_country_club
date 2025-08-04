## (In Progress) The Country Club - facts about countries and travel tracker
This is a self-directed project.
I love travelling and learning geography facts, and so I wanted to create a space where the two come together. This is an ongoing project, and I plan to use it as an opportunity to practise some new technologies:
- TypeScript (in Rails)
- MySQL
- Integrating third-party APIs
- React (possible addition)

## Goals
For this app, I wanted to:
- Consolidate my skills using Ruby on Rails, TypeScript and CSS3/SCSS.
- Use third-party APIs
- Introduce and use more unfamiliar technologies, like MySQL and React.js (which I am currently learning). To facilitate using React and TypeScript in a Rails application, I switched from Webpacker to using Vite.

## Tech Stack
- Ruby on Rails
- Vite
- HTML5
- SCSS
- JavaScript
- TypeScript
- MySQL (originally)
- PostgreSQL (deployment)
- Git
- Github
- Postman (for API endpoint testing)

### APIs used 
- REST Countries API
- Unsplash API
- Mapbox API
- Open Exchange API (free tier)
- Anthropic Claude API 


## Login
You can log in using thse details:
username: 
```
tester@testing.com
```
password:
```
password
```

## Process
I started with: 
- a rough sketch of what I wanted the app to look like.
- the database schema.
- a trello board, to keep track of the features.
 
<img src="https://github.com/user-attachments/assets/8f8a0836-9f61-44f9-8902-d46254374641" width=50% height=50%><img src="https://github.com/user-attachments/assets/e4a9d07a-a979-4695-b110-bd6d859230c2" width=50% height=50%><img src="https://github.com/user-attachments/assets/dabdead3-e4c8-40de-86ad-e4e61599ddc6" width=35% height=35%>



Before beginning this project, I actually started building a separate frontend-only countries app using JavaScript, TailwindCSS and the REST Countries API a few months before this. This was a good way for me to practise using the REST Countries API, as well as an opportunity to practise using TailwindCSS. I learnt a lot about refactoring JavaScript to reduce repetition here, which helped me a lot when building my portfolio. Ultimately however, I decided that:
- I'd need to scale up this project and would need a backend.
- I would use SCSS instead of TailwindCSS, as I wanted to retain more control over styling and build fluency using CSS.

<img src="https://github.com/user-attachments/assets/1b75e23b-443f-499a-9a07-befa557baa40" width=60% height=60%><img src="https://github.com/user-attachments/assets/04ad539c-c7ce-4d6d-b12f-d46bda6afad9" width=50% height=50%>


The first thing I implemented was the Country model. Having the schema helped with this, as it minimised later additions and migrations (although I still added columns as I scaled the project). Thinking of the schema first also made me think about each data type; I learnt the importance of doing this step early in a previous project, when I went straight into making a model and got the data types wrong for certain columns. I tried to fix this through some messy migrations, and ultimately had to start the project from scratch. 

I then created a seed file to populate my database. The countries would be saved into the database, with no option for a user to add or delete a country. I sat down with the REST countries API and studied the format it was presented in. I could see that it was an array, with multiple nested hashes (objects) and arrays. Most of the columns were easy to access using standard Ruby syntax, although some of the nested values were harder to access initially. I also realised that some of the countries in the API did not have certain values that I needed. To account for this, I allowed for a possible 'None' value if the value needed was missing. 

Something I really wanted to use in this project was the Unsplash API. I wanted an easy way to show a high quality image for each individual country, that was also free to use. After registering my project with Unsplash, I utilised Postman to access and test the output of my requests (which was the top photo of specific country). The Unsplash API is very easy to use and the documentation is very clear. After ensuring I had attributed the photos correctly when displayed, I used the photos from Unsplash as my page banners for the region, continent and country pages. To improve performance with the API, I created a new CountryPhoto model and saved each photo into the database. I did this as the photos used for each country are not going to change (for example, the photo that is displayed for Japan will always be that specific photo). This saved me from having to make countless calls to the API. 

I also used the Open Exchange API to allow users to compare currency rates. As I'm using the free tier, the base currency is set to USD. Using my countries controller however, I did some maths to convert the base currency from USD to GBP. 
```
def currency_exchange_usd(country)
    currency_code = country.currency_code
    url = "https://openexchangerates.org/api/latest.json?app_id=#{ENV.fetch('OPEN_EXCHANGE_APP_ID')}"
    currency_json = URI.parse(url).read
    all_currencies = JSON.parse(currency_json)
    base_country_rate = all_currencies['rates']["#{currency_code}"] || 'Not Found'
    uk_rate = all_currencies['rates']['GBP']
    country_rate = base_country_rate / uk_rate
    @country_rate = country_rate.round(3)
  end
```

Another API I used was the Claude AI API from Anthropic. I'd come across this API during a Scrimba React course, and really enjoyed the way it was implemented and the ease of setting it up. I've also had experience with the OpenAI API in a previous project, but utlimately decided to go with Anthropic. I used the Claude Ruby gem, and then followed the documentation by setting up an AiAgent class, which allowed new instances of the Claude API to be created.
 
## Reflections
Before starting, I debated whether to build a project entirely with new technologies, like React.js, or to stick with familiar tools while introducing a few new ones. Drawing from the concept of the Zone of Proximal Development, which suggests people learn best when challenged just beyond their comfort zone, I chose the latter. This approach let me focus on learning technologies like MySQL without being overwhelmed, since the rest of the stack was familiar.
I initially used MySQL to explore working with different relational databases. However, when deploying to Heroku, I switched to PostgreSQL as it’s better supported on the platform. This experience helped me understand the importance of deployment considerations when choosing tools.

## Future Additions
- allowing the user to put in different values for the currency.
- 

