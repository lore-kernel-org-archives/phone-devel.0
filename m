Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA913612ED
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 07:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619726; cv=none; b=X7p3BEPVce1K7GVm3WTm0HrmJWNRizudyDErUCrnx97MrFfsfqKXekvGCWfZXKjQeoR/iOaWoODmXizq7BOWntMbR7W5EQC0ceh9HCZoMuTUsiWoj05hHJfeNyCLGU0eUom1L/UrgognyfkbZftJf0o0t9POqqEQyYJ+fw1iH14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619726; c=relaxed/simple;
	bh=u4AOHqSTtzBSQJ6HpCIkCjUSJffdHCdBxVASoG0gP9M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HYhf4X6NPfTM0XTt3tK1B7Ga/R4/iBkdCfDff7uatV011MUWF+asYp7p0/YsXQPHQfoCcpIfrQUOIyI1xu4a9GqInCwqcBKXVRmDBWbDo9yMDLU0gdIR9vb6TUrsX1BvvUibV3Z0W2pYh8KucWwwkoqUND0Vnop6C5EgcNrUr7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4YVP7Gcd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4YVP7Gcd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso15113555e9.2
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 00:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619722; x=1778224522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sI6xBikbSzlLlr8+nu1EBDSADrRpoTvBTYV2Ibu2fTc=;
        b=4YVP7GcddFGwS1xv14do3pgVcu/fQdrv8e40cV3YEEgL9p68JRKP2n74zYxP8n9jxP
         FKUrjVMFF3+RJ3zX1v/RePam0m1CkN+S8LnqsvGuGN9Ln/Gmdyh70Pb6P05UlLk8D0+5
         513K4ruN/xiIYXHI2LyMHg16VjlnVfFAZdVPcGAwhQVQ1fca52+lKuoeWGU61wf3wI1d
         414EKdnxJU2BblMg5kLeVIUAztHSMG9D6eNOEwG9Mufik9uMdBXjV9UwZw7ycJdsP5nf
         JFH7oc3Dytd93/xNgD1IAIlIZ/nn5sPpzTnhBTd/2/godo+bG17nNGfB0pGYeSWki5VC
         OSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619722; x=1778224522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI6xBikbSzlLlr8+nu1EBDSADrRpoTvBTYV2Ibu2fTc=;
        b=OOJJh25p232+aF69iTuZvZ1onfC55TinHgP/BzkaYfK0sJvzPb0lPFfoRR37Cb18JH
         mEmj9JQueDgejXHbOVWxwKHTusAYeBsn77864rocDFALMBqT0r6U2i52LQU5PB+nilhT
         X9zwL2SSCTIReX1i9prs9BgnISmmdZdmbLGXgCkMExU4yrqyYtguJ4C8s1lc+rl0ZvDh
         mg2bmrCwpNEH4461nEyaJrW+k8eSrCNg4npDuNAcvloyMcy3iwsCfjzH22I9BMtV46nD
         wuvh2qiTIZ19xzFbwpS9z7Ub49SxKVwCO5ArjcMI6rXaa8Cnzb/fD3fPceGZDw8Z+Uqq
         GAXg==
X-Forwarded-Encrypted: i=1; AFNElJ8ibhwgFjh08fRJrJ8gQXVIRISU2O9Gfg2/Shya7VxZI6Yea2H682vR2niFTPuqMnM0nqRV/Ve+GuohUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1DHEYVcsjeSHfIzMWT5+0KB2zsv1DOPOcRudy5v/Hd1YzsUki
	x4XXoHw8pZM+N3QrpWih5Tm6IedaTNsQWfpE9e93ghUlZc9mayx3pFTZV450TCSBPps=
X-Gm-Gg: AeBDiesepDMZm3+jGjRDj1j7nlDu2FKCaTxbqN/U4c0RKvZnPIGScVPsN7Ob68svdYR
	15rn/Q1bsoMemq35EgVllGcWeNPlKlZAjsn7ygHqPJXya/3S5HZbNxUjWghkgxMpvJ6UAeOkkz2
	5v4/UZBY9FYKoWikwNXmUsoL3Q13FaoJihSON4gsIrO9fnRz4T/6DXZf1vIl913xBTiYlvZcjjS
	4iRk89ic1/ej9TvwwmB2nrAt0Ffg1k+z5TQFgixGBdc6ssKkNc+dHzDA0JJIxnLy8BZutxy0eD3
	aWMQBvgwVixVSNTSMmYYco13yRD2oxDadnzXzh5ZuW04at0kvwOrusXhb3loFb3EpislejJYfuV
	NCahyp0WtCdGwp1hLoUyJlKzGwh7krYpcP2Hlf1dpO4zzwszZeyZlUkP3Fjyos6tESRjqHtNQU/
	WoV73wChNVt868mzyKZJp9Bdtu5sThBetqD1XmheYYP0rrZypuhoK3FaRiC/Cudh6w6M8B2KjJQ
	iG2r1Wo
X-Received: by 2002:a05:600c:16c9:b0:48a:906a:9050 with SMTP id 5b1f17b1804b1-48a906a912cmr8140525e9.10.1777619722469;
        Fri, 01 May 2026 00:15:22 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/9] MDSS / DPU bringup for Milos
Date: Fri, 01 May 2026 09:14:42 +0200
Message-Id: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Pyw6CMBBFf4V0bU0ftBVW/odxUWAqkwjFthKM8
 d+tGBcal/dOzsmdO4kQECKpizsJMGNEP+YgNwVpezuegGKXMxFMKC54RQc8+0iHLkbqLDNa6ko
 ao0gGpgAOl1V2OObcY0w+3Fb3zF/tX83MKaOlksZWXDedq/bOYph6P8K29QN5qWbxwTWTwnzhI
 uNNq3Za76RTrf3FH+9pAS7X/F567yONjUDzfcBUFyMsia7yUrJMPJ7h1v/1GAEAAA==
X-Change-ID: 20251219-milos-mdss-fa0763693775
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=2542;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=u4AOHqSTtzBSQJ6HpCIkCjUSJffdHCdBxVASoG0gP9M=;
 b=GgAn3RCm2XTRW5OjQ+9yxLpcVCl8ULnaPfWJ+XpSU7o4jODj3CqRfHbV30ApXcp5M9nxIWxiw
 kAlD0wRlopCAlpDgkQ4p7NOWIyErcqyzn9fo1la+zMw9s7OPySz6Ezj
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

This series adds display support for the Milos SoC.

This is tested on the Fairphone (Gen. 6) using the SM7635 SoC (8bit DSC
cmd mode), and the Nothing Phone (3a) has also been reported to work by
Alexander Koskovich.

The panel driver for Fairphone (Gen. 6) and devicetree enablement will
be sent later.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Use "contains" for mdss-dsi-ctrl matching
- Fix dt_binding_check for qcom,milos-mdss.yaml
- Pick up tags
- Link to v2: https://patch.msgid.link/20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com

Changes in v2:
- Address comments from RFC v1 where it wasn't confirmed working yet
- Pick up some tags
- Add dt-binding patches
- Drop fp6 dts patch, that'll come later
- Link to v1: https://lore.kernel.org/r/20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com

---
Luca Weiss (9):
      dt-bindings: display: msm-dsi-phy-7nm: document the Milos DSI PHY
      dt-bindings: display: msm-dsi-controller-main: document the Milos DSI Controller
      dt-bindings: display: msm: document the Milos DPU
      dt-bindings: display: msm: document the Milos Mobile Display Subsystem
      soc: qcom: ubwc: Add config for Milos
      drm/msm/dsi: add support for DSI-PHY on Milos
      drm/msm: mdss: Add Milos support
      drm/msm/dpu: Add Milos support
      arm64: dts: qcom: milos: Add display (MDSS)

 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/qcom,milos-mdss.yaml      | 286 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml  |   1 +
 arch/arm64/boot/dts/qcom/milos.dtsi                | 211 ++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h | 279 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  29 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  23 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |   5 +
 drivers/soc/qcom/ubwc_config.c                     |  12 +
 14 files changed, 852 insertions(+), 2 deletions(-)
---
base-commit: c9bd03db3e792a99e9789fde20e91898e3a29e8a
change-id: 20251219-milos-mdss-fa0763693775

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

