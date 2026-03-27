Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F84346E77
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 16:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627957; cv=none; b=b5C8bqx3r7F11iZ7kWG8d6hths2z9Ke4bdrm8NqQLKaGHIkHp5FFHSU/JNvLY6XwZnK6Ss6IxMhuEVWVUlizWVXBbsBuD+Ia6B7SSpnH8lvqxDU+tqLvS0rByNLHjoKpsKfyUsAOZjJqCgNtb5o7WOdeOXnKV4ajN7BINm4pucs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627957; c=relaxed/simple;
	bh=yE1RpxPh/DRnOKswaQ1ncodoGzX/nyTiO4Mb1VhMZX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsVe/xPNc0y5k+rEHcb2Mim6zjbNp4uNHyVd+BEP7WNP4xV51CHX3vR+d0F1pzZcStqjCRWBQUdQhyAflb6i6OxMl88tBZqJwOnQqQnolRXiacJYsZso34Z+1iGyPnFWtgWRp3K0VhGu9jqkHB3ryUvyxwpUgDTihKuQFycsDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NStrfgZ3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NStrfgZ3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b93698bb57aso425038566b.0
        for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 09:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627954; x=1775232754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxZRmJAlZG7wXtvJLfbzMriOZdXFHi1O+JuWwAIE8qE=;
        b=NStrfgZ3Xhd/cu108KwxzIg+BrC58+4x0JUmgnKl4tLFDPj04h64v3Hxly5kQnlPDg
         Xlm7WiliBPmInrJtbNoeMXsN9BdVzYVH/rRTlQE24I3A/uD+mRrAEDbOLViCGGN4Ijzq
         A68XtSodSWK6w+SWTej5n5yLfQka5w3hUkOFZAx0/+93yJixronGKAQb0rIIzA5a58ri
         XPrl5pFo3X6GUxVZfrbpylJSD2LSY8JnL6t2RWDa0BZXQ2is3XfOIFVUnoakPL2T0ctH
         b+HWA+IvN3eq6CXHv2ICDZbmeReXO5zAexCQmPclnwaIPRH/emxFVoTTypADw2MtPwQk
         bnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627954; x=1775232754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yxZRmJAlZG7wXtvJLfbzMriOZdXFHi1O+JuWwAIE8qE=;
        b=GuxUrpm4reOhQPo3PC0pit8hEMnZTY9TDF0eyOSi3rKizGGDf9fXx+umnsadkozEdT
         Zcm8jcvtVY1F9vGiTkRWWjA3n4U2PtEb35nLiaGMu7LLTfEvN/DLEPS9mTrrt2lA57Pg
         Jgx7hTF8IsUOaJSQxLRAtErdWD+vR5kCEfPtrGEmkO9pjv1OGLHoPWTVyT5poPG9Kyth
         w2d5jmS80zizOqZqS5k404RibytMV8JYv9TcLkURj9yHGKnSmwLILFXYlMrdu1GLnBI6
         CQnPKMr7vulrQcntcb/iBDUFijEFyFit2e72wQ9WqVkuzRFeQmgFqg9Vx40wdJvVVNi2
         mN4A==
X-Forwarded-Encrypted: i=1; AJvYcCXySAz0qQLRkwdSQ+VOKEwysEntXdkNG6ZS4haCBMmPRd1KvIF1/zv7bv8dOKLOoGFycNddKI2ziK8oeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb2R5vh5rOIZCXIUFJCg1cW/625rpaaiBFpCIUOj//btE5NSJd
	DWnNbMPiawpZ0JGrLUAIXz71REedib8loNMfMW8YptMG6TXTKagl+8rp2u3dyPBZ1slkuB842gd
	UhNhimMY=
X-Gm-Gg: ATEYQzwVy7p+mnRrtZHKqXcO6bFYh0EOGMzglWW9C8EZ71C+ofWhrzqyWZy/hPjw/in
	HxeBsbE7Xb0MwkmWPdPMNbohH/CQWeROfmNd/w5JnFhihgOMghQpY9zoyUTHe4/Gn/CcFShiSEs
	RKnlENaliqHZ3V8NP5SEBt4QfRyBcAAC5bd1Ec6+SJGSMYBffjOSbXrhw7lsY7pnJNJqwLRiY4w
	36cIWTBhi/qLl3ChsmN6jfSY6zVlkUj0T2mewzgs6rM6lpQ3l4tl94Wss5GTZkqzSNREeV6Cxrk
	k6Z1l5UFi+YvjPY1RmsbFYdYNlm7yUVO87FmlZiclNc7PAiYxMNaCdfS3nCkV0osV0ip76pqqHt
	Gt/RIZieXawa9dI7OGIb3vouzCSKPENFj738ijs4O8fkTPgXKUUEcMShK1nN+lxrHL5PGNMEXAv
	9Am9Eqag7l5PxklauGA0KfxkCSUglLYQpvkliMO0Y6GdxnGFZ6xZ4WxHPaPErySRWUapzWu/Kj0
	tozzg==
X-Received: by 2002:a17:907:e104:b0:b9b:686e:6f93 with SMTP id a640c23a62f3a-b9b686e6fc8mr66703966b.26.1774627954248;
        Fri, 27 Mar 2026 09:12:34 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:22 +0100
Subject: [PATCH v2 3/9] dt-bindings: display: msm: document the Milos DPU
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-3-bc586683f5ca@fairphone.com>
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
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=828;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yE1RpxPh/DRnOKswaQ1ncodoGzX/nyTiO4Mb1VhMZX0=;
 b=EYH8l9XFu+gIk60JnlaqajCRZQpuvOuOmZnYT8nK9pzda5muZaL+zADWmYOwKH0sUZP4AMJMP
 Tac1oRxXtEcDOTjLOraL5q/iEyjayk4BVM175OuZ0oHeWn2DBaq6/GG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the DPU Display Controller on the Milos Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index dccac525d202..9da981639ddb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -18,6 +18,7 @@ properties:
           - qcom,eliza-dpu
           - qcom,glymur-dpu
           - qcom,kaanapali-dpu
+          - qcom,milos-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu

-- 
2.53.0

