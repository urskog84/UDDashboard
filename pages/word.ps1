New-UDPage -Name "WordNik" -Icon wordpress -Content {
    New-UDInput @Colors -Title "WordNic" -SubmitText "Get a fancy word from the WordNik API" -Content {
        New-UDInputField -Type 'checkbox' -Name 'GIPHY' -Placeholder 'Get a Picture from GIPHY '  -DefaultValue $true
    } -Endpoint {
        param([bool]$GIPHY)
        write-host $GIPHY


        try {
            $word = Invoke-RestMethod -Uri "https://api.wordnik.com/v4/words.json/randomWord?hasDictionaryDef=true&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&api_key=$WordnikApiKey" 
        }
        catch {
            $word = "can not talk to the WordNic API"
        }

        if ($GIPHY) {
            $GIPHYObj = Invoke-RestMethod -Uri "https://api.giphy.com/v1/gifs/search?api_key=$GIPHYApiKey&q=$($Word.word)&limit=1&offset=0&rating=G&lang=en" -Method Get -ContentType 'application/json'
        }

        New-UDInputAction -Content @(
            New-UDCard -Title "$($Word.word)"
        
        )
  


    }
}