Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEBD26C394
	for <phone-devel@vger.kernel.org>; Thu,  1 May 2025 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082161; cv=none; b=E+GqRO3ikLNPrkKV5Cj4lOlGBMxr5RCTRR9qlFt0pbs1PAXn1YdVeo7nJftu+ZPp5DRuLoeIii5xGsTQyOToi+m4rAV0VjdVpSg3CU+8YWy3ssCdQYwrmrcOMF2nFSGcUmNGdtTV7ah0uuJuEt/8xJwSwx1Fc0yGuw7xGoHsW2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082161; c=relaxed/simple;
	bh=yM8BRFHXQ57lwyVkMBlhdAM+Q5zCu+0Nhquu24Prusg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1P+FLI8kWBbg7nDcyXIfvNOdvm3Ydj+V5alotW95Lz5DKbArVbUFdCgIOPf+s2o7B2IWMvA6H0+0fnInALpSYZG9AhYAJ8fnRw/wlcHas91mEJAzKs8K04KbNBHwbM7eCqajmErTxs0gfTwcUy9xacgUmn8nAOLFGaP+h6hcwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CMW2KJMM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CMW2KJMM"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb415dd8faso91803066b.2
        for <phone-devel@vger.kernel.org>; Wed, 30 Apr 2025 23:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082155; x=1746686955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=CMW2KJMMrweV8lOLH01MdcylBZl567fZVfFgVZiZPgLCXdd3SX5U6KWazDHw4sTq5c
         H9QxLnBiw1qYhvlPJ1iZA1jOn3/U/dBn4vH9Q3OhFru/tT16ps8ZLFyinHvqdsH9TyXD
         0PZVxBp34LO3SDL3BPduAqNd3cDwZ827gdtU1eS8JdQV1vStBfqIsGX3W1hI88kmWSXF
         TPyKVD5DDmMuQ5YH2787LDmiZDmbPDSYEyyqkav5D80D1v+W8X5g8cNMqf6VJpVlhacO
         WEWrHbvuvK8IPfrEpHqK6OFcsH4Q4MOmm+qC/D6ND/jJRkLkVIWQCzE8aVNLTWfTQ5DR
         yGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082155; x=1746686955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=fZ6geyGvpGc4LF7FkZxGluEJAP+pS7NEyiSj1T2zC4ENdHHBgdN/QbhHnCk2Iot55m
         SwkMcLVo5TPDJl+iX06XYpLXFNFcn990zRxMqB1XSqUB3IOppfha6XeNvBzTxYvlEY+9
         l5uzn6tEbyF58FzGGhcBYwK97u30Jk2PpZmf0iWJYMak20QIa0p2XnIdEcIthgTMnmmv
         o25RMRxKejqr+JSIybNAhZqxjgWuMIta5hLMuYcYhMzPJBYoowTwplvJt9Kb4qh7YfPi
         dGgo/HqeMopT/C0n/z/g/1UboJ/AiumroKy/xQ3RJ3WksbDwJtM4WT2hTVJrcI1nQN1Z
         JBgA==
X-Forwarded-Encrypted: i=1; AJvYcCWjTMho2VJSolsQqfGHmffxl/RvdZ2C2wr7vQ8La0nkJn3YpL5izIyVdAdTedWAkTghPmWc8ocEKJl8Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlCxYbgmGEVOFOOWZmzKQeNAerPxAgMRanlEpVmCGz4a2uKMN3
	w1m11ZgwuzUdL5rS7EPexw0CP8DO+7gw5VtJbb6mj7LvatSzzzYAB0XMwMEQGQY=
X-Gm-Gg: ASbGncsok3qRSrwjgNs6b7SkCvVAgJcrdG6lWcT0huSl07KoBJFHFvCJZEg7UlwMZOi
	xPJ/8PzQJCO5mwa8VaO3pDkn2/Wmb2bgWYPbaSIGGNGEnCu8ZqExvIRFTkz27gyB03ZaCejMXha
	mK+RDrJ7//HLX7AYCImF+XSj5z3b3Xn3as4eAwyTwDexsOrTJ2DXeiggO6oPZW4y/cejQGi1wE9
	4Yo9ZimYjcZXRy2NjIrq7hW6xd7h4svCpiahY7DdoMtqBcETr5kgQhdYDZE1kBDeXn7AYAbl7qU
	rsN1Q6HwxEUa8V5SReNC4FWtkYo3zZNeNoBZTFI4MxdZnOBTs7k1nFqYLwHbTd8RHHFlJmvs900
	94xY=
X-Google-Smtp-Source: AGHT+IEzySfUrfmZ2ok73P0GUsMuvaw7yUrPtZVotDDbR6BQlXgasH9wezf9EguddjotsVyoCoHkOQ==
X-Received: by 2002:a17:907:96a0:b0:ac7:eece:17d6 with SMTP id a640c23a62f3a-acefbb1747amr137034566b.17.1746082154701;
        Wed, 30 Apr 2025 23:49:14 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:47 +0200
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,q6afe: Document q6usb
 subnode
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-1-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the subnode for Q6USB, used for USB audio offloading.

Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
index 297aa362aa54ab41a956b3ceda73d4c7027d72a7..268f7073d7972da2ef46d36264c0f7d8f648071b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
@@ -29,6 +29,12 @@ properties:
     unevaluatedProperties: false
     description: Qualcomm DSP audio ports
 
+  usbd:
+    type: object
+    $ref: /schemas/sound/qcom,q6usb.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP USB audio ports
+
 required:
   - compatible
   - dais
@@ -64,5 +70,12 @@ examples:
                     qcom,sd-lines = <0 1 2 3>;
                 };
             };
+
+            usbd {
+                compatible = "qcom,q6usb";
+                #sound-dai-cells = <1>;
+                iommus = <&apps_smmu 0x180f 0x0>;
+                qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+            };
         };
     };

-- 
2.49.0

