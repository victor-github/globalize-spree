Deface::Override.new(:virtual_path  => "spree/admin/taxons/_form",
         :replace => "[data-hook='admin_taxon_form']",
         :partial => "spree/admin/taxon/form",
         :name    => "taxon_globalize_form")

