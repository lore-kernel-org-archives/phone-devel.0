Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5693002C4
	for <phone-devel@vger.kernel.org>; Fri,  5 Sep 2025 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068866; cv=none; b=Up+liNCSo6aR8H+DWHj4Y9Qr9Fvh4RtXlH1YmidQeVLlppYpl8LXenmsr91s/ZWERI8XyuHyINE1blT9P4cKzEICLwjHS1wD7LyzBJiRvK7maKkH8pdY8Nu2Z7BXo2HE0WfLlZRAnCHxq/vIpTZAR6LTDBl66IG6Qvrp8qGCMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068866; c=relaxed/simple;
	bh=UimigBuUtMxs7F8gG6umklkndUZUFsafBa5o33+qqu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkS/PM0AkjZfyLmjpfA/ueUKk+btC9DMyZL9Lp1mb7rv7mGPWkWeimDCzdePneqpIJ6HhZdfeM+vxcp8JHATaBWP+ZyIym0wWH5OyZfamNlCjoEYA3SqhoPKYTKe6yTNxg0jB6nphucxZ1s7RS8BDpPSs0ryZLak+VyGz5SRl1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZcwfmPxg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZcwfmPxg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3df3be0e098so1078441f8f.1
        for <phone-devel@vger.kernel.org>; Fri, 05 Sep 2025 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757068862; x=1757673662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4h7YaMzyJCzszrOQdboJaFyzXH8sFl3aopVTcpiY4P0=;
        b=ZcwfmPxg1kS7c4snlPFJGd3LpftrF0U4jOpMYyjkvXjXUhoB7GO4x7mwEedpHIGaac
         FcjWCBH80WKu9FwZ+ucf4GqwMtp5K++vVKguT8RLEaE5lrcY02Xmq/Bh7eS6yUM2t4Vc
         8aI+x+wV+lQZr8Nh1JBC60cITCIdfri5tpxAncb8erHY0IrYQAM33WlTwd9GzZPU4LPJ
         oM/n+gmfXBQNn/+7lOPnrvXOuU/a9ynpC8ZHeXOAD+HS5PMiLr9X0bVa+K+U/jCrBd2r
         Gh0j+uZCPbHi0gPt2zOuFVFPfECUufWbLy6lDfshjqzeUMlZLQu37VW7yUA4KC9AD4du
         MEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068862; x=1757673662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4h7YaMzyJCzszrOQdboJaFyzXH8sFl3aopVTcpiY4P0=;
        b=UIk4L0DjRn+LXuDR1WbQg63N2rsi26a5U18e9VvVS6VUz3nvLJK/dEgrAbYlXk/c5P
         eLhHvi6K6+ugkPQQX1D+qShEZjBvLsVESAI4tkE8618rs+DQBXg5yCPnXqYmmavQnxOL
         P335bWaCdOgJVe+bgGQ1BD3IVsUTYQYdSyoRf8gpBULiozlqEYH0+9eFWTFT3+BRFli0
         qsruPG2OHzZNxoJueTob8bEcN+CdUZpKFG1XE4Ipe9Bh8qG5c1aN0k1G/CaKg84xV0pb
         sPGrVUsG+VAP7/CSdNZjSPjl1YMIsia1HMBeKMRi2dbgUI5D2Yl4FF+fU4A7lmweL/fZ
         UpJg==
X-Forwarded-Encrypted: i=1; AJvYcCVHegsL6FB6GTKKkFrF2ONgIMdUt5uMPXzLVl/XVYpjsRPNuxDae31aOoBoUjPil8zCdmDpNjCxaddXug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeVs5gZH2n6Tw5Cjhyb2C8G1km7ZB/I9MPAkF9mpgtFIRYzHHS
	La4Jon0sJ021dfaH7FB2wn9hLcqdvfJb8vNL0YQIVs8aAqpxyEAFqfguqj2XE63IlhM=
X-Gm-Gg: ASbGncvs6ubt6RQ122p4q2tqexkOA+t9GraxmMCBfe583JZ3z3i6IXIBmHQx/iKiQ1M
	2LeneHjrk9rr3DhuwUB0D57zTuxyh7VAEJCHmjLnI6j6NtQPcAFA4emVpYDWNq4pX3dLztjpO/a
	1/6T3t0uCryYvSr9Gypds3pXYM16UkxOitnmF6uYG+wf+Z/Es74P0nlevtqW2jQY/i4/AyAQ05q
	egfJlQtFS9rJjBI7MFJgz/JYNyWkxXepRVwzkkJcYFhWgc0ArAgxvSdePjueueguBAZYQho3tZ6
	f7kEOazIJZ4TEHv/4k5mI/zKrduBAMdRZ4oEnSiB+Kn5ZIkIW7RYmPb3vVJwp2AoipMXuRpCWNt
	CBZVVM8ICkBnOLpFcFF0oVZeT8aLqduJ29+W6aaATebxfLtTqBdxUeocIAek7XfeVFH0G3xE7xr
	yCMyiN3ECHstGOpzRq7rl/h49GhyPhLg==
X-Google-Smtp-Source: AGHT+IGtbARUvUaTJ4NIeSDeweSSytYiW6yHSoPrHxfTOVtady6hveXqNdHAZNNKJxa9x3TrxVsf3A==
X-Received: by 2002:a05:6000:24c7:b0:3e0:152a:87b6 with SMTP id ffacd0b85a97d-3e0152a8a00mr6371616f8f.25.1757068862097;
        Fri, 05 Sep 2025 03:41:02 -0700 (PDT)
Received: from [172.18.170.139] (ip-185-104-138-158.ptr.icomera.net. [185.104.138.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm20990738f8f.3.2025.09.05.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:41:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Sep 2025 12:40:32 +0200
Subject: [PATCH v3 1/7] dt-bindings: cpufreq: qcom-hw: document Milos
 CPUFREQ Hardware
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-sm7635-fp6-initial-v3-1-0117c2eff1b7@fairphone.com>
References: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
In-Reply-To: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757068857; l=1212;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=UimigBuUtMxs7F8gG6umklkndUZUFsafBa5o33+qqu4=;
 b=DY1pFCOuq1avbn5t7ZPvcE56wWF7XIf1yrr3163XBBi/yD3M7RGi5JrUxggImZlz8IomMu7gf
 B9cbK5HaeebCOw3btr4WhZILE7SRIK7H7piwrfjlehWfycKYwf+7HoW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the CPUFREQ Hardware on the Milos SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 2d42fc3d8ef811368c990977173f41b26535e0c8..22eeaef14f557d615b06ec13e71daf86018fcdc9 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -35,6 +35,7 @@ properties:
       - description: v2 of CPUFREQ HW (EPSS)
         items:
           - enum:
+              - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,qdu1000-cpufreq-epss
               - qcom,sa8255p-cpufreq-epss
@@ -169,6 +170,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,sc7280-cpufreq-epss
               - qcom,sm8250-cpufreq-epss

-- 
2.51.0

