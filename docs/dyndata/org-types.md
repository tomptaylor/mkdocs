<div id="api-table">
  Loading...
</div>

### Choose an Option:

<select id="dropdown">
  <option value="1">One</option>
  <option value="2">Two</option>
  <option value="3">Three</option>
</select>

<p>Selected: <span id="output">None</span></p>

<script>
  document.getElementById("dropdown").addEventListener("change", function() {
    document.getElementById("output").textContent = this.value;
  });
</script>

<script>
function parseXML(xmlString) {
    const result = [];
    const resultRegex = /<result>(.*?)<\/result>/gs; // Match each result block

    let match;
    while ((match = resultRegex.exec(xmlString)) !== null) {
        const bindings = {};
        const bindingRegex = /<binding name='(.*?)'>\s*(<uri>(.*?)<\/uri>|<literal.*?>(.*?)<\/literal>)\s*<\/binding>/gs;

        let bindingMatch;
        while ((bindingMatch = bindingRegex.exec(match[1])) !== null) {
            const name = bindingMatch[1];
            const uri = bindingMatch[3];
            const literal = bindingMatch[4];
            bindings[name] = uri || literal; // Prioritize URI, fallback to literal
        }

        result.push(bindings);
    }

    return result;
}

    // const xml = `<root><name>John</name><age>30</age></root>`;
    // const json = xmlToJson(xml);
    // console.log(json); 
  var myurl = "https://query.wikidata.org/sparql?query=SELECT%20DISTINCT%20%3Findustry%20%3FindustryLabel%20WHERE%20%7B%0A%20%20%3Fcompany%20wdt%3AP452%20%3Findustry%20.%20%23%20Find%20industries%20used%20in%20company%20classification%0A%20%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22en%22.%20%7D%0A%7D%0ALIMIT%2050"
  fetch(myurl)  // Replace with your API
    .then(response => parseXML(response.text())  )
    .then(data => {
        let table = "<table><tr><th>Key</th><th>Value</th></tr>";
        Object.values(data).forEach(key => {
            table += `<tr><td>${key}</td><td>${data[key]}</td></tr>`;
        });
        table += "</table>";
        document.getElementById("api-table").innerHTML = table;
    })
    .catch(error => document.getElementById("api-table").innerHTML = "Error loading data");
</script>
