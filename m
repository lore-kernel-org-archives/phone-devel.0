Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC6A34AAEB
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627962; cv=none; b=MECImABn5XkxJuWu4Asiyv+fH7gbO7ARjcOmOzZpBeLyC58IiRdQ/aNUhWsxylpQGvU0XD5t6Jvmzvf8goi1nkqbRUJkRCrKv/0daPgk53+4tCL3uQhXxFvZgvkOc0oPNorLQNehYSGPTlHhuFzLpXFD/TgRVLkdOsH2tkKvSiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627962; c=relaxed/simple;
	bh=MNrAIbdMcQ69eUABsCEhZ1TvMsJSWiKNRpYtVmTWOy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NKeJakXDH/6gYpqgw1lmDSw8rK1+ipA3GZiLEGnbMR32W3huCOu++RFYdMst9xfboCXaJv+M2ZsttriFphQ2Sr24tH8TkO8sqIaMg4yre8yHOWTnnMLdz7oNQ24SVjoNkF2KdXfeNQpRQ/K5aZYPp5t8hkdsk03Kbsvz5eQHhls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yxkqqcFt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yxkqqcFt"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b97e6e48b24so402672466b.2
        for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627957; x=1775232757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2+QJfKRcmrV5A3/+Pu8IIk900YGksP7rXJkNHvnm5M=;
        b=yxkqqcFtkVnIE7yUtU9TeoTOn4a/BDIAqeE0eeysU5YmP3eAMs3pzVvQWA91+HlzJ4
         LO/xEATw0q4h9J53k3XsTDKVKd9WC/vvVvIvnPUkFfz6R6/5hyq67BvkHOOUxnBuvNvt
         LzFswgiNe5BJLKrj+BSiYthXwBkWnLfb4sO8wWiiBLOi381j9a16kcgQz7JZk3Kd8tOS
         Qjn5sW+Spt+J3PWBa0HbKTwYeexu9doECP9oCYIGOEe/44n5dtnYWTbCVKXsV5KTJy3W
         +0XMrSB/jRkSCsb0dJ9I+TtCX5nx4xi8y0iFXsV5tJMPwYhC134HDnVkgDskG0A80IO3
         uzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627957; x=1775232757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w2+QJfKRcmrV5A3/+Pu8IIk900YGksP7rXJkNHvnm5M=;
        b=lTu8n3EQRwPd5vP/avKiHI/X7lclYxr2M2OUqdSVZnuvMDrZJui8fThrZWGE/x4OJV
         ZFDBNy2ux0Uvs8EJXDbgh6xl6uygFP1GKA1zl0dkdN8YZj8XIWzvOnxYZ1dQTVA/KTx1
         LTRVtAw0uP60+xGKth84glbqZAXb4fsLO9M6Zs2W7duJAmwMTPJZVEcRPt1F3yI7/tmb
         w1VmJGX/ADwgPwdycZd7JA8EheXo3GWvyDEL7UhY2FpO0Vu2yBWpmoTL5TwWYcxVhmWd
         xA4nGswQAPYtaI3E9YtYBOFvyRIxoKUm+ImonKEsl5kHPkBYIlqIDcHHnDNtHopywmvF
         vufw==
X-Forwarded-Encrypted: i=1; AJvYcCXBeR8BPmEdClyfIDhaDokEC4TEq53sSURCVZYtFkQBYyRfxuy3DhDYnK0cdHoPDDEA+DEFuVEPJ3nhkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7YDOallCYUS6mRn1VJKshFFRImGQqRSuaGpXzhNsJ9g6s7CmE
	/5PoidPYinqZ3f0wEoJpOxeL6r8KsQ0+fwvtoOdlEX4HCmNyfReXCfkS1WHD9dOeJnY=
X-Gm-Gg: ATEYQzz2Gm4hQyG8BM6nNqS70ypNHjnzXz6CgasnNWIioXC9fhbnIcubCWyR4wpjQmG
	Wyyau0hZfiBYcxyCTu053BM12bWH01ynMi0/7raw2lbzkRT3eGtWJiopIXEAS2mAFOUh544W+Yr
	YpZ3orvAEFg+9oQt6+zTPBekmRG2lsLpstFyGwgbNeAbbGQjPs14RpKQFgAS6yiPBN8HfJekFb1
	ojmiikzM/6uo+qNaL8JvGxycxsl1M5GvOGc30acDMbTsgjIhVH44vPRFeJClQej3hDrXNbI9Vry
	GfjL/S6LL+OsSWDachWazuBx8NJrAd0QHRLhFhVVHTiBOkg8SrjASkD24y/hajDEb0JfLJaILmZ
	i44g/aQqYIcC1rnTbLbQ0e3oxn13/CFg7lRToUpwVCqj2kxYRAC41nldjxr/rVgHBHyjNkD7Tv9
	Z/uahDAS4wOMzxIiS9abnDh9jJFCT19jWehbrFo5LlBoEmBApfohH1eVkT6ahy9jxS6Mi+CqYqg
	4XBabGrBa1Mnc2r
X-Received: by 2002:a17:907:388b:b0:b98:4850:3b89 with SMTP id a640c23a62f3a-b9b508fb15bmr201044366b.37.1774627957321;
        Fri, 27 Mar 2026 09:12:37 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:25 +0100
Subject: [PATCH v2 6/9] drm/msm/dsi: add support for DSI-PHY on Milos
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-6-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=2987;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MNrAIbdMcQ69eUABsCEhZ1TvMsJSWiKNRpYtVmTWOy8=;
 b=5SR/5qTBYNIDCGL8cuTNXwvhzYkYevnNbG5tqBVj6DaWvC5VwQFqUBefrvK3PQwf37OLko88/
 49lWJuZx0jPD32kD0ipHchOJxdTUSFwUd9ONcju8pYJK36i70aOoZXK
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
2.53.0

