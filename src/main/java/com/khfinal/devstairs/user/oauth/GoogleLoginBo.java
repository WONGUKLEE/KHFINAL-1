package com.khfinal.devstairs.user.oauth;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Component
public class GoogleLoginBo {
	private final static String CLIENT_ID = "16022288957-6ip1m24gjqcl8f5s187h6po0ochpo99v.apps.googleusercontent.com";
    private final static String CLIENT_SECRET = "mc8IQyv6y4Daeto-rWgQUKCe";
    private final static String REDIRECT_URI = "http://localhost:8787/devstairs/GoogleCallback.do";
    private final static String SESSION_STATE = "oauth_state";
    /* ������ ��ȸ API URL */
    private final static String PROFILE_API_URL = "https://www.googleapis.com/oauth2/v1/userinfo?alt=json";
    
    
    public String getAuthorizationUrl(HttpSession session) {
    	 
        /* ���� ��ȿ�� ������ ���Ͽ� ������ ���� */
        String state = generateRandomString();
        /* ������ ���� ���� session�� ���� */
        setSession(session,state);        
 
        /* Scribe���� �����ϴ� ���� URL ���� ����� �̿��Ͽ� �׾Ʒ� ���� URL ���� */
        OAuth20Service oauthService = new ServiceBuilder()                                                   
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .state(state) //�ռ� ������ �������� ���� URL������ �����
                .scope("email")
                .build(GoogleLoginApi.instance());
 
        return oauthService.getAuthorizationUrl();
    }
    
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
    	 
        /* Callback���� ���޹��� ���������� �������� ���ǿ� ����Ǿ��ִ� ���� ��ġ�ϴ��� Ȯ�� */
        String sessionState = getSession(session);
        System.out.println("sessionState : "+sessionState+" /  state : " + state);
        if(StringUtils.pathEquals(sessionState, state)){
 
            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state).scope("email")
                    .build(GoogleLoginApi.instance());
 
            /* Scribe���� �����ϴ� AccessToken ȹ�� ������� �׾Ʒ� Access Token�� ȹ�� */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }
 
    /* ���� ��ȿ�� ������ ���� ���� ������ */
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }
 
    /* http session�� ������ ���� */
    private void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);     
    }
 
    /* http session���� ������ �������� */ 
    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }
    /* Access Token�� �̿��Ͽ� ���̹� ����� ������ API�� ȣ�� */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{
 
        OAuth20Service oauthService =new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI).build(GoogleLoginApi.instance());
 
            OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }
}
