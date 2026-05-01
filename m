Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991DA366060
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619740; cv=none; b=sSNeASTxoZq7UgrFpefdqNbRU/auSPIp0ZayycZwvqReZAFLImjAyyAdD7PyC8yMeOzLj9JKXSAneAORDJQ80tIYQmOwFZi4jSQ+spZM1h03N3YAHb3dU/nwunkN0wGlv55WF9QQcDVlG0mQpWj03b8eOxOjSI6Z735SPiwgqfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619740; c=relaxed/simple;
	bh=+OinyCwXS4Y2vYMDBUiIEDzwsNrg9k3i/PQu3jWxkfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjkahlOjCtM8+NGUnyotWuFHwCLC3Yz7y58UI5ME5ZxP2c1jpL2+up2CWRCwYIM6kNFVldS6u0hopUTNEYSuIUsnBjXZfgEt3Kj8iYlxbXUwqs8WEonlHJpn4ZirCbjsG7btseY7ga7PItPWJjJBlTGRDk6QWGJw9GRdsDW/wDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ybt+hLTy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ybt+hLTy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so16197115e9.0
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 00:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619735; x=1778224535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcRaxEDDkb3JD3v/suj0HVGZb78w7Xi1M1DpP43HiY4=;
        b=ybt+hLTy3nA9dLJAnFQWM+tQ/HSgP95TwFDTB+/8ngaBlbLznTw1HFrWP7QiXSHjNp
         g0PR9yDXJ/RjGAw/1gIJpMoGY95AUJkhg1iLt8EsQQtBI/dQp7kHLQK3EYqViHj/nkfa
         zaBKTJbd58Dpjn0kTaVbwnSXMsjkcxmQ55VSvBv0hezPUiQ6X5DeF+dJa0142Jzt4wYu
         pupwU7iX8M1AdgUFZDfulu9b4fSFXxSBtIP+R1Y5EYtZDCUFDJwv3WnnOBNUfJ0CBjrX
         0PQ67u4OzSBGN5p0fhhsCFYeRsalKJsgkmDqKdBwDKKnCOC+/+UHDaxYOQZukaQEj5+7
         dhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619735; x=1778224535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcRaxEDDkb3JD3v/suj0HVGZb78w7Xi1M1DpP43HiY4=;
        b=UDQrnz5psxkvZ41562nZ5VyYe9VKW6+7b06THXBAuI6maaNWtu7Hb0hs0oOK7ft9PX
         FCNGE88rJWKbjlp4gJ97p2PBbuXU7dwgUTS4oPGxeAbxFEnDDycdGiTxCsBCyw0hA5eg
         8J6kGhgHcGzRIVn0q5OLJkHOBsPr1urmpwy2+Mibf2rPzEhnJwK5Gatw504tqjOIGJ4R
         GeYLezv/LqQvwM8na0TRed2oYz3G9BkGaOR4hmwT2TviK8M6/OPUMWtRAkLxC7Pk5aKx
         F66oVYlGzPDwiQCMz3ZsqZbQ5QhHjcR3K/g7kJPd7+M0f6xJQCopZnkqFAGDoyN163+t
         yYeg==
X-Forwarded-Encrypted: i=1; AFNElJ+VUUOnwue96FRG5Accl0PoO3M7MW8M1sVCP01K2XmJNGmt5Cq6ghEZYN83tGR4XVohlmnTCtlTtrx+HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpKMUjocc+JAYj9GmVPWA05XSBw+XPs88oia1KNLxH9o7t3tjd
	RVmH8vhOqDvOEf8NBkv98+wk1bRk92qZuAl+2k2xc+UjiNLqgZm8T9dJgCKPaa2VsE8=
X-Gm-Gg: AeBDievSAMYDQER47o+4dy5yD1IWD5j+zucowI0cGbEu2FBGZl9feKRVds6+WkkNT4P
	RpBnAfo68ZxJZgNi8CkDXUqgq4/Sy1f+2Q9gdqzKwQwlckrmatJ0K9zKBjQTM+Oa5MxSVW+hWvX
	ElN6dtVD4N70k2DmqFnixK7oD8VOq8naY0yjr3bSG/gdUF2ckcpuOmir28KvsfYq73V1t+bSDlz
	gIGvSkm1p4G14Fo1pjIQuYOqruE3bGsduDOFzM3iB0txT2MCe4Qp4c7DpbLH1+YMXe2jsB1/z5x
	Bs16QZ0oaRhPkjY1dqiiuQybUNzbGaM1i6P+iBSk/lw7VAwDE5gnXoi9LmpOQU8862R7sUiWAfI
	Fu+PrIPqcrr97UOKsuJU6yf2U7f7Hvx6Prehm1GX532mb5pMaWfQoEaHWw0Ai5fzBA3pgvgJuZS
	7l+bKxJIdX9AYqXbjjXsgsptO+hfgvp4GUPw6AJJaBaGd4mJiSgaIg2eoXSfJfUBDaEsV7R8PEf
	/wk6hSacF83AQnhLZY=
X-Received: by 2002:a05:600c:c049:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-48a844683edmr73734095e9.15.1777619735065;
        Fri, 01 May 2026 00:15:35 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:48 +0200
Subject: [PATCH v3 6/9] drm/msm/dsi: add support for DSI-PHY on Milos
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-6-58bfc58c0e13@fairphone.com>
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
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=2987;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+OinyCwXS4Y2vYMDBUiIEDzwsNrg9k3i/PQu3jWxkfU=;
 b=SiQkl681uapJJ+uqBxGlRfO5q1AtnuHZPJC8JzrYe8Fk7kRLJyIsRWb0JSIR4rjf1Jv9SL4hj
 nPMtRiI/fR2DJlUQXHXfyEcjYDMgmdMJtNxhlZFToLqesXQZfRTZIrJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add DSI PHY support for the Milos platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index c59375aaae19..1fb3899b88bf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -571,6 +571,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_5nm_8350_cfgs },
 	{ .compatible = "qcom,sm8450-dsi-phy-5nm",
 	  .data = &dsi_phy_5nm_8450_cfgs },
+	{ .compatible = "qcom,milos-dsi-phy-4nm",
+	  .data = &dsi_phy_4nm_milos_cfgs },
 	{ .compatible = "qcom,sm8550-dsi-phy-4nm",
 	  .data = &dsi_phy_4nm_8550_cfgs },
 	{ .compatible = "qcom,sm8650-dsi-phy-4nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index c01784ca38ed..21a59d66e8dc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -61,6 +61,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8775p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_4nm_milos_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8f4b03713f25..984a66085dfb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1436,6 +1436,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
 	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_4nm_milos_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae95000 },
+	.num_dsi_phy = 1,
+	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_7nm_98400uA_regulators,

-- 
2.54.0

