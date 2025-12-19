Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC88633D514
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162491; cv=none; b=DgV0VvtqVy6YKpIt82uUbGI1MpQkv17tmFOrsHXBsNHW2vU2Wvr9k2SRuvbRyLTjDeDaQhHbfLfBfyX6Ivv1VQ7+LggSS0dCnZksFVjby3//Jec3Nxh5XNTg3tncZoPtYH3FxR4Zu30hLd6lmzHeLAUmc7WoaMAtiKvdnf09yJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162491; c=relaxed/simple;
	bh=tR/wcXsSRSmMC9AuE79DxiyAbWm/TId46OBOFeIFTQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLPIFv14SRHLfhjKTQojBdjZXoO9lqUgdxeeCTgmy5XnQqO8cZN/4EzxtlTaHRHLDMy/55AJx4ylhJ0eRrY0O6p1Fg9bqH2xeawFwcDv726wzk2xbZLiw8llfLNLdFLRfj64EmZiy8XmaBFRLAsSQXM89oVgnmDlf/Api0D7haE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZbT3nkv1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZbT3nkv1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b73a9592fb8so405439166b.1
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 08:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766162481; x=1766767281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0HzFaVjwMvZjTaaJOfxP1smFpIabOwZw0I+saghW9I=;
        b=ZbT3nkv11u2Olqq0mGExyEXwT21iJNdqLuoAgf8qVymKqesz9+tLdTWLtVcjCK9nYb
         1mLsf06DrDC/koQPQ4xV9PvLznqh7wQRJ4Qhc5DqVhxa8RTJY3MtKVX1EuKQg//A+p0D
         f21ro9MHDvIRG4CWCX6YFmeyZxw8n1vfeJhXp8//B1wkZuYDp/5nq4pyfn7WUlWCga+I
         HxbYTAWxW8wAvxK8BUvAgETJsx/HrAT1xqChq/JiFygAaXQZ/stX1yXcCX9Xr/CC6T2h
         PBiHQiJsNQVHMOa6dgNUJcHPjtGcNzAh+EAhpcd+jkGdzLH4D00MJ/v822mxl5fHlMt4
         0xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162481; x=1766767281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0HzFaVjwMvZjTaaJOfxP1smFpIabOwZw0I+saghW9I=;
        b=bivAWhBNjphfM4BdMyc42wu3UtdfgbVF+SXWqdxTELYeLHfFXJF0hZoEH+sdr8bGW6
         QqccKSiAjH89piC5Jfw1HcsdkNGeMfo2stc7IbpHOnPEC+HFXfgiFD/qNfJp8knHR3Nd
         fIIOZA6Bd4VVjYn6ORxjSBVLbAO5LNNQ0aF6XHh1En9QG4g2+MOHHXb1AaIq93ejXFTP
         sI1cwXSZ3Z8R/KxGbxd2k5b31C14am4p5/ixr4NFpMsnA0kfgTpzSwirLOJBxiAc41SY
         VGiWgyMXr/ZgP3yWlFV0xu/kT5NuKPcFF6pmEugt/dfG2+Nxn3SeUT9El46Hmt4jusKl
         ATag==
X-Forwarded-Encrypted: i=1; AJvYcCU1eyY1DZpQYQ8cODXo9qqxyxMxSvcMjm0el2IVuvVnM8UNUCoci4uxT1dd9WyyHLLp5vMIaYr70qtUhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhG7Lc8Nss20QWtwLgNxvN22FjM8C2sHG8LSjGA4diMEqaUKWk
	Z7ajEtLRqZ8n/Oy2q7iIDMkEWyEksRdYR7hblklg1LtDk/9DdC5a5sG5rceHhKh03PI=
X-Gm-Gg: AY/fxX6zYY13ZhLnSAo+setaFrC95KIp5qFnvp6Yl9vN7In6d3v9le+WpxsT1Yg36gK
	RfgfEDJPWBAbbIrXm+TqOspxJuNjRPfG+unbjlqg/OY+8DG6aQPjZVlnI63fJoQm+RZBBLNxUPD
	Et7dV19BZmiEawddzWNUAtjUfXoBh6kPyfg9Dr0JjaMHMNm28xThm+HkJ0G7lpHmoLGFYwbX/TW
	FHh0Ue9XRIC7Udi1rWTzV5UfdYh1PKnJaf0clq+23AE4bT8mv0EgNEUGv1Fhtsuydt599m6TIrS
	2vnLxyjEvqoxknxOO9FkPh1Mv6YkNedFyRlN9VbbslbjVejgMyCfTc9AoyqK9OPSNRNFJSAalQw
	9LVOLobKxHoydQnGTUXhumjBd4I8tXh6oWmWwQUohrHQV1y1IJoC7N2XFOY/PqT/8wYaYtgWyJx
	z70WgL+bkk6KdUWw3LwXDWUkMjE2DvWBYvUVgCwniGwSgtnhhrJnl89XubxkhfD+QuH3HGPFhRy
	xLAoaIsnVDlwSyclgD9p2pa8V74n1wal7g=
X-Google-Smtp-Source: AGHT+IHWxjRwTQlRafEaSyCGoH5228OD0CyKH8COwa1Vo5glIpgVUvP069JTSjZ+iajU/yCWxg/e+Q==
X-Received: by 2002:a17:907:7e9f:b0:b80:16:850b with SMTP id a640c23a62f3a-b803542da8cmr453536766b.0.1766162481221;
        Fri, 19 Dec 2025 08:41:21 -0800 (PST)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:41:20 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:09 +0100
Subject: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=1078;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tR/wcXsSRSmMC9AuE79DxiyAbWm/TId46OBOFeIFTQM=;
 b=C/2rJj/g80rHDRnltiMZEOcEAploGDh4/PX6r35eRIe0loQrjOFjPL/YrpppAgkRC0l/xHDie
 gbCJGLNqIaUDU0TzwF33KUnK8+cnJflwNKYcC2qUTOOC7gLTx5KaxHG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for MDSS on Milos.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c04..aa63c079d730 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -535,6 +535,10 @@ static void mdss_remove(struct platform_device *pdev)
 	msm_mdss_destroy(mdss);
 }
 
+static const struct msm_mdss_data data_14k = {
+	.reg_bus_bw = 14000,
+};
+
 static const struct msm_mdss_data data_57k = {
 	.reg_bus_bw = 57000,
 };
@@ -553,6 +557,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.52.0

