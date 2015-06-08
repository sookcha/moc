module LinksHelper
  def isPrivate(link)
    if link.private == true
      true
    else
      false
    end
  end
end
