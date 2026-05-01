Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4DF366DA3
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619732; cv=none; b=VUwZ1k4xBZLUSstUDbPLVA+w2XVQHBBj+MOA3n1RSyHzOfB4lzETCn7lU/Vn2vkOH9UYh4HU56am39QgtKk7RjlOCVzwkxZJKtoklPEmovhllfbsKnquZYEgJAo56E8p+ENoYIU/E1hldFJQ2WrXd310ULLm5jYpr0tpqNsAoAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619732; c=relaxed/simple;
	bh=eqkvnjw06SSJ1hiPbfLlBQP+odbRhP/MaR7qzy/itWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xfq30HDaXtyBEdwdSd/U2mvg77LXxjVlXNSpXDRqVf7qCHWBpzN32ZLtK+gdYOv/2/iDwrv5I/JYOT0B7UfW+GVLfGc2ihJX4igV+4OdUBcpeW+CQN9lCeAEQMqJFFmrZWqls3gF2rtcEilFG0TgEHngM25yEMLjk1Vd2zqI3a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kXPdV5Eh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kXPdV5Eh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so16320805e9.2
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619729; x=1778224529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2t17h10rSE2WAVFCSqROPUo3RCLB72K5unwgCexayM=;
        b=kXPdV5Ehjx+JqaveyEdqvrsj+lFrqFMztXIw82EbM6Agxkbcj4sYorYM/CXtm4//vk
         3b+L+xzULaqrnWInVdFQ+nvYYxWuKvC/GPQqt3eP5Nt6K8VqxhZdxbQJJ9wkzYoxOMCM
         fFyE1qPLJfRtRipMOxcazTvqVrjPVp9CnAy2KEjpSM2TqKq9LAEzSmEwFRcDfRvLPr0v
         rbYwltdz2wG2BMMqDbZc30FkqFlsxfgPVmohnhhb04hFnc/eGZnjJzI/2X2aXcUwcMOd
         67f4R6q7eQ+ZnVDVA8sxikgrlhYZoXriHuPZLJFtpNSGUlaMFBVyuCdCZCMY8htdxTVM
         wGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619729; x=1778224529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2t17h10rSE2WAVFCSqROPUo3RCLB72K5unwgCexayM=;
        b=dWKIpSNN03coZZ0YGQCZxYO2wkhGuyTllZKR5taNPNxhBVMxj8um/x5yGBeWg4z6vY
         qP85+tjikPpwC2Ug3+OeUWvjUrorHuEVe4qMSNRZpv3SQ5lGQuvO5T7VekuHhFZLXxx6
         kuV55FKtrlhRqBzpasusZboZ2wir1GPUw3K/UnleRSEeB/I+lVIh0Oo2WvIGhQ53exVN
         YYXcnGI7adr9UuUA7R17IuCagB25OOpQV+9GhgW+wP/84MNvFr1X+M0RQvFRSF7qdLqg
         SATa8z2POmyTheagwd+wUgFUUNq2aXm88U5rFCKzFp8GXnB17jQKE84VlggeO7bHn82h
         X5jg==
X-Forwarded-Encrypted: i=1; AFNElJ+U2X8U4inaVk0ymwaHvMbsqbVb2VugEis8IoNpdvl6OqFDE1M5MjHLP8CS6XBlwssrNZOefNzdDx81eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/MZRWsLeTdE/65b7vaGkXIdzdB5MQQmWXHCZ7zb6fnBHsSlNK
	CgNT1PxkgnORv7D4erVbHWW2HanznEpMlM2GzcxP7THVaLXs6AbkJuPKzOW2AUj0HFc=
X-Gm-Gg: AeBDiesXOkeAsfp0ccNf8RRwdFCVhfxVVtQkYjhL30H39/GeAZO5ZmpD7I/rzm1zPiT
	nLXjUZG29G1h+mb0ZE9JG8iUjXzSnsl5f6pIsF+Bglz2JYDVTB7+48lKzMEJuXVBUwL7UUFeKSq
	/MJAI2MaF8vX8GTwB3sz4kqEnvAetu4WgjgJbQikMV0Ixaig6lCncrY2McXqoG3UQMdFVQ4Mxal
	5J6a/Kn+efbXz2DDm4CFLoCeLf0bjYGt9v1RA31WRTdsEmyZa/5WZHCL3r2JPHlSJRGt3S8W4zQ
	2ih7UyWML6bBxj70lLlrnBkZ4I/vMRhEnLlRO9O5Bi1+GgXgW2SmS8BnPiQhGcTjQ2RGr1y6G24
	Bk33X3Ir1OQJFu7kKkUbmrD0tF1k0yARURuKO3pXfqCbadwP/TlMjnLn+NUWV1DhWZFHcEDV8Us
	5EkGfqu9Hf8YhvGYGJ5cYdcdvVo5RWy48jLfkNUQlRLVTb9HyiWy5+FRGBbK8Rnfy4UybDXPaYT
	ZREgptG
X-Received: by 2002:a05:600c:350d:b0:48a:57e1:d8cc with SMTP id 5b1f17b1804b1-48a83e7055bmr103427505e9.9.1777619728957;
        Fri, 01 May 2026 00:15:28 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:28 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:45 +0200
Subject: [PATCH v3 3/9] dt-bindings: display: msm: document the Milos DPU
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-3-58bfc58c0e13@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=875;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=eqkvnjw06SSJ1hiPbfLlBQP+odbRhP/MaR7qzy/itWM=;
 b=rxEwrApcvMvNoaJkEGaACXpYfW+GvR1w9019BHl9gaSDxAV0SGk6cXAI935/LGMJtkXSV6sb9
 X+aYeFpdrx8BSgEphHNPQRJeb80NpybMurDmMFS7XQl9vQp4fzepGAJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the DPU Display Controller on the Milos Platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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
2.54.0

