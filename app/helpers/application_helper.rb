module ApplicationHelper
  def logout_url
    @logout_url ||= URI::HTTPS.build( host: configatron.auth0.client_domain,
                                      path: '/logout',
                                      query: { 
                                        returnTo: destroy_user_session_url,
                                        client_id: configatron.auth0.client_id
                                      }.to_query
                                    ).to_s
  end
end
