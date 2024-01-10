Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087A4C3DC
	for <phone-devel@vger.kernel.org>; Wed, 10 Jan 2024 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hl53Ro7I"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a28a997f3dfso327661566b.0
        for <phone-devel@vger.kernel.org>; Wed, 10 Jan 2024 07:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704899660; x=1705504460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+f27VLO9Oz+Xtc3r9QInI9tNoYegp0SCYqbUt1hN6T4=;
        b=hl53Ro7Iih/C1dGnxSdBrNp4dQOra16fKAXonIQ7IWaV3oFwAFC1TZzs3GnW/GzLQK
         SmHRtmrp4DWO74zazWHcW17/MA5x6kQUVfL9C9aNgh0HwYWS/dRsi251jTXTV/2igPvs
         pUTl7wwtEfhLMQ90K/vqHX6504Qa5TqCcLSp5Xwh9GF8aUyO0DGlCGW8QnMr9i38fFuG
         N8Z8cchoj0l4Y4LCf5qOFlUxCBgL4KcVcW4TGF1GNiJpct5TIOgqiJlwTZsoXt6DDpOf
         DQ6HBbgZJC8Kz99tF9yOWhsF6+FALf3GvKbNNqMbc5QXo6uwHGxd614S0kdcNTBNyR7w
         eo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704899660; x=1705504460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+f27VLO9Oz+Xtc3r9QInI9tNoYegp0SCYqbUt1hN6T4=;
        b=K6W8IzWNttFQtMj9NxAYR9ydbaQtaZsadyJA6S+ijTbSabjfO86NeljMOnUa+GWBVd
         5V4BDYI0XuyrrnyOuLpAHS9YCUioYC7JAB3WM3mZM9Ict6gZ6alsPmBIpmBzxxMu836W
         LB8i/mjSSlCW3oVjIEtzzH+HEYuN2IFcVg/K+i1LulUSW1KqlNtXvMF+RMBeQgljqmhN
         nRWaIKh7eVdj7bPbkFnOkmhUxnc5cSIa/r2fUqyfLnThnCYxZ2K9nzv+CRjcrw57baCv
         pUwLB2hWQqTXfuaHp6rNyv6nKnFS/paODvhNGnmDLd+rsLo1FjtiC7MD2GZyZrmLu44P
         mDLQ==
X-Gm-Message-State: AOJu0Yw9C2eP8/tmRAY0Wt6bHO4E2ehj3MZwjxr8vX+M3UUYnXBM8Ooq
	E5OfywkN+G+C9x2KP68GHEIgCJh+dSeBTQ==
X-Google-Smtp-Source: AGHT+IFjwvqQinr4aYI1QkACyE+dvAqO6bYMFt2Rs7JHAgqJxl1xn05Gqj5td5uc/AVJ0O9QomARAg==
X-Received: by 2002:a17:906:6:b0:a2b:c7df:87e2 with SMTP id 6-20020a170906000600b00a2bc7df87e2mr718602eja.61.1704899659753;
        Wed, 10 Jan 2024 07:14:19 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id jx22-20020a170906ca5600b00a27a25afaf2sm2174517ejb.98.2024.01.10.07.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 07:14:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Jan 2024 16:14:10 +0100
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm6350: Remove "disabled" state
 of GMU
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240110-fp4-panel-v2-3-8ad11174f65b@fairphone.com>
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
In-Reply-To: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

The GMU won't probe without GPU being enabled, so we can remove the
disabled status so we don't have to explicitly enable the GMU in all the
devices that enable GPU.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8fd6f4d03490..29008e155d62 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1449,8 +1449,6 @@ gmu: gmu@3d6a000 {
 
 			operating-points-v2 = <&gmu_opp_table>;
 
-			status = "disabled";
-
 			gmu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.43.0

