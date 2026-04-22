# frozen_string_literal: true

require 'spec_helper'

describe Pandorified do
  describe '.talk' do
    let(:input) { 'Are you a robot?' }
    let(:botid) { 'np218q9s7r346nqo' }
    let(:custid) { nil }

    let(:request_body) do
      {
        'botid' => botid,
        'custid' => nil,
        'input' => input
      }
    end

    context 'when successful' do
      subject(:result) { described_class.talk(input, botid, custid) }

      let(:that) { 'Of course not!' }
      let(:session_custid) { 'fec7cfc40e5b751a' }

      let(:response_body) do
        <<~XML
          <result status="0" botid="#{botid}" custid="#{session_custid}">
            <input>#{input}</input>
            <that>#{that}</that>
          </result>
        XML
      end

      let(:response_headers) do
        { content_type: 'text/xml' }
      end

      before :each do
        stub_request(:post, 'https://www.pandorabots.com/pandora/talk-xml')
          .with(body: request_body)
          .to_return(
            status: 200,
            body: response_body,
            headers: response_headers
          )
      end

      it 'returns the parsed successful response' do
        expect(result).to be_successful
        expect(result.error?).to be(false)
        expect(result.status).to eq(0)
        expect(result.botid).to eq(botid)
        expect(result.custid).to eq(session_custid)
        expect(result.input).to eq(input)
        expect(result.that).to eq(that)
        expect(result.message).to be_nil
        expect(result.to_s).to eq(that)
      end
    end

    context 'when unsuccessful' do
      subject(:result) { described_class.talk(input, botid, custid) }

      let(:response_body) do
        <<~XML
          <result status="1" botid="#{botid}" custid="fec7cfc40e5b751a">
            <input>#{input}</input>
            <message>Something went wrong!</message>
          </result>
        XML
      end

      let(:response_headers) do
        { content_type: 'text/xml' }
      end

      before :each do
        stub_request(:post, 'https://www.pandorabots.com/pandora/talk-xml')
          .with(body: request_body)
          .to_return(
            status: 200,
            body: response_body,
            headers: response_headers
          )
      end

      it 'returns the parsed error response' do
        expect(result.error?).to be(true)
        expect(result).not_to be_successful
        expect(result.status).to eq(1)
        expect(result.botid).to eq(botid)
        expect(result.custid).to eq('fec7cfc40e5b751a')
        expect(result.input).to eq(input)
        expect(result.message).to eq('Something went wrong!')
      end
    end
  end

  describe '.talk!' do
    let(:input) { 'Are you a robot?' }
    let(:botid) { 'np218q9s7r346nqo' }
    let(:custid) { nil }

    let(:request_body) do
      {
        'botid' => botid,
        'custid' => nil,
        'input' => input
      }
    end

    context 'when successful' do
      subject { described_class.talk!(input, botid, custid) }

      let(:that) { 'Of course not!' }

      let(:response_body) do
        <<~XML
          <result status="0" botid="#{botid}" custid="fec7cfc40e5b751a">
            <input>#{input}</input>
            <that>#{that}</that>
          </result>
        XML
      end

      let(:response_headers) do
        { content_type: 'text/xml' }
      end

      before :each do
        stub_request(:post, 'https://www.pandorabots.com/pandora/talk-xml')
          .with(body: request_body)
          .to_return(
            status: 200,
            body: response_body,
            headers: response_headers
          )
      end

      it { is_expected.to eq(that) }
    end

    context 'when unsuccessful' do
      subject { described_class.talk!(input, botid, custid) }

      let(:response_body) do
        <<~XML
          <result status="1" botid="#{botid}" custid="fec7cfc40e5b751a">
            <input>#{input}</input>
            <message>Something went wrong!</message>
          </result>
        XML
      end

      let(:response_headers) do
        { content_type: 'text/xml' }
      end

      before :each do
        stub_request(:post, 'https://www.pandorabots.com/pandora/talk-xml')
          .with(body: request_body)
          .to_return(
            status: 200,
            body: response_body,
            headers: response_headers
          )
      end

      it { expect { subject }.to raise_error(described_class::PandorabotsError) }
    end
  end
end
