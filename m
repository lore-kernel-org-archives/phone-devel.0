Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B2735E947
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619728; cv=none; b=pH9deU3fAhhxR+oFI0X4n585m5Y+Rr0bnGGCeDtU6OwGx7Zm7XbDLBvzxZySCJT78L30C5F/VF69qn/o46tYyVYKSGxLFwT57K+yTTGQGK1JrjLeFGrnZHrgtz8YpO5/Y9Ie0NcLYGJsbwzcoXz65dwt5q1uGccW0g6+SpCJCd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619728; c=relaxed/simple;
	bh=tlOAtlzfL1F+UAY6923+63QtzSr69t1x2DwkX2ImYg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EX33zNXrnb/Mp6BUZmmjYz2jdSTCThJar9G/DHggw5gbqKXceMKz0+9dH8Mj8xHdv2/1bfPRJMAt9FkLaV1bcO8QFRW8a2vNRBX93K2BOCm42amncq2d9hWfTFDccvdCa1kcF149a+AqYluwKwkmH1oiYwfcqEHFTg1lF7tmyDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nsTz5jPi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nsTz5jPi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso9012005e9.3
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 00:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619725; x=1778224525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uq9Fg7O2OJrY+/g1EvTIvGirgkQPf+eg+wmXlLWm4ec=;
        b=nsTz5jPiupJqdJzcSo8ewZ2tIgrEb3kZYfoOWVwHKSDNgsC0QF/pDIGkrlXMW6aUQ6
         xazc9YJPmdcDLdnVETsc3xExOdw/JsuA0BunegWgSo9Lcy3YM0bGyNXSQz/aDv4T2dpE
         jIAl0jUCpEKKnnj4dBbnwH8bo1DL6v+2jSVb83iqL2iwMJre9K3GUP62STSaXZ721yeG
         X8+CoVD5HoHQQrHiQqyyF13LmB2B8hxqJuHxhVFUlXEats7uJzG8yh/360iZNYrU/bcz
         qepg+MoFjlYy1T1EEAOUw25mgbKqAm7U1aVQ2QLtgAPD8hoZJSdQN9SegtKNdrdiV7YY
         Ro0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619725; x=1778224525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uq9Fg7O2OJrY+/g1EvTIvGirgkQPf+eg+wmXlLWm4ec=;
        b=gzchKQdTCttc15br2kGwljS2GHmdKwL0MVvmgwlA/GVj6dBHg59olqdMh659FBE3hc
         +3mi20A2WvgrVpR+oC8DqAsD7iVZEcXnkySZz+QOm4SDF6Z0EADyV0r5igsEcTi9vkSX
         NRxlvkrH9p+kIT6pi0xWIqdvJHBBZCVv+p0OK7Xt3cDVamXsuDroE4nBNhPIsbwXM9fN
         qOnFJanAUs27RCi/SNc3jHBjxLIxuud51rCzbOepBwWoHOlYo6MbCr/iQzID9cfjTzyV
         mGZCYqF527MLZoE0i5wW32TzduVWu8fmZBGSgjjegE43Fg0uMF7b7KwcpO6otKX1Dh1R
         yuXg==
X-Forwarded-Encrypted: i=1; AFNElJ8HbenL5rkKenVhBCwis9RfhVsGgwksbxyWFDDBIf8QkMoooNBNda539SqPPh0zDPHHQKVoGOtnOEROQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJen5/54S9p0f/GyjPpx36/f5MbaRPs189WwGnVIL9v/Yu50Q
	twRJj5Thm7712bCV7P2fohp9rU7VpJ9Cs2IPQt2L1tl6DPwUPNTx4ks5lhwFtXoaxr4=
X-Gm-Gg: AeBDietIKdreyBTEbvx/yccNgoePw/XWlGjoO5GqX8EGS/XfusfpjC9u9JInl08Fa5E
	IYGG5NSAFd+1otrBJpSUb1qOIx3Zb7lqwxl9CzOof1Un6XcO32+5qslIO9Zx6TkQPJMVVA3pK8r
	dzUAhGKXopnOhfy7SlOwyio5/SLJMhGUabQakrYQsikLqAU4m0mFOVV3GpfWF1wh5wFyqKxBdKi
	WUCaNabZs/Jmhk9OKgnCOEulxLYPHJA//FWAbw2Z9lxVxu/7MeGF3yL0Ks9bUt5Sv/s+Y0PH5hT
	//6R4TALDxg0e5iy8gMusprFA9J4efpvirK/l5UId1ywimCz6KumN9avXXsC7ZsCdGiWMMhkt8l
	p6z2SZ+s9AAI0Tt0KoS94m8spl33PxRdzkoEQhgAEZbhb5A55jC5R2AiCiAfzxb/5g9NvkKBuHM
	MVKVcbfWuOvI0wh98ccrO8j+eWlla0FfmMZT0BVF8thX8umW5evcKRKqHfIjcAmFH6aTROLLDYx
	3Q/fuuQpXurR1t68/k=
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48a83d73324mr100806395e9.8.1777619724709;
        Fri, 01 May 2026 00:15:24 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:24 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:43 +0200
Subject: [PATCH v3 1/9] dt-bindings: display: msm-dsi-phy-7nm: document the
 Milos DSI PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-1-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=903;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tlOAtlzfL1F+UAY6923+63QtzSr69t1x2DwkX2ImYg8=;
 b=laQULaAfc8EYK86r34quun+1G5b0TcaS4cM1GnEOiCb5Pdj9nYQBetdc5qYDEZ2hKy4ccSmM0
 tNuCVFDpAklCmj6toTgXK7Z2vsTawUWdb7/wVXasdTc+WvdDau5oM9c
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the DSI PHY on the Milos Platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
index 966c70d746aa..f397ba3fa84a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
@@ -20,6 +20,7 @@ properties:
               - qcom,dsi-phy-7nm
               - qcom,dsi-phy-7nm-8150
               - qcom,kaanapali-dsi-phy-3nm
+              - qcom,milos-dsi-phy-4nm
               - qcom,sa8775p-dsi-phy-5nm
               - qcom,sar2130p-dsi-phy-5nm
               - qcom,sc7280-dsi-phy-7nm

-- 
2.54.0

