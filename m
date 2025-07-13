Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2B71F3BAC
	for <phone-devel@vger.kernel.org>; Sun, 13 Jul 2025 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752394014; cv=none; b=ejliYvk0IJLhazwySosTpPcuRxsVJLXuqGVsDXFPY/Fhb0KfBF0HbC/xyxc0ykbGwC2KIKDAJrVyZKywPb4VdfFRdiiRQevRVYbNg0DxhkRawrmXLqVqdI0Uswqg8hRgXsUMbaEXQEDRvk/lFB8IGWcm0YqZAsjxbZIRLngoOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752394014; c=relaxed/simple;
	bh=Elfy6tnJleoo2wYkconqwz9MsTMigTuOtLwwGmq+1oU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ErQn2CnI73rvh6Ty8ytSRhhNQytE8xsLlGmySgbSJ27tNG+XY0B1OVrCiJ1eJFzNpIXET6RXbVZi4H1nhg6JSg8uhDZkGYeYUUcSFtgNSZ1Y2IwCao29N78nBoB6eUisi4VY/+lNFZ2ZGQcuuW7vvNpxTNWb+53Uo8TJk4FnCCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=N3gZsHt7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="N3gZsHt7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-456108bf94bso2899735e9.0
        for <phone-devel@vger.kernel.org>; Sun, 13 Jul 2025 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394011; x=1752998811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAW08S+Y4FxJpq/IdHakejhpfXSII54ErAoQ1lsTS5c=;
        b=N3gZsHt7V9hqmIcHZvDcCJdstid1626nMHcQ5wB9717CeCe3HvPTccBSZP+AeI8Z6u
         4ckINECSedmZCm3I+QThA3zguJU89ahIuhFVrdNzTvKtB1ciD23FHH2fWnj/Nn/I/o+4
         7U8Ed3O2+r88qjlrjjztgwbHEp+nnQY1HUx3lV4bJskQb+exKJ8sbNER8c6QOhygejI8
         RN2Oe5c4zp1aBxPUnHjXbCO5EwdYOsW5erhABSU9V2fa6DLCtZdFCeEP/SXX8rbnVSKg
         PeHE5yHL1zKEiUXM+Ai5uE3oEPbujXEDpL/1Ihb+DhtjqAsnCO2P6v3oiImVLj+LqC3c
         z61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394011; x=1752998811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAW08S+Y4FxJpq/IdHakejhpfXSII54ErAoQ1lsTS5c=;
        b=FYByuljXJhwB40aZyccQ1/n5y1IgIJOPcB7oiKf5fl3rQ1/lSTrQmCIQ0MXBEr++my
         6mcsnLRZdnnXVRVnyHyokKgIxxBUfc+PrqEsyw5cZX6jx63l5XkqY6OcZ1N+rwKdjQVV
         8/gqVlIo+k4Iqw5WS1VEH2PmfQLOT8vuVSrrvNzZJWVx/lmPd/912eu6wcGsQ0cqkGrR
         Z/I8b931uhXvkg13NL3PC9eIYwTZB1ngD1PO3ft/YRPexSd6NMfARao6JBV6+4DhoQY2
         7+11MX6wEPgNDW1+cSgusw+tjmUNc5nbu3Enl+Wk/nyo6fCdN+mI87PDflhFUqyr39kn
         EIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl040JT6GSxOUVJ5/pZf6qV2GdGB9iY6bvOYvNWGJFyuJNR9nfCvNS/wWrTQyflM2XcUXFydIWoDO2Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Kl10jQOdZSFtFIEU38sWLgv9sD3KZnAPnbDBi8LMzoVeeYjn
	auU5Vyw9vZgih8dV3IKCBEBdCup9sC+LjnJWDRpaJtsDqWTc62prz4xIOR1qV7+YDfs=
X-Gm-Gg: ASbGncvVO1/DZT4KCGnDkI6nZYavtecUMHwXrr/NsLW16XGIfrKsOYQoxKkMJwVhE7/
	y/eNkGHH22VoMWAl3HGdbVGv8ZtvKXdky49fR46DJ29wn1DbYQCJ3f5pbjR0qPBO8TO1kuaJKJq
	9hxVRWr9cjVdUJ9qhQpSi5on1eTrYgef+tdL7Xa3PuIsOwW9VlskDUgkupfq4bVO7AuKcVTAcPy
	B2h9QQ5N1RCY2S2B18QXh/1HDAbUlZRh/2KxecZo0fG+kaDt7x22Yxzjerv31eTV0rYoJE6ks4j
	o6QGRNmMYlMCWU8nizXHE5ZTkK1JTpiYNIXC9RimgPdxWeVuUY35I+LrvoqcUIT+r32WewwtQYF
	g73QZYktvCOpLH3W+woNPvEzdsOoJyicL98Lr
X-Google-Smtp-Source: AGHT+IFzbSLLoq4xPNfOGVd8sTIPd/t0yDUx4KghGsVDwxM4zXUXdUnMHorpLtbhoNnu0OiVsDGzYw==
X-Received: by 2002:a05:600c:3512:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-454f425a934mr75835865e9.33.1752394010817;
        Sun, 13 Jul 2025 01:06:50 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:06:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:28 +0200
Subject: [PATCH v2 06/15] dt-bindings: mailbox: qcom-ipcc: document the
 Milos Inter-Processor Communication Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-6-e8f9a789505b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=806;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Elfy6tnJleoo2wYkconqwz9MsTMigTuOtLwwGmq+1oU=;
 b=T2sEIpk5VLO06Z/e33bFZTdbkdzXowfc67kVkvG9wOw56FtIAb0kMpA2M7/tW/buZQMtHaZQQ
 Pon1YBhAc/uBXmxbSDoNOEBzgAwqhggF7KCZYb3eZ+GNZX+lwv3/qKq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Inter-Processor Communication Controller on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index f69c0ec5d19d3dd726a42d86f8a77433267fdf28..e5c423130db67109355d7da3e51e1eeb008dee84 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,milos-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc
           - qcom,sa8255p-ipcc

-- 
2.50.1

