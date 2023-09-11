<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile>
  <compound kind="class">
    <name>Stormancer::Plugins::Authentication</name>
    <filename>class_stormancer_1_1_plugins_1_1_authentication.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::AuthenticationPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_authentication_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::AuthParameters</name>
    <filename>class_stormancer_1_1_plugins_1_1_auth_parameters.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ChatMessageDto</name>
    <filename>class_stormancer_1_1_plugins_1_1_chat_message_dto.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ChatPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_chat_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ChatService</name>
    <filename>class_stormancer_1_1_plugins_1_1_chat_service.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ChatUserInfo</name>
    <filename>class_stormancer_1_1_plugins_1_1_chat_user_info.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ClientSettingsPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_client_settings_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ClientSettingsService</name>
    <filename>class_stormancer_1_1_plugins_1_1_client_settings_service.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::DeviceIdentifierAuthenticationProvider</name>
    <filename>class_stormancer_1_1_plugins_1_1_device_identifier_authentication_provider.html</filename>
    <base>Stormancer::Plugins::IAuthenticationProvider</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::EndGameDto</name>
    <filename>class_stormancer_1_1_plugins_1_1_end_game_dto.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::FieldFilter</name>
    <filename>class_stormancer_1_1_plugins_1_1_field_filter.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::FindGameFailedEvent</name>
    <filename>class_stormancer_1_1_plugins_1_1_find_game_failed_event.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::Friend</name>
    <filename>class_stormancer_1_1_plugins_1_1_friend.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::FriendListUpdateDto</name>
    <filename>class_stormancer_1_1_plugins_1_1_friend_list_update_dto.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::FriendsPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_friends_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::FriendsService</name>
    <filename>class_stormancer_1_1_plugins_1_1_friends_service.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameConnectionStateCtx</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_connection_state_ctx.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameFinder</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_finder.html</filename>
    <member kind="function">
      <type>void</type>
      <name>Cancel</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_finder.html</anchorfile>
      <anchor>a04fb3fae5bf1e5d90defc53bdc1105e0</anchor>
      <arglist>(string gameFinder)</arglist>
    </member>
    <member kind="function">
      <type>async Task</type>
      <name>ConnectToGameFinder</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_finder.html</anchorfile>
      <anchor>afba09740ffeceaa3880553a65d07238c</anchor>
      <arglist>(string gameFinderName)</arglist>
    </member>
    <member kind="function">
      <type>async Task</type>
      <name>DisconnectFromGameFinder</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_finder.html</anchorfile>
      <anchor>ad06f76999caec1a898477ca136c90b9e</anchor>
      <arglist>(string gameFinderName)</arglist>
    </member>
    <member kind="function">
      <type>async Task</type>
      <name>FindGame</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_finder.html</anchorfile>
      <anchor>a9e858b9ab569ede250a67bad709690a7</anchor>
      <arglist>(string gameFinder, string provider, string json)</arglist>
    </member>
    <member kind="function">
      <type>Dictionary&lt; string, GameFinderStatusChangedEvent &gt;</type>
      <name>GetPendingFindGameStatus</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_finder.html</anchorfile>
      <anchor>a1649c70785b071781da3597aa45a7951</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SubscribeFindGameFailed</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_finder.html</anchorfile>
      <anchor>abdce17f177ab9042660c9a91d14a2f0c</anchor>
      <arglist>(Action&lt; FindGameFailedEvent &gt; callback)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SubscribeGameFinderStateChanged</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_finder.html</anchorfile>
      <anchor>abeccd80fc14c71addf9fa2004c049346</anchor>
      <arglist>(Action&lt; GameFinderStatusChangedEvent &gt; callback)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SubscribeGameFound</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_finder.html</anchorfile>
      <anchor>a0e2ca290cb981bbae1a88c861051fefa</anchor>
      <arglist>(Action&lt; GameFoundEvent &gt; callback)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameFinderContainer</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_finder_container.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameFinderPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_finder_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameFinderRequest</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_finder_request.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameFinderResponse</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_finder_response.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameFinderResponseDTO</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_finder_response_d_t_o.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameFinderService</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_finder_service.html</filename>
    <member kind="function">
      <type>Task</type>
      <name>FindGame&lt; T &gt;</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_finder_service.html</anchorfile>
      <anchor>a634a8c6a542aa7896b89d530b5af7fe8</anchor>
      <arglist>(string provider, T data)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameFinderStatusChangedEvent</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_finder_status_changed_event.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameFoundEvent</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_found_event.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameResult</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_result.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameSession</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_session.html</filename>
    <member kind="function">
      <type>async Task&lt; GameSessionConnectionParameters &gt;</type>
      <name>ConnectToGameSession</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_session.html</anchorfile>
      <anchor>a8fb57813798027fce5c7d71c57514624</anchor>
      <arglist>(string token, string mapName, CancellationToken cancellationToken=default(CancellationToken))</arglist>
    </member>
    <member kind="function">
      <type>async Task</type>
      <name>SetPlayerReady</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_session.html</anchorfile>
      <anchor>a57fa76984130f950c1f38de1ed523d0b</anchor>
      <arglist>(string data, CancellationToken cancellationToken=default(CancellationToken))</arglist>
    </member>
    <member kind="function">
      <type>async Task&lt; GameSessionResult &gt;</type>
      <name>PostResult</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_session.html</anchorfile>
      <anchor>a7fc412158ff3fca4b4e6e2243d49988c</anchor>
      <arglist>(EndGameDto gameSessionResult, CancellationToken cancellationToken=default(CancellationToken))</arglist>
    </member>
    <member kind="function">
      <type>async Task&lt; string &gt;</type>
      <name>GetUserFromBearerToken</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_session.html</anchorfile>
      <anchor>a027b3bdc93b406480997997c44900123</anchor>
      <arglist>(string token)</arglist>
    </member>
    <member kind="function">
      <type>async Task</type>
      <name>DisconnectFromGameSession</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_session.html</anchorfile>
      <anchor>afe4d0eb6dfbd0c4ff0883ce2f9d18707</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameSessionConnectionParameters</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_session_connection_parameters.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameSessionContainer</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_session_container.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameSessionPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_session_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
    <member kind="function">
      <type>void</type>
      <name>Build</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_game_session_plugin.html</anchorfile>
      <anchor>ac5af29cba1e4ef470abdb3a448f8e2e6</anchor>
      <arglist>(PluginBuildContext ctx)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameSessionResult</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_session_result.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameSessionService</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_session_service.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameVersionPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_version_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::GameVersionService</name>
    <filename>class_stormancer_1_1_plugins_1_1_game_version_service.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::IAuthenticationProvider</name>
    <filename>class_stormancer_1_1_plugins_1_1_i_authentication_provider.html</filename>
  </compound>
  <compound kind="interface">
    <name>Stormancer::Plugins::IClientPlugin</name>
    <filename>interface_stormancer_1_1_plugins_1_1_i_client_plugin.html</filename>
  </compound>
  <compound kind="interface">
    <name>Stormancer::Plugins::ILeaderboard</name>
    <filename>interface_stormancer_1_1_plugins_1_1_i_leaderboard.html</filename>
  </compound>
  <compound kind="interface">
    <name>Stormancer::Plugins::IProfiles</name>
    <filename>interface_stormancer_1_1_plugins_1_1_i_profiles.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::Leaderboard_Impl</name>
    <filename>class_stormancer_1_1_plugins_1_1_leaderboard___impl.html</filename>
    <base>Stormancer::Plugins::ILeaderboard</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::LeaderboardPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_leaderboard_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::LeaderboardQuery</name>
    <filename>class_stormancer_1_1_plugins_1_1_leaderboard_query.html</filename>
    <member kind="property">
      <type>string</type>
      <name>StartId</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_leaderboard_query.html</anchorfile>
      <anchor>a7c8306372282197f7f82bfcb82a3dbdd</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>List&lt; ScoreFilter &gt;</type>
      <name>ScoreFilters</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_leaderboard_query.html</anchorfile>
      <anchor>afd6fc2ca782a8fd893a5ecda7165e0ed</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>List&lt; FieldFilter &gt;</type>
      <name>FieldFilters</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_leaderboard_query.html</anchorfile>
      <anchor>a6662d2c6cf08eb092bdb3aa568e8d4ed</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>int</type>
      <name>Count</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_leaderboard_query.html</anchorfile>
      <anchor>a7d6b8f1a89c56204687636e77566d4c5</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>int</type>
      <name>Skip</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_leaderboard_query.html</anchorfile>
      <anchor>a38e331cf6afb7413d0c638d51b7c710c</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>string</type>
      <name>Name</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_leaderboard_query.html</anchorfile>
      <anchor>a836e77f89a8cd310eb39fe5105afd7cf</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>List&lt; string &gt;</type>
      <name>FriendsIds</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_leaderboard_query.html</anchorfile>
      <anchor>a137dfd43589d068f5ad291a6addb7011</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>LeaderboardOrdering</type>
      <name>Order</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_leaderboard_query.html</anchorfile>
      <anchor>adeb5ad90adae62a2f261ac00719ba1b8</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::LeaderboardRanking</name>
    <filename>class_stormancer_1_1_plugins_1_1_leaderboard_ranking.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::LeaderboardRankingDto</name>
    <filename>class_stormancer_1_1_plugins_1_1_leaderboard_ranking_dto.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::LeaderboardResultDto</name>
    <filename>class_stormancer_1_1_plugins_1_1_leaderboard_result_dto.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::LeaderboardService</name>
    <filename>class_stormancer_1_1_plugins_1_1_leaderboard_service.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::LoginResult</name>
    <filename>class_stormancer_1_1_plugins_1_1_login_result.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::OperationCtx</name>
    <filename>class_stormancer_1_1_plugins_1_1_operation_ctx.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::OutputLogStream</name>
    <filename>class_stormancer_1_1_plugins_1_1_output_log_stream.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::Player</name>
    <filename>class_stormancer_1_1_plugins_1_1_player.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::PlayerDTO</name>
    <filename>class_stormancer_1_1_plugins_1_1_player_d_t_o.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::PlayerProfile</name>
    <filename>class_stormancer_1_1_plugins_1_1_player_profile.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::PlayerProfileDTO</name>
    <filename>class_stormancer_1_1_plugins_1_1_player_profile_d_t_o.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::PlayerUpdate</name>
    <filename>class_stormancer_1_1_plugins_1_1_player_update.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::PluginBuildContext</name>
    <filename>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</filename>
    <member kind="property">
      <type>Action&lt; Client &gt;</type>
      <name>ClientCreated</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>a79c0f7d2a79cd0b4385a81959e03a80c</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>Action&lt; ITransport &gt;</type>
      <name>TransportStarted</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>a2c0e82471ecc8c040f9427f1ba21ebe4</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>Action&lt; Scene, IDependencyResolver &gt;</type>
      <name>RegisterSceneDependencies</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>a2b7fdc5fac1647d60f15b4bd0865c05a</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>Action&lt; Scene &gt;</type>
      <name>SceneCreated</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>a860dc973ea07b71169e400d8a6633a01</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>Action&lt; Scene &gt;</type>
      <name>SceneConnecting</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>ac97a30c385f91cc4bc2996586d5d6ed5</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>Action&lt; Scene &gt;</type>
      <name>SceneConnected</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>a7b0151b04e050e4dc84f718800edae3d</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>Action&lt; Scene &gt;</type>
      <name>SceneDisconnecting</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>a1658e3368596db59f93738a2aba9fbf2</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>Action&lt; Scene &gt;</type>
      <name>SceneDisconnected</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>a8f1e1037d5c5582fafcbac7d8a724019</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>Action&lt; Packet &gt;</type>
      <name>PacketReceived</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>a6abc00521d8403763f3a56a08dfcf386</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>Action&lt; Client &gt;</type>
      <name>ClientDisconnecting</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>aec5eead298023f9c309a8e1d2b859598</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>Action&lt; Client &gt;</type>
      <name>ClientDestroyed</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>a9e3a0903dac72cd1b0c28373585f5301</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>Action&lt; Scene, Route &gt;</type>
      <name>RouteCreated</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_plugin_build_context.html</anchorfile>
      <anchor>a1738f8e2e98696645491e1cfba8954fa</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::Profile</name>
    <filename>class_stormancer_1_1_plugins_1_1_profile.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ProfileService</name>
    <filename>class_stormancer_1_1_plugins_1_1_profile_service.html</filename>
    <member kind="function">
      <type>Task&lt; PlayerProfileDTO &gt;</type>
      <name>CreateProfile</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_profile_service.html</anchorfile>
      <anchor>a827b436cf1e9f05dd485473c7893b2a5</anchor>
      <arglist>(string characterName)</arglist>
    </member>
    <member kind="function">
      <type>Task&lt; PlayerProfileDTO &gt;</type>
      <name>GetProfile</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_profile_service.html</anchorfile>
      <anchor>a15ff88b932978b314326be964f3f5b06</anchor>
      <arglist>(int versionNumber)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ProfilesPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_profiles_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ProfileSummary</name>
    <filename>class_stormancer_1_1_plugins_1_1_profile_summary.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::RandomAuthenticationProvider</name>
    <filename>class_stormancer_1_1_plugins_1_1_random_authentication_provider.html</filename>
    <base>Stormancer::Plugins::IAuthenticationProvider</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ReadyVerificationRequest</name>
    <filename>class_stormancer_1_1_plugins_1_1_ready_verification_request.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ReadyVerificationRequestDto</name>
    <filename>class_stormancer_1_1_plugins_1_1_ready_verification_request_dto.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::RequestContext</name>
    <filename>class_stormancer_1_1_plugins_1_1_request_context.html</filename>
    <templarg></templarg>
    <member kind="property">
      <type>CancellationToken</type>
      <name>CancellationToken</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_request_context.html</anchorfile>
      <anchor>ab529bd8fecb89826aa28ffa43e5bddb4</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::RpcClientPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_rpc_client_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
    <class kind="class">Stormancer::Plugins::RpcClientPlugin::RpcService</class>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::RpcClientPlugin::RpcService</name>
    <filename>class_stormancer_1_1_plugins_1_1_rpc_client_plugin_1_1_rpc_service.html</filename>
    <member kind="function">
      <type>IObservable&lt; Packet&lt; IScenePeer &gt; &gt;</type>
      <name>Rpc</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_rpc_client_plugin_1_1_rpc_service.html</anchorfile>
      <anchor>a9c4966bc2cf2e6d4d6cb0d3aec5b4d60</anchor>
      <arglist>(string route, Action&lt; Stream &gt; writer, PacketPriority priority)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddProcedure</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_rpc_client_plugin_1_1_rpc_service.html</anchorfile>
      <anchor>a6ae9359da5c1c3496a8a74848f04086a</anchor>
      <arglist>(string route, Func&lt; RequestContext&lt; IScenePeer &gt;, Task &gt; handler, bool ordered)</arglist>
    </member>
    <member kind="property">
      <type>ushort</type>
      <name>PendingRequests</name>
      <anchorfile>class_stormancer_1_1_plugins_1_1_rpc_client_plugin_1_1_rpc_service.html</anchorfile>
      <anchor>a06d1decefe03add5e559828e775bc1ea</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ScoreDto</name>
    <filename>class_stormancer_1_1_plugins_1_1_score_dto.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ScoreFilter</name>
    <filename>class_stormancer_1_1_plugins_1_1_score_filter.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ScoreRecord</name>
    <filename>class_stormancer_1_1_plugins_1_1_score_record.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ServerClock</name>
    <filename>class_stormancer_1_1_plugins_1_1_server_clock.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ServerClockPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_server_clock_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::ServerStartedMessage</name>
    <filename>class_stormancer_1_1_plugins_1_1_server_started_message.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::SessionPlayer</name>
    <filename>class_stormancer_1_1_plugins_1_1_session_player.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::SetResult</name>
    <filename>class_stormancer_1_1_plugins_1_1_set_result.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::StormancerEditorPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_stormancer_editor_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::TeamDTO</name>
    <filename>class_stormancer_1_1_plugins_1_1_team_d_t_o.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::TransactionBrokerPlugin</name>
    <filename>class_stormancer_1_1_plugins_1_1_transaction_broker_plugin.html</filename>
    <base>Stormancer::Plugins::IClientPlugin</base>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::TransactionBrokerService</name>
    <filename>class_stormancer_1_1_plugins_1_1_transaction_broker_service.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::TransactionCommandDto</name>
    <filename>class_stormancer_1_1_plugins_1_1_transaction_command_dto.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::UpdateDto</name>
    <filename>class_stormancer_1_1_plugins_1_1_update_dto.html</filename>
  </compound>
  <compound kind="class">
    <name>Stormancer::Plugins::UpdateResponseDto</name>
    <filename>class_stormancer_1_1_plugins_1_1_update_response_dto.html</filename>
  </compound>
  <compound kind="namespace">
    <name>Stormancer</name>
    <filename>namespace_stormancer.html</filename>
    <namespace>Stormancer::Plugins</namespace>
  </compound>
  <compound kind="namespace">
    <name>Stormancer::Plugins</name>
    <filename>namespace_stormancer_1_1_plugins.html</filename>
    <class kind="class">Stormancer::Plugins::Authentication</class>
    <class kind="class">Stormancer::Plugins::AuthenticationPlugin</class>
    <class kind="class">Stormancer::Plugins::AuthParameters</class>
    <class kind="class">Stormancer::Plugins::ChatMessageDto</class>
    <class kind="class">Stormancer::Plugins::ChatPlugin</class>
    <class kind="class">Stormancer::Plugins::ChatService</class>
    <class kind="class">Stormancer::Plugins::ChatUserInfo</class>
    <class kind="class">Stormancer::Plugins::ClientSettingsPlugin</class>
    <class kind="class">Stormancer::Plugins::ClientSettingsService</class>
    <class kind="class">Stormancer::Plugins::DeviceIdentifierAuthenticationProvider</class>
    <class kind="class">Stormancer::Plugins::EndGameDto</class>
    <class kind="class">Stormancer::Plugins::FieldFilter</class>
    <class kind="class">Stormancer::Plugins::FindGameFailedEvent</class>
    <class kind="class">Stormancer::Plugins::Friend</class>
    <class kind="class">Stormancer::Plugins::FriendListUpdateDto</class>
    <class kind="class">Stormancer::Plugins::FriendsPlugin</class>
    <class kind="class">Stormancer::Plugins::FriendsService</class>
    <class kind="class">Stormancer::Plugins::GameConnectionStateCtx</class>
    <class kind="class">Stormancer::Plugins::GameFinder</class>
    <class kind="class">Stormancer::Plugins::GameFinderContainer</class>
    <class kind="class">Stormancer::Plugins::GameFinderPlugin</class>
    <class kind="class">Stormancer::Plugins::GameFinderRequest</class>
    <class kind="class">Stormancer::Plugins::GameFinderResponse</class>
    <class kind="class">Stormancer::Plugins::GameFinderResponseDTO</class>
    <class kind="class">Stormancer::Plugins::GameFinderService</class>
    <class kind="class">Stormancer::Plugins::GameFinderStatusChangedEvent</class>
    <class kind="class">Stormancer::Plugins::GameFoundEvent</class>
    <class kind="class">Stormancer::Plugins::GameResult</class>
    <class kind="class">Stormancer::Plugins::GameSession</class>
    <class kind="class">Stormancer::Plugins::GameSessionConnectionParameters</class>
    <class kind="class">Stormancer::Plugins::GameSessionContainer</class>
    <class kind="class">Stormancer::Plugins::GameSessionPlugin</class>
    <class kind="class">Stormancer::Plugins::GameSessionResult</class>
    <class kind="class">Stormancer::Plugins::GameSessionService</class>
    <class kind="class">Stormancer::Plugins::GameVersionPlugin</class>
    <class kind="class">Stormancer::Plugins::GameVersionService</class>
    <class kind="class">Stormancer::Plugins::IAuthenticationProvider</class>
    <class kind="interface">Stormancer::Plugins::IClientPlugin</class>
    <class kind="interface">Stormancer::Plugins::ILeaderboard</class>
    <class kind="interface">Stormancer::Plugins::IProfiles</class>
    <class kind="class">Stormancer::Plugins::Leaderboard_Impl</class>
    <class kind="class">Stormancer::Plugins::LeaderboardPlugin</class>
    <class kind="class">Stormancer::Plugins::LeaderboardQuery</class>
    <class kind="class">Stormancer::Plugins::LeaderboardRanking</class>
    <class kind="class">Stormancer::Plugins::LeaderboardRankingDto</class>
    <class kind="class">Stormancer::Plugins::LeaderboardResultDto</class>
    <class kind="class">Stormancer::Plugins::LeaderboardService</class>
    <class kind="class">Stormancer::Plugins::LoginResult</class>
    <class kind="class">Stormancer::Plugins::OperationCtx</class>
    <class kind="class">Stormancer::Plugins::OutputLogStream</class>
    <class kind="class">Stormancer::Plugins::Player</class>
    <class kind="class">Stormancer::Plugins::PlayerDTO</class>
    <class kind="class">Stormancer::Plugins::PlayerProfile</class>
    <class kind="class">Stormancer::Plugins::PlayerProfileDTO</class>
    <class kind="class">Stormancer::Plugins::PlayerUpdate</class>
    <class kind="class">Stormancer::Plugins::PluginBuildContext</class>
    <class kind="class">Stormancer::Plugins::Profile</class>
    <class kind="class">Stormancer::Plugins::ProfileService</class>
    <class kind="class">Stormancer::Plugins::ProfilesPlugin</class>
    <class kind="class">Stormancer::Plugins::ProfileSummary</class>
    <class kind="class">Stormancer::Plugins::RandomAuthenticationProvider</class>
    <class kind="class">Stormancer::Plugins::ReadyVerificationRequest</class>
    <class kind="class">Stormancer::Plugins::ReadyVerificationRequestDto</class>
    <class kind="class">Stormancer::Plugins::RequestContext</class>
    <class kind="class">Stormancer::Plugins::RpcClientPlugin</class>
    <class kind="class">Stormancer::Plugins::ScoreDto</class>
    <class kind="class">Stormancer::Plugins::ScoreFilter</class>
    <class kind="class">Stormancer::Plugins::ScoreRecord</class>
    <class kind="class">Stormancer::Plugins::ServerClock</class>
    <class kind="class">Stormancer::Plugins::ServerClockPlugin</class>
    <class kind="class">Stormancer::Plugins::ServerStartedMessage</class>
    <class kind="class">Stormancer::Plugins::SessionPlayer</class>
    <class kind="class">Stormancer::Plugins::SetResult</class>
    <class kind="class">Stormancer::Plugins::StormancerEditorPlugin</class>
    <class kind="class">Stormancer::Plugins::TeamDTO</class>
    <class kind="class">Stormancer::Plugins::TransactionBrokerPlugin</class>
    <class kind="class">Stormancer::Plugins::TransactionBrokerService</class>
    <class kind="class">Stormancer::Plugins::TransactionCommandDto</class>
    <class kind="class">Stormancer::Plugins::UpdateDto</class>
    <class kind="class">Stormancer::Plugins::UpdateResponseDto</class>
  </compound>
</tagfile>
