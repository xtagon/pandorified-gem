require 'spec_helper'

RSpec.describe Pandorified do
  describe "#talk!" do
    let(:input) { "Are you a robot?" }
    let(:botid) { "np218q9s7r346nqo" }
    let(:custid) { nil }

    let(:request_body) do
      {
        "botid" => botid,
        "custid" => nil,
        "input" => input
      }
    end

    context "when successful" do
      subject { described_class.talk!(input, botid, custid) }

      let(:that) { "Of course not!" }

      let(:response_body) do
        <<~XML
        <result status="0" botid="#{botid}" custid="fec7cfc40e5b751a"><input>#{input}</input><that>#{that}</that></result>"
        XML
      end

      let(:response_headers) do
        {content_type: "text/xml"}
      end

      before :each do
        stub_request(:post, "https://www.pandorabots.com/pandora/talk-xml").
          with(body: request_body).
          to_return(status: 200, body: response_body, headers: response_headers)
      end

      it { is_expected.to eq(that) }
    end

    context "when unsuccessful" do
      pending { is_expected.to raise_error(described_class::PandorabotsError) }
    end
  end
end
