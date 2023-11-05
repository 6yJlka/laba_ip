# frozen_string_literal: true

require 'net/http'
require 'nokogiri'

# Класс контроллера-посредника
class NegotiatorController < ApplicationController
  BASE_API_URL           = 'http://localhost:3000/sequence/view'
  XSLT_BROWSER_TRANSFORM = '/browser_transform.xslt'
  XSLT_SERVER_TRANSFORM  = "#{Rails.root}/public/server_transform.xslt"

  def input
  end

  def view
    responce = make_query BASE_API_URL
    respond_to do |format|
      format.html do
        @output = xslt_transform(responce).to_html
        render 'view'
      end
      format.xml { render xml: insert_browser_xslt(responce).to_xml }
      format.rss { render xml: insert_browser_xslt(responce).to_xml }
    end
  end

  def rawview
  if @input.present?
    uri = URI(BASE_API_URL + ".xml?values=#{@input}")
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      render xml: response.body
    else
      render plain: 'Error while fetching data from API', status: :internal_server_error
    end
  else
    render xml: '<output><error>Вы ничего не ввели</error></output>'
  end
end

  private

  def make_query(server_url)
    query_str = "#{server_url}.xml"
    query_str << "?values=#{@input}" if (@input = params[:values]&.split(' ')&.join('+'))
    HTTP.get(query_str).body
  end

  def xslt_transform(data, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  # Чтобы преобразование XSLT на клиенте работало, надо вставить ссылку на XSLT.
  # Делается это с помощью nokogiri через ProcessingInstruction (потому что ссылка
  # на XSLT называется в XML processing instruction).
  def insert_browser_xslt(data, transform: XSLT_BROWSER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    # Возвращаем doc, так как предыдущая операция возвращает не XML-документ.
    doc
  end
end
