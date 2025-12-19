Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E5332827D
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162488; cv=none; b=QjhR+su25fXjxX/fPgrP/8ihLIEizV5t32JD1lQ1apw7T7ebG2QVoN3Dg+l5n2BALHymEhF8tnfYI/AFF46SYiSUP8670Gz3XSjdKJhsCXbLj7XsTeAipLIcJvpYr5Xld1zL735scY6c0X1AiXWFw85SINEWYk6FfhnBT9Elp9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162488; c=relaxed/simple;
	bh=ohNmR27RG7BPFcETLws/RzDvloxNbzu49qmgmsyHzbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMb3cbMU4jrih300tnIXXAx0ttqnvfXAsutk04FqifvOzMASQeWbJX57bvWHGay9GvO95ttzh9Bz2c4fhhysu+wlP+TUyyR1+Eoo2NTwa6XI9KVSd+Ryzg8OC/Jy5USo2Xlrxw7+sLRDqWh0DP85A+aWauZEbgkSW69tiAA9X2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=G3O+x61n; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="G3O+x61n"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b81ec3701so2234097a12.1
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766162480; x=1766767280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWMS63VZAWh+LwVHiFL3RZByyF+lbmglu9thz5C4XBk=;
        b=G3O+x61nJGQ2v9gxlW9DoKQWs7FlDsR7e+iYSWtrvNdmW3VOwum19S21HI7t7JSjSx
         N7pjkhfoO3dzCGING/WbFXZiPxc8fPpetibizAnOBeO/Llk1eKLD8irIq7uttHfle9/k
         Pu6kXgj8HLeQZDAW7b5yXXllT9hofWQImtONCCBhvNUj8LGi5R82DKmT4toJcbusaxLd
         IM80nrE8iSK6yLBYeJqX/0nCmJKQ23vIP2RyIN3KClbRWrl+w6eiLBnEYgX4zWYgLdQf
         hYzW0r3Fa7gdY9GxoY6DuyDAWhU1skLPaJQBnSVBIjqHEs+DyY8bUgeD0/kHCfs3Ltil
         /HtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162480; x=1766767280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uWMS63VZAWh+LwVHiFL3RZByyF+lbmglu9thz5C4XBk=;
        b=NwoYXCqbvCm698yrgxmUotEcHqh5oj5FeNw4fkpPGmCQajFo8Ri6CgDiQToZv/brQy
         I2EnasJEOU0qWVv/eV9HmHDU2+lYFTqGaXvgxEc2lWBQ099G8oO6ueqQtivw3282OW4v
         iw0m4eMCPh6SO+70IJUJvkjRiHpGMWz4bDDXwwCkHmOhe3uaVRb0buvCvKgTJX565hTr
         +S44x1yxtII+hyPer2azO9suh1zPHve/h0G9OcEwUNTbF19zYH6FEj3Zqd12DMAEs0mk
         eoa6LqV51pX9UOtvl+UluW3QhJPKvj1Azq5zOt+vsiVP9ZBhyU+0r3PrLG6wifnfq5F6
         SYMg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ngd3KOet/EtUKJXgsaevDh8dPrXMRkHaHySu2aIZtCcvhuCwWhuKn49IOYJB2FNkTVkVMjkzc65TZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc25fxq1/xNxye1zWnyng0ZXsLQ/7+36Nu9D0UZtG+uy46xWZW
	Ifj4hxaifrJNHRaAGLkF0y4cr+CaXtcrkFCjGvl9VU65Ie/HDC+5BqxmD1mCqX4MrXI=
X-Gm-Gg: AY/fxX7/ht/KQ5qZ93Nw9WRHXWW7SSZWPjT2Li8++5LXVLYFD3twbLNcUtTTiNnmJof
	bpSTISVwzJWZKzQpBvB2KXZaGVlboI4u74Hl/zxL00Rc3QkZb/EoHlbE1ON9CGB8+qOq6U9ML1F
	+9K/Uc2Ug4gvO3Ts+QNaeOOGoAL2WwcAeitQu2CtaO8OCGa6j2xmUX2sW9XBXqvHB31Lf6sA4v5
	tkVt29GzDDVGDMbaHFMmNDKVM6bjl4QbZ1YZAqomkq/oPLEatBBb31PMl0dEvXv2hKAkv/nkFYj
	8VKHiXkSI0GrRFsROd6nfMOyGKt3nVHASVycAFZt/UMY3Ruz6DUFKcLpkUQQO9dDia33IYYwhdX
	weuGJBcUSfG4Q7u8m+ytO6V3+OYURj1eE/3RW6ZL08N+sp75hxQLe2kNmEETNpYCInv3i8z9whI
	HqZiJv2RSxmyNM1A+Oo7zi0TRk9SRK2gj9jZz9HudhVX1rIGq22gvzChxjeeYLCsJ3CR+Im2l3m
	pZX8QANP842TX3V/BAZICoKDvHVHTkuBIg=
X-Google-Smtp-Source: AGHT+IFeBLx34o/uuAUMdH45ClT+LNyEz+ShlvD87iHmO/mzLZ8v0c7+jV3dTjNrwelR4FlFcBNZ7w==
X-Received: by 2002:a17:906:fd81:b0:b77:18a0:3c8b with SMTP id a640c23a62f3a-b8036f0a48bmr315593566b.1.1766162480371;
        Fri, 19 Dec 2025 08:41:20 -0800 (PST)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:41:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:08 +0100
Subject: [PATCH RFC 2/6] drm/msm/dsi: add support for DSI-PHY on Milos
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-2-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=2966;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ohNmR27RG7BPFcETLws/RzDvloxNbzu49qmgmsyHzbg=;
 b=u8kMZZ5XCdBAQqVc75EEYESeLgtSwulD/FZN1Nv9WKgIfHtzElwwgfCg8ePkE2aG/YwOFsu88
 +7CWnoGudYNBpfHSe96RbCE5NSbFfaFoIDAKT4j6P4V8E4RsRpxpuIQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add DSI PHY support for the Milos platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4ea681130dba..0ac5029d3eb4 100644
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
index 3cbf08231492..011bee593199 100644
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
index c5e1d2016bcc..6ca45e5c2cc0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1436,6 +1436,30 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
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
+	// FIXME not sure about these rate values
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
2.52.0

