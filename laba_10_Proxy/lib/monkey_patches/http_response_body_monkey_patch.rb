module HTTPResponseBodyMonkeyPatch
    def to_ary
      to_a
    end
  end

  HTTP::Response::Body.prepend(HTTPResponseBodyMonkeyPatch)
  
