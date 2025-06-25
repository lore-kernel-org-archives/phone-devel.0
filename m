Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12EE2DFA57
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843397; cv=none; b=fnwGL3x8SSnv3o2i3ywedMn6TVzT/nAUvCzplqsscOiNbUd8EUIBrUdLlwwZg2CkIvZxDqvixHUXGZSZP3QcaqtdAqTwMWsNTSDMabqB3kqzcgmb4PwJKt+WvClGQDJhgNwObxF8cHkhNGYLuX2kYnsO0yy36RScpD2mO8eS/Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843397; c=relaxed/simple;
	bh=uhtUa6TuWWOeZjd4JmW5ZGjrlr6PTEqwVAXpwJZmwlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBmCS49SsYMTEDR0k8kCmqms/O2HNjXNMtBmOPEAsQkawBPdiy1sVhGio26BFPFFkiXJYAz/L7CpyL+BPSsUcLhRKON3N1LohjGdE24w3u0LTNvADCSz7qDG5xaPypQf820O3a6ESsjhprwcvw1tHr413XyJT+CbL2G0P1IgytI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=O6GlR2UV; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="O6GlR2UV"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso145663666b.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843392; x=1751448192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iV2ZnPzTHx850i93QH2RHh5n0N52PnUpwC+aDpzRmE=;
        b=O6GlR2UVKmA+vRZ6sretyLcRkZH8+dnknTASGFtbFQ8CH32Vsxl9tlb17kWfAgHRfx
         wwnq0H/+GRLW7F6Q+4IGOZDQG+bPfDPY0Cj8YqWGCv84Lv8Wfw0+WSIiQO/8lXGh+ZpA
         M2zitDv40gMjsMe/6f1/hwUAwQEQk/c3m6StEJRB5qovZBcybrUanrcnAHjsJW94jL3H
         VUArGdbkMxHnJSsCCmIR1BPZdzGzHBxMz0JuGUfvDwYwdib8EzlmL/zVY7gXi2Q0XkfH
         3EcCJDszdoQhhUTXbJ0yFmxDMdjhagaStygqVmfZVifs4gmFBCPh5N+0zoUPr/VH9DA8
         U5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843392; x=1751448192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iV2ZnPzTHx850i93QH2RHh5n0N52PnUpwC+aDpzRmE=;
        b=HLV2r/Ufnn7KeT3RVtc8M3hcZltmNdanYTgGpngK7HswgCqTBHhp2LFzfIe3k78r8i
         qRPvVJkqlzSRVwu0HFnYozUfOjTynTYUGzNT9R1eJuUUrq79x6YbQuuTaoK2YoEICACT
         l7qJs5zikz/n28YvhESntjSuNZivedIhJ9gY5GpZBAO0QsZd9As9zOAoXomc16IzHCho
         zdFEsnAjKtiTQr6BUuJPa5a0ZnXaAEtrl1BfJgA2pxYDf1FtP8hLDLqy/eb8Irw/vNco
         rgQgcD5D2eLIQ43oKjLkNkBGlVngD8aSjMr92reoH7r99ModdEfWCixveVnPKhrfJwfG
         nMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnu/pMtGJRbmw6nFHTOenbKhGkv/l0HQTLv4qzUGW7XhtCuTX9JHZdbT1va/LLsr/vUAB9mqQlzUPa3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQKGn02PtRv2E53plZqlzNaoERwkFjPbHqskkfibk6SGzkMi9L
	J0qGrFU5KPxtF8AsMR8xX4rXnmC+Pqv7ZrM/i2W9b43CpsDqCDgI8i60VoT4H06FRM0=
X-Gm-Gg: ASbGncv4jbdJSwtkynuIO2l9PG541LoX4zy9S4bJRyxbnVQxhztna58ckVC5PujJ7U5
	fH73dPNQZRGTeWP9l4RRl9ZUalW2R2wVbO1dcfp84LPKmFTmuPx9x5qcOr6DDWOoZFWMjPqXnxs
	iOex5w52EWBZYyG83HmO/J4oYPcnV/cs4VmD5iQWahyJz88qZDb6GjNFKd+zDUCQz96Dw1ra+O/
	pSUAKcja9a/7EwfGo6+T3nyfn6ypCFWsr0Fb7wy/YuyiVVm7SBx/T+fucfeChUTRUuAbmpyQGoK
	qsgcgikZVV9vjkYcJxScb9J9UVWvVF3M10xWxm/F8TJoO70wttj7+c13yZdcXKK7nF30p8tmBIm
	8znfFmGATF0RHZTbZB3zrQij+T1hSpKuk
X-Google-Smtp-Source: AGHT+IE1gc/uvw/ng78i+q8hHmGEhnihasoPg2pJuO7nZfnd78u9Q+SnvB0RXN8h+HquieGEdTPAUQ==
X-Received: by 2002:a17:907:c1c:b0:aca:95eb:12e with SMTP id a640c23a62f3a-ae0c082c6a9mr173270066b.24.1750843392378;
        Wed, 25 Jun 2025 02:23:12 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:22:59 +0200
Subject: [PATCH 04/14] dt-bindings: firmware: qcom,scm: document SM7635 SCM
 Firmware Interface
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-4-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=1077;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=uhtUa6TuWWOeZjd4JmW5ZGjrlr6PTEqwVAXpwJZmwlQ=;
 b=P52I7QLzFA0XxGiWQVSrZWCETXtQVh8QX/bEHmeiiACmOITY5bmcMCEU3Bv0O7QmN53S50sov
 SnkXYx/JOQTDQpqfdQvrqFD3cdiTSWKxRGwqgKDTvPdxi2Nq493mxam
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the SCM Firmware Interface on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 8cdaac8011ba499794ebc5b4291b7983c209821b..6ae7405aac658ed5c3524ffc394d845cd2f42798 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7635
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
@@ -198,6 +199,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,scm-sm7635
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550
                 - qcom,scm-sm8650

-- 
2.50.0

