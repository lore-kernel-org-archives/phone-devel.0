Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A4C1F91C5
	for <phone-devel@vger.kernel.org>; Sun, 13 Jul 2025 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752394050; cv=none; b=pffqJXq9cxXYRivC/plR2Esz73M1qEKwflTGLis42ji5MN4rMeNcCERk89JJOzIh8xZS6cvSqCzjYVZSAxQncw1DfdnK61H0KzF00bphEW9lYu7z+/u8p0vzf18xszi73S84u9bwp1DvWmnV2w2IOVKi1e9aw843UyfaJflLQlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752394050; c=relaxed/simple;
	bh=cmEjmUIEwJdszNuha6SGlHW2o0fXW5xz6+LSWPvZsgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACe+/CE/uMifExm5rtxlpL/NjTDNazlnmsOVGmS+vDPssMH5banAxs576RZSeaG8e6GMp2BfcT5RdY46WKNoik3VZ3zB5feULzVMqLH1OmBxtNN7odssPxd2pHyWtpS0tXITylN01V+kP6gtd52kgBCxKMrLMEsxT9sxeIsYMXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rhCmBe63; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rhCmBe63"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45610582d07so3280065e9.0
        for <phone-devel@vger.kernel.org>; Sun, 13 Jul 2025 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394046; x=1752998846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAOuh0e5PjdM5Thiks9XcjQnZt1mrG00zqw/b7U8tlE=;
        b=rhCmBe63rQcKHBXGf5EHrUzC/Dzyy9df2hTQQco/McWi33I6jERrxoswYpCVq2pMTC
         ioz623171BTrfBfPuxeDTQ4qfIaJdwe4lsh9T3T8rmCQABJNUXM3h4bKudmxtnUNDgpO
         ndepDwaMbhlRVJ3HuGgYVhkv2a9qjK6AlTyayqWKELm9gL+Yc2jI+9K4VuEZesA06kIy
         wtKhOFDARDhqQeRqWcq1QTBiwYrDM4bGd7RAfNUIvPKMg9jEc+IvNuQGsvDx4tZmSYA8
         olHDRBckQIXEE8VOzPFrg/jYLWJgIRNERXYePXJfRdocIWgm02CD66ZYZzyBEbDOFZNG
         5ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394046; x=1752998846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAOuh0e5PjdM5Thiks9XcjQnZt1mrG00zqw/b7U8tlE=;
        b=sRrkwi66r46qI7sxxDFX4us4kXwOZyRXWJOzG3kHG4v/eK5dt3WDtPCQ/ZVeXcYZB6
         zJ0A9+1nr6/QHx3vGW1oTvWAfVJdkOGVkEpM6xKGgzbblP33c1VsemXxe/4XsiGOS34a
         RZcXQsx9a+phId58GELRhP964UHpPEfVwoNE4rWvn1ulXGGGRpLttEZ/nbycyptLny6x
         FiwrdocA0pZCj3DpI9tnzo1Pap4LraQpDW6yPwbSiH0Op/mCcUqogF3dYwDdN3Lebo2C
         iniUJ35IBnKf+yTT+br58O2+IbmYW5xd4c1Bs6VVRnrep8sQ05Tj9t7TsA0nCFEQZOnN
         4QjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYLy9HAvcGhcPWrI+szJCV7loPLzJO9OhrSB8QB4gDGulZpICRPR1RL9njFWaZmsTBBAvbWorVIzPEjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwctAXcLwFUcAG7OhJSYyyTKjcPrMfoFMvkbeK2ZU06LiSjoxiC
	ddZePSe3+2DDRNVZdxIeocdf0aiz3j4IoTXe6mE8KzsyTPh0Ezqk0Uy+50CxeU9dQAs=
X-Gm-Gg: ASbGncvSderY+h22qnXTrzqOzwtiYrMVxxHJ6CaS1a48Qmh67PB3Wa0Z43uNCsgX7KJ
	Bk+RuE6kTTXN5eux0E3hGFQyM1SnZiHZeBPjRCwSrJmF6EfkDGXGVduEgUCB/AO+sq7M2pzN8Cd
	qbRdG0OYSwrctITG42cSeeXigEDMAi3khbrgPgHah3HDuDkf37vB+QS+RO/2tuUl6uNVh8bdN5X
	zSqIhhUS4h9DZ9ZczRkuInPPAVaXCxfTNXbw/g7w4ZQrv1kISg/CqBp2s+VvXJlSkYYyzYswk/y
	W0bWeD8+OwEHV0OpOxKN87nE88FxpP2gK2W3oKmLNBRbEvGD1hzzr2nTaHswb1tqg0jBCbcflmp
	+QYt6jGxqqsUuEbg2Z2ZpRl70DO3D8/QkF/uw
X-Google-Smtp-Source: AGHT+IHNat+zEG/luHBNIINd5V8v6XlcBVNxebQV2Q9VeRLv4kxzRp8ULT+stMytttEuuhYWEbWuVw==
X-Received: by 2002:a05:6000:2086:b0:3a5:67d5:a400 with SMTP id ffacd0b85a97d-3b5f18b3eaemr8361545f8f.33.1752394046075;
        Sun, 13 Jul 2025 01:07:26 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:07:25 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:31 +0200
Subject: [PATCH v2 09/15] dt-bindings: dma: qcom,gpi: document the Milos
 GPI DMA Engine
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-9-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=809;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cmEjmUIEwJdszNuha6SGlHW2o0fXW5xz6+LSWPvZsgg=;
 b=PdARDzzFMZy7Ut6DdJtISA7htSoj0AT2jFnSpJ6mCPR7xKdPfXUdr9NJCuHBaBjbgQNs+Hcav
 9Qi/8P7T+qNBz/thYmFy0Bn74Jp3O9N12GTa6rI4xDYY/rk8g6EpebR
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the GPI DMA Engine on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 7052468b15c87430bb98fd10bc972cbe6307a866..1655f21a4f64c588851c48381a18965c946e2df0 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm6350-gpi-dma
       - items:
           - enum:
+              - qcom,milos-gpi-dma
               - qcom,qcm2290-gpi-dma
               - qcom,qcs8300-gpi-dma
               - qcom,qdu1000-gpi-dma

-- 
2.50.1

