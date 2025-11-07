Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD6431D36C
	for <phone-devel@vger.kernel.org>; Fri,  7 Nov 2025 16:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762531736; cv=none; b=B3cJ2xbZXlKcTi3xIv38ujpkA/B964JWM6kzuuIb+oqc9o8X3WgJ+UUEd/l0Jf0ARHZFdYPpLmy5fuArIH1jpsCyQx+BeGHsVEBeTdyqeZMqFRGDJo7uhq7mt8/ctRnAbTEiFcazDT4XPUbXBIRdftFSrJafoETQWQwxxaS73DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762531736; c=relaxed/simple;
	bh=FrKylvjtIbykfg6BNRKjScYknFwVxGFQEfuD+JLYCCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChZirhOHCoDRl6EpAKa/WKeNgH8tXTSYCmr9046e6Sh4ueEw4xU9cQz6JL14xYqETWJRy9yQ0023yyCy94EsJn99pBiL14PCqq4rbWhQEJHMzHp7xWNEBRrWd9TD2rdVS6oaDA7mXUUjuWeCkrL7Q+p6XH4ezARtJ6z7tr1R/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mLw/fGot; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mLw/fGot"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so1641036a12.1
        for <phone-devel@vger.kernel.org>; Fri, 07 Nov 2025 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762531731; x=1763136531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6OFyEM0mwtoBUd6fjbO6FrIz0k/kDLhqnCZDGR6L50=;
        b=mLw/fGotcCQwPOCJGVL+xuq/OAELVkU5YcmAVQmghR2VUtWG9qU9Yesn2UaapGPOUA
         ZstY427FF26r8ErT5jQkcVUAcug9cXJZXM339I6ruD3as7frY7Mv/i/bH9Plmvr50xul
         SQgDvIaaVS0s6LGS/uLY5r/mQBis2Qn0EmCgoNa7tW3enNqyS8opyuIPgfqkEQ739lpO
         tN1YbKYDu0Bx8yPcybmN7ufzJPkz0GpWrSV4B7aLaJTE+QLC3GUkKSenLtxVlgz4IIax
         IUfjKNz905l525j50YXexlLsIe7TSMunug6FVkBUuAxjWjXQSGt1iZl79gWudU6hws+6
         FY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531731; x=1763136531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M6OFyEM0mwtoBUd6fjbO6FrIz0k/kDLhqnCZDGR6L50=;
        b=IkKcr3ign6ECJZiWEduPuQW2VnSovq3YHNMeHKNur1ibE6QTuCkGzZ+zoAHdg6vRHH
         K/vmsb9AwSNPwpEqKQDIwr61xlvqPpMVl8wFp9Ns2NKcXB/+VUcgdsHMLrE+OpO4IFXC
         M9ACgSaRS/+SwCG1Q6AwdFpYOwB+0JpiOuHRQ1Gq1qR7XpQwIv99jpyUJSTS39anHg/Q
         u1ZhJhBLjl24C3GKjD/a9n04fLCIwI9YX+HSDPG8MVj6gAfrRjHzQjkE8rmfBvtto+b3
         dKuT480JJr71dT3MuYMY29CXwW48TBL5UQrbT3NSdHv6beZ9GZF6DxOxtYtXkjSVIw4u
         DhCw==
X-Forwarded-Encrypted: i=1; AJvYcCWk16EyM758PylVbX11OEok0MrFOuWyiHj1grEx6tL/xyiGn+vKFrKUp6ZYA5eBnUCd6Q3UXlk0YssKcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFbL4SXBcmKsi02pRCLL3l0LdQliBJOfKTBSq8/EHxrfFpK7Fb
	J0MAJx7KuvdN/Efvf2tbfYgNc+RXefIW0+qGrnk/ays8Mt3eU4ggoFMbKsN/zPkPBHM=
X-Gm-Gg: ASbGncseFyFKtTtW9HWrJQjcYxvSHAcDyvipfI60qJ+WS742XzqKsTmlkXFUf7pZZyI
	/p97SJj7eT6M/rXqixUFWWJ6NZOYpucz/UNHieIFkyVvLUZmIS4i9b5x+xqdXKrrisq6FNaheZG
	3gouoQ8OBZVG13z2AGIBp6RfqK1jnBaSE2rg/gvGDdm9QExEnLPeW+gg4tQ1JMCN2sHhLEvuKxi
	yUSsO0llOk7MAV8kCkF1a/m4IjPRkcKJhO6TN2Ycr1yo0bI+HsVMYmNfNfnblVjS9mqmGPNxIUG
	6Y/vZey1ReMYYP4Ev5go3qJYd4Z2SryNSKZ3/nOUpJAM3KQ1BB9b0nkVNbtRuHF36z2X68eQbkv
	HnY+2t90eiUn4Pw9ywyFe2b6JrzV0zriisiI3T/nfaZsEJ1HJLj2yvaYaglhLn83VxA4RRsAREK
	H0dfrYNCcCwN/THJc5zl2bFSkNQe9kS16yHmov++U+ZKkRatLSl+9dZUc=
X-Google-Smtp-Source: AGHT+IFc5yHu64pZOVzhmSiW9o358Hhl91qRFBo7frY9TOt1voWJpvXX8q8w1oYhoIzDVymNV/t2pA==
X-Received: by 2002:a05:6402:3513:b0:640:e791:df67 with SMTP id 4fb4d7f45d1cf-6413ef03618mr3463236a12.10.1762531731544;
        Fri, 07 Nov 2025 08:08:51 -0800 (PST)
Received: from [172.16.220.100] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713959sm4444376a12.5.2025.11.07.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:08:51 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 07 Nov 2025 17:08:48 +0100
Subject: [PATCH 2/5] interconnect: qcom: icc-rpmh: Get parent's regmap for
 nested NoCs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-sm6350-icc-qos-v1-2-8275e5fc3f61@fairphone.com>
References: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
In-Reply-To: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762531729; l=1554;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FrKylvjtIbykfg6BNRKjScYknFwVxGFQEfuD+JLYCCg=;
 b=nTRGQyYmySEkpmasdBUmEaPB51ISRGLTYkLSIUcHDR8tbweZYP3kljRlJhHKqSeem9gQeqLRC
 DHVQ5/NTu3BDPGZMEfeU2PpcIDxP74CA8UJEXfBUhruv7IqiClWTtIv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since commit 57eb14779dfd ("interconnect: qcom: icc-rpmh: Support child
NoC device probe") the icc-rpmh driver supports initializing child NoCs,
but those child NoCs also need to be able to get the parent's regmap in
order to enable QoS.

Change the driver to support that and support programming QoS register.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/qcom/icc-rpmh.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index f90c29111f48..2103185a44a5 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -308,7 +308,16 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 		struct resource *res;
 		void __iomem *base;
 
-		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res) {
+			/* Try parent's regmap */
+			qp->regmap = dev_get_regmap(dev->parent, NULL);
+			if (qp->regmap)
+				goto regmap_done;
+			goto skip_qos_config;
+		}
+
+		base = devm_ioremap_resource(dev, res);
 		if (IS_ERR(base))
 			goto skip_qos_config;
 
@@ -318,6 +327,7 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 			goto skip_qos_config;
 		}
 
+regmap_done:
 		qp->num_clks = devm_clk_bulk_get_all(qp->dev, &qp->clks);
 		if (qp->num_clks == -EPROBE_DEFER)
 			return dev_err_probe(dev, qp->num_clks, "Failed to get QoS clocks\n");

-- 
2.51.2

