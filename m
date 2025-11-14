Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4344E307AD2
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763112680; cv=none; b=PxG4Bfvs5zmSRyo+C7XNpjYZkeTmbaT6yBWC1h+JQrMazMWUyD6qgVR9QoUrmqCROfVsctAVVZuw7h53i5vGB00XJMrgT6ojiWgDT9NOc48JtWB1GFrmHvfHcQl3IJCBCIVJ0Zoz9Geej4mT0zeKO+IzKe/hDZK7lfGyml88CDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763112680; c=relaxed/simple;
	bh=EXmlrAx8G+qEQXvn4Hjc2SxpukaT9VckUvipBtJ1isk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R3/BtaJkc99BUnO0EuxdXWW2dOHig1QZRuI7ae+X9ApdKA9hU6fCrizr05kuNrBumuQ/VfhKiuiaOwS12ILvqK5sM1CxVYpyCeZUcdrJId+/O/hTMijJnsJfStzL39xMCv7tN6aYufCYYeJ0VeqQq+L5nqK0B68jj5e2fYWHmio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SvnjwB+r; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SvnjwB+r"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b472842981fso220399266b.1
        for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 01:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763112675; x=1763717475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjagkFHTl3ZcyROBN79dvzdfXtI/biV++zkJ6Wi3X80=;
        b=SvnjwB+rXaGh+yKxRpV4Mq1iY2MfxvdkgTRY7HMO4N2sMRGSjMIizbgVW5FG66svhc
         +bNZU6S5TJZgeAS8tXsAC5KwFpPjDUP+vtIebpHUU56LSDWkTOToxpkK+x4+jNo/vFHs
         lMdatv88qutTVM+Em51R+agNv4mjk5nUPKOXPhNAU/OKU/iZ3ztidejN2Ugig53q/6pn
         9GpUlyJnrIW5pH+DiIWhLBFe7TS8kNhrHTl+Xa/1jA0CZFqpa+88L3GCir8K2dZtUkru
         jwT7pdS2h8f0qPLj7TeqFopF0l+SIaOmfdKn4NN7OgPsuXwkfQwUfLwgvdm+cWx/3030
         SQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763112675; x=1763717475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bjagkFHTl3ZcyROBN79dvzdfXtI/biV++zkJ6Wi3X80=;
        b=klzLkr1jT/jkwN9F/Rxhcy8pycTwebZJS0ZAZu3fSM6zFYqY1uxoLj51o83RXL6XDY
         +2J6javDwV9fqJpWNsLb+/cAEH2iJi/y5vRslG/k0e3vjkSm56KzaZjlC50xuYjfShef
         IRCnB/r40UCkenPhUjayzI+WG4sWHqyb74kuTpWmfHAQJvfsEPBB17i14vEjolNxtLTL
         /Jn1d33NvC78FEAHBjGzmfQqpoywI3S5+8EijY9GvKDnC1U4cmwwotQmQRv1tSjpmV8s
         jSn6a3msjNdqZMU3/Q9st4/79GIA/pV2N/qQZ/up7Hr6wJTfFpA016SdIWxPYHzY/qTr
         4onw==
X-Forwarded-Encrypted: i=1; AJvYcCWdLGIh14B3HdVd/3C2/IibJfDgKmBpMsd5P3lY6jqz6Wl+Ncr2EOjzvv4gfQyFadzgC85/LpRMjK0OFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv6XesStUxjrAPQbZSJl1dk3eA3bYPNvHEwX8xqzsZWZ1r7vIz
	Lk0DXH46IunmG5+wpFOjFZjyz8uOxebMfFT5kPJ4S79t56xNNfYykZ7cg4ct3NTvqa8=
X-Gm-Gg: ASbGncuNZXOJ9ADKEAZ78tZdergBO/E1mn8dNhqHL03S9GlPhN9Ve4oXctUJl7tpX1X
	VOAhtJ7CINyh0SVwWbqh1fykEO9+u/qaHVzId2B+jNB/Dz+7wg3GG4FeDZs0z7kaMVHUvJLYcK5
	pdWZgDNQm10zZEiSgidNTlwJFy1+5KqeIopVyJD1bQGxZvBSlMAWnzb78yb2MsxN3BXrY3ZWgMq
	wVrM4hO61QmUMbRGK+L328l8fZGOQE4W/dq+1AF2xauaF0R8kmeRqU0iLqWl29+lRZqvDDBGT7y
	nBM985CM8NUUfRgVtiGwpR5b/F9YeNfk8wpjZ03KIVIUOjaTEw/IXtYNgfC7m2bGelv9X0g2sZf
	3N8E3XP1bMH6S3hhnA80gf2oUdRSsQxMxL66ygHhooab1JNJOzGhPfeNDVQBUdI7GViVCIzoG6V
	KzqePcr/PBywXg+pfiQ8K+9tnu/lHGpNTCImqXr5AShw25ncx1PpXQVVpVyYfx9xV8nOXe7CiZ6
	DGl7BxF42hSmF2ZbnqUzpI=
X-Google-Smtp-Source: AGHT+IF93Hcmy+2QpI1Usg+qVaNay64indlpTI/ams9EhdWoqHHpowSpmlonp+hK3sYc2L//Ct4xhQ==
X-Received: by 2002:a17:906:c10b:b0:b3b:5fe6:577a with SMTP id a640c23a62f3a-b73677ece6fmr210520666b.8.1763112675373;
        Fri, 14 Nov 2025 01:31:15 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80841sm352104366b.41.2025.11.14.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:31:14 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Nov 2025 10:31:10 +0100
Subject: [PATCH v2 2/5] interconnect: qcom: icc-rpmh: Get parent's regmap
 for nested NoCs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-sm6350-icc-qos-v2-2-6af348cb9c69@fairphone.com>
References: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
In-Reply-To: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763112672; l=1698;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=EXmlrAx8G+qEQXvn4Hjc2SxpukaT9VckUvipBtJ1isk=;
 b=Yz/vL8tGTL2oSQMgT7z1ixGoz4iaaPuz42Yx+czSB0njpQPU2HdbrCP2DQwyMtej+3iMSF5Ge
 J7XNWTAR7w2D7rA4AS/afTP/WyeDvLj4F4qaBNh9dKkKfnpqudsWjw9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since commit 57eb14779dfd ("interconnect: qcom: icc-rpmh: Support child
NoC device probe") the icc-rpmh driver supports initializing child NoCs,
but those child NoCs also need to be able to get the parent's regmap in
order to enable QoS.

Change the driver to support that and support programming QoS register.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/qcom/icc-rpmh.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index f90c29111f48..3b445acefece 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -308,14 +308,19 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 		struct resource *res;
 		void __iomem *base;
 
-		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-		if (IS_ERR(base))
-			goto skip_qos_config;
+		/* Try parent's regmap first */
+		qp->regmap = dev_get_regmap(dev->parent, NULL);
+		if (!qp->regmap) {
+			base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+			if (IS_ERR(base))
+				goto skip_qos_config;
 
-		qp->regmap = devm_regmap_init_mmio(dev, base, desc->config);
-		if (IS_ERR(qp->regmap)) {
-			dev_info(dev, "Skipping QoS, regmap failed; %ld\n", PTR_ERR(qp->regmap));
-			goto skip_qos_config;
+			qp->regmap = devm_regmap_init_mmio(dev, base, desc->config);
+			if (IS_ERR(qp->regmap)) {
+				dev_info(dev, "Skipping QoS, regmap failed; %ld\n",
+					 PTR_ERR(qp->regmap));
+				goto skip_qos_config;
+			}
 		}
 
 		qp->num_clks = devm_clk_bulk_get_all(qp->dev, &qp->clks);

-- 
2.51.2

