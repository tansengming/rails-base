module LoadRequestFixture
  def load_request_fixture(name)
    Rails.root.join('spec', 'fixtures', name).read
  end
end

