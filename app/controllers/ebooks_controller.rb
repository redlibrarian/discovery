# -*- encoding : utf-8 -*-
#
class EbooksController < CatalogController
  include Blacklight::Marc::Catalog
  include Blacklight::Catalog

  self.solr_search_params_logic << :show_only

  def show_only solr_parameters, user_parameters
    solr_parameters[:fq] ||= []
    solr_parameters[:fq] << 'owning_library_tesim:"UAINTERNET"'
    solr_parameters[:fq] << 'format:"Book"'
  end

  def index
    super
    @collection_name = "electronic books"
  end

end