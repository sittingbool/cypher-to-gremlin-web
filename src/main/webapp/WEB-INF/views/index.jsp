<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        #cypher-form {
            display:block;
            text-align:center;
            padding: 10px 15px;
        }

        textarea {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            width: 100%;
            height: 200px;
            padding: 8px;
            box-shadow: inset 0 0 5px black;
        }

        input[type=submit]{
            background-color: #2980b9;
            border: 1px solid #d1d1d1;
            padding:10px;
            border-radius:5px;
            width:250px;
            color:#fff;
            margin-top: 20px;
        }

        #result-view {
            margin: 10px 15px 80px 15px;
        }
    </style>
</head>
<body>
    <h2>Translate Cypher (Neo4j / OpenCypher) to Azure CosmosDB Gremlin</h2>

    <div id="translator">
        <h5>Write your Cypher code here:</h5>
        <form id="cypher-form">
            <textarea name="query"></textarea>
            <input type="submit" value="Translate to Gremlin">
        </form>
    </div>

    <div id="result-view">
        <span id="result-text">
        </span>
    </div>

    <div id="footer">
        <span>Powered by <a href="https://cowabo.com" target="_blank">Cowabo (TM)</a></span>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            var form = $( "#cypher-form" );
            var resultText = $("#result-text");
            form.submit(function( event ) {
                resultText.html('Translating ...');
                event.preventDefault();

                var url = "/cypher-to-gremlin";
                var posting = $.post( url, form.serialize() );

                posting.done(function( data ) {
                    console.log(data);
                    resultText.empty().append( data.result || 'No result' );
                }).fail(function(data) {
                    resultText.empty().append( '!! Error translating this !!! Maybe no correct Cypher?' ).append('<br />Response Text:').append(data.responseText);
                });
            });
        });
    </script>
</body>
</html>