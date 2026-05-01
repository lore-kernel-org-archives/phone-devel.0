Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF9D3BF67A
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643583; cv=none; b=UA+0idNWOkXVua3d+AAuLaAlZPcJKKK+5pX4c9NPW4JcCTvggTNKKFwqHcJaMaU2gJ042+5MA7dINh3kfDxMmzJ1CoQSaCa9TRDbkUqOAD7iNx6Wi5XFVEzsWGrQNpBtPX3kOvTkP38aQg3TIWWgK1V+vUGLfT1VBxgflxRSqeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643583; c=relaxed/simple;
	bh=DjNX5gZc/D+U2BXi73d2NzYnyku+i1c2bZwR+jErVvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H34lq9jvuqy6M0vTtb3Epf4FX/h574DTzlkEt90xrkGP0Jik4MtGT2o9JlKLEKZFNQYSUZ36yyyzGqjf/an3+KTq+W3JuqbSa3JF68ceIpWK6OoEOo93xitNXEod6Do26Ag+BbGx94ZINhwc1415QD2R9hST4lryFzRBSJ8L32k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=krgXH9pU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="krgXH9pU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso14262625e9.0
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777643577; x=1778248377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlBdgMSaBrvj4nn3fTIofsiAJVqHoduoWGd4wbf6uD4=;
        b=krgXH9pU8b8Ox4OfTuleyRt5XjJMOvbG/NfnAs9cRSJ6jyKFcBWjW49KzhdGWIVQKo
         zXrqWtqAE5c4pTw1w8fnguLGrRXrtIerLBYMGCUkZp99OrC+yZsH+a4sp1n+Se67HjGo
         W4C2DJLTPOdpvyHHKBxkB7FGGe8odzvgBlqzZMc7sVkAJOuE8nPG1cMhuzV72NgD+erd
         7H9mHtzOjEigh/XLVQMWzGYYO4+nFxuN8FiC7Q+TzoJVbvKnxHh77tNsbtNKEDL2QD+S
         8JcAUCcXv1JlabDPFgE3ZoUbzAWaipFpIYwdKMVYY9NVoDbSZzT2+v5DwyKftb+qLaT5
         8LsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643577; x=1778248377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlBdgMSaBrvj4nn3fTIofsiAJVqHoduoWGd4wbf6uD4=;
        b=rEtbID/b6b8sI5aVoY/7Gns86KSULpZ8P8B0+X2xnrAAWq7Hve9YkAJj1Zxy+ctP/w
         7DJPPKrNRkdCMj03Ikv2RaJc4+mFx4/A/JZJSZKXlvFOe/GbYgfnwk1QTHRCMjArOcgB
         qGBLQtNAfWLrDCpK3Bz3M6iB1Ehh/e5Dj2PHHskT5mJPnT2K63MVYBXMEma1Qg8SZAQo
         C7hUWlyH+B476k8KKNENHQFgL7zm+jFOCs35oOzGauxlNCA7OXUKYmtOgY80bcJrr0IG
         tFXZ6G/HqIJPPKcDVWjFtt9yzvmxe4DoNLMtYrKs09ObPJDDmNVM7ZfCHx+RDWi1O5xr
         H1RA==
X-Forwarded-Encrypted: i=1; AFNElJ/BDYJ1NfXujNduT4jHx47iU1ym+0zxiYXMwMe0ojcJBMTRqP7XcECs3WSv1L2GQOQ1Ar4l9OqE2fj0QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRGQn950BS9WgPrGoADi4+zc/UHuBF0c/M8tEGwR2dZmcalE5s
	i6+C95uLWWDHBNpS7tBI3kcpUDs04et0QBHjLT6INxYG/H5xuCV8lWlFIC6AQeoiemM=
X-Gm-Gg: AeBDietJaCN8A1bVMvPBCT5JOUrl/59Jlds/LkgQ0hvzIjHFhSHsi8sFQjPOC3Ym999
	6RwMmH5cIebcC92zZ82UJeDt/WPR9e/Y9b9t9MIJ6ffZBtmt+TtKmhcfvyPI4TYOhdD58u2QNFm
	NbFQIQUhXvax5yh7PrT2YpaCMgGWzDpTzlzttBpy+YDgl5xTVZG9AIWlASjjV3Wh5Xkb/3avs6G
	MssiAQLXW5KRvMZFjxsExM54N3wWumww0roVQsZELS990XaW2LMDIZ5ol8rHTullLssG7VO4vL4
	2t5HHW2zBsmzdoLAcYyZDsTda0YvbaGeztVzlrnME2plW4+q94aUBOZ7+FUTc6b1NPKXyn0SqCh
	yH/Wr5IueEwx/Jj0zXtoRTyH0Njn3joNilOVMmzM9xkjxtQAHzxcgQPZTSTbMRfx5e1yA1OvX75
	yZE+8yrMy8dT1SNVHfe8JMIW2wAJYxYT2Jdc6maHDo2oqdNQJ3zM5EcXfOXQBlxhon0JLozSF9H
	0ClWWI3RFL4UbWRLu8=
X-Received: by 2002:a05:600c:a119:b0:48a:75b9:5e07 with SMTP id 5b1f17b1804b1-48a844f4de3mr89135795e9.11.1777643577053;
        Fri, 01 May 2026 06:52:57 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm143934275e9.7.2026.05.01.06.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:52:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 15:52:47 +0200
Subject: [PATCH 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-fp6-panel-v1-3-e09cb05651cc@fairphone.com>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
In-Reply-To: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777643570; l=724;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DjNX5gZc/D+U2BXi73d2NzYnyku+i1c2bZwR+jErVvg=;
 b=Y2pJ0AUuHyu+EETploINL6flChxL+nyB3pK50wKvLl3v72jYTSoxvGfIDclaN0/CdVAkrGmir
 NanfOodzP6WDAj8JVb7IBI6qsyJ9NM6FbF9JLWK4/bvdAzjAevbGEwQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..cbf62bf623ba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1007,6 +1007,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m

-- 
2.54.0

