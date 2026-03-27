Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FDE344DB8
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627954; cv=none; b=thvO/+dNdFNAE3OYhARaE1E/urDmJTVxH4ahUrQMaA0+mNT8XNjrN7fN3boqLAe1p8eimr9JocIq/83d4k4kM2fnFsLINhksoBKaWq69tkiTT0P+ecMrf0j/9bkhgqy5mD75apCgH+pPe30LaugHdWxIjnhHJsnymAYzUZ8v3zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627954; c=relaxed/simple;
	bh=10yPF8/VWMN/hc4QFl8Moeagof4tQyNFqpgYHI7SJQU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e5vKHi7al7R9kw49kxIga54r1C54jfqemDn36QP43IpPbRQHtQaCSAGnt3LZ6qQlluJBvXTUi+yT/FoTapb0CKlnccJ2CvSwFwYD+nXLavJ+5z+/ndou9oT1np1bNiTe6mwe600uoFv7U8WjrECoel6LXiGo2hUgoOaDysjdjaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=e2+9tPTE; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="e2+9tPTE"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso2972174a12.1
        for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627951; x=1775232751; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uI4iVL61EfDlecebQOI7GUlddKXIvzUTtydmWf5G7Iw=;
        b=e2+9tPTE4XWdbKnW2oPCCAGKrmWENSkFa9ycJ1Fif1C45QJzcdJTQ4TAvKVY0RtgmL
         KtoZ4+JSdrJxKIgI8QmAOkhvX7xOCJwjMYdilCWRIkXP0FLqnJSEEVNxvmSAd9cwqA1U
         5h+VsQ/ai9BLvJvgvhCO8Jyrw8xixZx2AdQH/zyyS5Ob+w+fTr+UmHPbFBgmqoGGF/7E
         qFOuM3R7+1eKE2HAnl26Vf4exlEJhUtzdcr6wMnyBGEf+XpgLI2NcaSq0oanfVdvI92G
         MHgusvMOSGNm7jGGCGhghCwAI7gxhVFOlXUNdKY0Cf+6TqT5ONMdvTl6gqoKvIxAODkW
         mlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627951; x=1775232751;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uI4iVL61EfDlecebQOI7GUlddKXIvzUTtydmWf5G7Iw=;
        b=KuXDSHIHB6ZhbNy5hf0by9lHF1e9GiR7izuJ6KkF00vhEchu8jIQDCG6UusPl2If1B
         /kj6F13B3NcCk6w9pbScJ6d6TziprmEeG6oC+CjV8C9pWp6+IkLbCOcZIPGpCTuyBedJ
         p3IePdJQ6HYo83/myscLpNu3JrQhCaHOV9fYCb7Rek4d185hAjS0QiAjErzN2NfLeCMk
         HNFebxBUOJIPsjg+RbBERt3UVFQN7Ag9AwEDLiPe5hNvE2FzCu2rPLxKEnmGXrEHlnGg
         1hVB2qCtxsO3L6HO52WgisofrkUJ4W2+mRalGvHXlRbANX0u16wW+nkAHKrst1WaatSW
         6D4g==
X-Forwarded-Encrypted: i=1; AJvYcCVNTq+d1tNT5isFKAXfcr8XdApS2Chc1aLWXTRk2qutotincbVoN+ANDscOpFr2nxGl27poNtiC7PsXhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuSB8wcAcjMVJIIqACjx1KTvgP/XjGnj1eogp+KvSGGgmhNr8A
	hfAceSzVa/yXRPRJ1bhQS32x8AKx938A2JhNoMO4cjOKh0YQahi12kW9RS8WaeJ47G0=
X-Gm-Gg: ATEYQzzWuRP00a5w6Bs3wVVGXTDsSMfYqFoNcOj9x+8e2Hp6RHhX+kP8NeEY8FaHSyX
	KjF7bC8miexRD0Dzx1e9Do3pUQsDYd55PPYiBJYt2vb3hiNUmCTbEBNEzomyx/fBdgnd6gWqLjV
	KrQH1N+XfUdYAv2+hEC40BEN3w5acRzBNEZj4bvsuWKsp0gPbM1dylN/gaEgG1mxhqpP+U8pyCE
	EXVUL11mlsIEO3f3TldDUaSJzhCJTecQ7/1Kf8x7jJvPrYyUmCZAIeVsPEOZFBQ2lwP75WTCjdN
	QOGDoc99qLxa6XAKBY/eiuq0d0riseM9YONmhkkqErluDYrzeKkezksOg5elEVdt2U46bw+IUI4
	numVFBP0Ui7+aBgBDUy+w0BIipEb5VoJrRHrQFtVaT0ufTaXFZ8YReiADiz5ZdU12jCJrjuzPGN
	ov8DNjcHHu+M05MMIzuWCOLkQ4t3y1LtCmT6nQ7O39jiB2/YVZhe6F4QYDu8HhFp8EyQzELas3G
	3VOiA==
X-Received: by 2002:a17:907:3e96:b0:b9b:171e:baf0 with SMTP id a640c23a62f3a-b9b50175870mr202321266b.7.1774627950599;
        Fri, 27 Mar 2026 09:12:30 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:30 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/9] MDSS / DPU bringup for Milos
Date: Fri, 27 Mar 2026 17:12:19 +0100
Message-Id: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6DIBBFf8WwLg2PCqGr/kfjAnWokxSxQI2N8
 d9LddvluZN77qwkQURI5FqtJMKMCcNYQJwq0g12fADFvjARTNRccEM9PkOivk+JOsu0kspIrWt
 SClMEh8suuzeFB0w5xM/unvkv/auZOWX0UkttDVdt78zNWYzTEEY4d8GTZjvcEV7v8l8+BkhrE
 9By95iv1QhLpkWumBSqNLYvpfHBp9kAAAA=
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=2322;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=10yPF8/VWMN/hc4QFl8Moeagof4tQyNFqpgYHI7SJQU=;
 b=9oPXoqG3XMqtp6BcyU4qHCegc+zNhFN7LJjx6NEN8RDodef5FFJKVS7qu7kmGmCyixaAYds8A
 jouuE+dbgNYAHi1BR1KXXYSNBeUJP8ywnCngw658VW+7vzKQ26JukT2
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
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,milos-mdss.yaml      | 283 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
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
 14 files changed, 849 insertions(+), 2 deletions(-)
---
base-commit: 50f91f877c695c7ce6cabc3df6a892ab7abc6c3b
change-id: 20251219-milos-mdss-fa0763693775

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

