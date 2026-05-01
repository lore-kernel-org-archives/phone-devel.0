Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A135E947
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619730; cv=none; b=SMoAsgfl0z49mcEDb5TmsrtmuVuyFG0jY6TPcr2ULHILdoDnzwEUFdmxCMRRzDD1sJChpLvUWZPDDArlrcV9mNE6MsLPZo6CU6r+zpbS/v9X7MBc08aRR/0o7YGfrYJsKXmmF9cEm3AeCDza5JamRY88efzAzdHPUE0+n11VIXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619730; c=relaxed/simple;
	bh=BCj2FLTcOJgjzO48MJefQIMPqJBsSoeL9qxaR0JSpFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NEsJr2CkLFtCUU9GqG0ORj8kBR55P4qF0q8Oxow0FEcKr9OUrpskOvEVI9JdXa4oyG1ccZTYx/hjfIHiwhJV4EZT4PSXj5ntpp8ZXL3vsu0tG4b8SRvw6Hn+mb9yTcpGwOn5gVXn/TA2/5+2hT+OLt99MYk8SRZxidGNYM3S54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3mJcU0Y6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3mJcU0Y6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483487335c2so18051295e9.2
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619727; x=1778224527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9cBOyPysOTRVWivLRI31LjBpVlIJ+dTPcG0HTJLV48=;
        b=3mJcU0Y6z+Qkkd5fHiSbrJBrZg/uWaV7LHvAJJT4NWFQPAAh/OjWh7FMmNAFJt9tmG
         CFrODfgM4JuPpMXaWWE/ejnQLyfQBQbb7HdPXbOHmYPOG/liieoRK0je6OqkjRaLgh5z
         LUhvl4lCTYVsmLs819IaIQgoBpmMlrq6LIMBh5V+9xeUh4vRb09vSz+D+kyZKUbC7RPH
         gybTWcU54hSbM04ZWhS0cs1il3a2q5/u4i7NpKR/hhtZN5QR2dceg7H3V/l416O6pVAf
         A5WgFpAcZ/gyMvmXv9msnLP2pgxz/wenvrVqj/sjoPLMPSsv8Z4YulTV/tbUwV0hE+EJ
         u6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619727; x=1778224527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9cBOyPysOTRVWivLRI31LjBpVlIJ+dTPcG0HTJLV48=;
        b=GtUtVrcginS9dvmx1Pa3XIiWroDlG7e/e0jxdhosLnc+Ma2E+r7FS5YCA6Q+noseMG
         1re17/NaWa+6wiSntPwk+2cAtgnjmhET+sQXqDn8TRxs8MQMTRJ9TUa3CEUa18dfOsme
         Col13IbA1ADn9ZrThJR+tDvIDdmovvgZveyM0NzSlHPzHKURUL+ny1KZYbf+wof5OwzB
         tpVn3+WwifcJur53jBUYlLJ7yJX+Vghf2SBRJrXkVPDEEIiyI0wya1QVWcVgfWY5Dvyy
         tIitpMCD4EVoP3nafOx6EPYvAMaf9hoasFtRH4OuOYsdKCXXseyrRggXS/pU8si8N7gB
         +ayQ==
X-Forwarded-Encrypted: i=1; AFNElJ/veKtjN8xaPdz6jyzq05BDhF0tagN+rFPP93/6L0S3lGzWKmCioSR+xslEVGRn0bAIW50HMY+MgZj3PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Dm/l0UpNeWMSwZxBBpMiCD3RJjbqDMH3VKoptZDstdFSHCaB
	Dxw9FvBIYAT5/8DKw3O4V8Tgo4QyF4d2dJHxXifXrHT6NimMxLTj+Gze/0CKlTQTWDw=
X-Gm-Gg: AeBDiesrlzX6SqSeKU913ReSo1BX4H2wa7+fw4R6G3U8AwME2zwvxRPXnfwhNy6L5cf
	sn79iF6JzZTc8Z4+9EvjLOkvakMqQ7byO00dtJ+AlUupjVuIJ3ZhTtVibwBAv2aPulhFv1st6JW
	iZLDEwAgdfzAlvbnv1M+qb7mb5cpKMkjO0eE5Mgs3XcoxVzMYQMg6a6PRalmY0QM0h0G1JuF6GM
	0FY7e6mnSJoajYnUojbBOW7v3H6wvTHGQynBwB33DL8a95ytYDuFr5MkduZur88mEQ28wkXEDp7
	lsZBhsgOpl+Bj3ifrxZhLqQiz2fnt9CSB4zf64f9At4hMIeBQzCakurX02d1sjpk6Yg0UZnREMr
	g7PZtbwJadunbcDuW7u3cJ7giLHsoujiSZGHDuzKfwrhP8i+JcScLnCiyeSB0OuGq27XqXt4bIJ
	xVSkJMHAyc7T4UjG7ufQPeis+te7FiPH+38L80qHqFtbKalRYl4mv02+54/nyYFlrvRESQHwTzR
	VzSzjYbfXVxSQN9qcI=
X-Received: by 2002:a05:600c:8708:b0:48a:5970:2003 with SMTP id 5b1f17b1804b1-48a844e4a83mr97816475e9.3.1777619726960;
        Fri, 01 May 2026 00:15:26 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:26 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:44 +0200
Subject: [PATCH v3 2/9] dt-bindings: display: msm-dsi-controller-main:
 document the Milos DSI Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-2-58bfc58c0e13@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=1188;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BCj2FLTcOJgjzO48MJefQIMPqJBsSoeL9qxaR0JSpFI=;
 b=aX1/waVjF+hvivOAF3HL0UFE6nbkla3myKttlbuQHoweT7fKoatB5FZR6ILx8LPMNgVvk1SLI
 ENhaEJDidHzBHLymIm0/WL8AWCn/emn650yUZt9JQQroA8ZM/bzUE83
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the DSI Controller on the Milos Platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index a24fcb914418..dbc0613e427e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - qcom,apq8064-dsi-ctrl
               - qcom,kaanapali-dsi-ctrl
+              - qcom,milos-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -339,6 +340,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,sa8775p-dsi-ctrl
               - qcom,sar2130p-dsi-ctrl

-- 
2.54.0

