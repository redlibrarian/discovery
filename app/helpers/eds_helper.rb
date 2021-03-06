module EdsHelper

  def populate_eds
    if params["q"] then # refactor this
      eds = get_eds_results
      if eds
        @eds_count = eds["count"]
        eds.delete("count")
        @eds = eds
      end
    else
      @eds_count = 0
      @eds = "Empty Search"
    end
  end

  def get_eds_results
    documents = {}
    session[:current_url] = request.original_url
    eds_connect
    params["q"] = params["q"].downcase.gsub("l'", "").gsub("d'", "")
    params["includefacets"] = "y"
    #params["eds_action"] = "addfacetfilter(SourceType:Academic Journals)"
      params["searchmode"]="all"
      params["view"]="brief"
      params["pagenumber"]=1
      params["highlight"]="y"
      params["resultsperpage"] = 100
    if has_search_parameters? then
      clean_params = deep_clean(params)
      params = clean_params
      options = generate_api_query(params)
    end

    search(options)

    # refactor
    if session[:results] and session[:results]['SearchResult'] and session[:results]['SearchResult']['Statistics'] and session[:results]['SearchResult']['Statistics']['TotalHits']
      documents["count"] = session[:results]['SearchResult']['Statistics']['TotalHits']
      @complete_count += documents["count"]
    end

    if session[:results] and session[:results]['SearchResult'] and session[:results]['SearchResult'] and session[:results]['SearchResult']['Data'] and session[:results]['SearchResult']['Data']['Records'] then
      results = session[:results]['SearchResult']['Data']['Records']
      results.each do |result|
        metadata = {}
        if has_restricted_access?(result) then
          metadata[:title] = "This result cannot be shown to guests."
        else
          metadata[:title] = show_title(result)
        end
        metadata[:author] = show_authors(result) if has_authors?(result)
        metadata[:url] = result["PLink"]
        metadata[:format] = show_pubtype(result) if has_pubtype?(result)
        metadata[:source] = show_titlesource(result) if has_titlesource?(result)
        documents[result["ResultId"]] = metadata
      end
      documents
    end
  end
end
