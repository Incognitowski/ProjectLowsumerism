<h1>Project Lowsumerism</h1>
<h3>Project developed as part of a research initiation program.</h3>

Lowsumerism, the art of consuming consciously. This project involves creating a marketplace for the students and collaborators of Centro Universitário de União da Vitória (UNIUV) to trade products and services, making use of a coin exclusive to the platform.

<h3>Set up instructions</h3>
<ol>
  <li>Clone this repository in any folder in your system.</li>
  <li>Fire up you terminal of choice (<a href="http://cmder.net/">Ever heard of Cmder?</a>)</li>
  <li>cd into the lowsumerism folder</li>
  <li>run <code>cp .env.example .env</code></li>
  <li>Set up your <code>.env</code> file</li>
  <li>Run <code>npm install</code></li>
  <li>Run <code>npm run dev</code></li>
  <li>Run <code>composer update</code></li>
</ol>

<h3>Database Rules:</h3>
<ol>
  <li>
    Status and Types should be hardcoded on the system's setup process.
    Ex.: Trades Status must be the same on either production and development, so that the business logic isn't breakable. Their primary keys shouldn't be mutable. 
  </li>
  <br>
  <li>  
    For the tables containing the following columns, the Laravel 5.7 documentation must be seeked for further understanding:
  <ul>
    <li>created_at: datetime</li>
    <li>updated_at: datetime</li>
    <li>softdelete: tinyint(0/1), thus, true or false.</li>
  </ul>
  <br>
  <li>
    Both Users and Password_recovery tables should respect laravels structure to ensure the proper function of the authentication system.
    You might want to check Laravel's documentation in regards to the proper modification of columns names and authentication parameters.
  </li>
  <br>
  <li>
    The column offer_persist in the offers table reffers to products or services that aren't "single trade", for instance if you have an old book, you'll be selling the single copy owned by you. On the other hand, if you offer an hour-based service or you're able to sell the product multiple times, that means that the product persists, thus making it a boolean type field. 
  </li>
</ol>

<h4>More rules should be added as the development and testing of this database continues.</h4>

![This should be the database image...](https://raw.githubusercontent.com/Incognitowski/ProjectLowsumerism/master/DatabaseModel.png)

