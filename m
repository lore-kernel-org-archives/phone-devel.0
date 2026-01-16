Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600A072612
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569453; cv=none; b=UmSX4Nu0jD35HIAqYOsUI1M5Jb4L2InsyCCigjkG5va6QsXEx2IHqRgqJyfQO5WCTvSTwuu+CIntAgaCvCF8IXiv3vAOsO/9cqbbZqAqVkhdepV7q/kGtlJzxJqgeFVCBCou+1B8tY3rtTeTLLjLeWyvCm1QYBbC8lEqLBOvJGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569453; c=relaxed/simple;
	bh=FtewN/DrAXamJnpTOxO78vEZuuizOqYgKqBWZjIni9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PadTQ499LJhcl2XvKv4ZfBm4618iRxBCipf/JHXAv4nzp5PNJUIe7GKUxpPIqRzk1LT5VROeHu2VS4at4lSU7p5KsxAFpbkqlRsAAG4xjMzptijMkRLcDZTtIm284kN0zIX/2Ifzt8L9+q1DvvePG8itJkP76T+0ZzHa5Shp1yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PSk9iGsS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PSk9iGsS"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7ffbf4284dso267202466b.3
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 05:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569447; x=1769174247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhlx5emzP9b47xqsIY5Q/RFPv9dsLYm4piEORREEnEQ=;
        b=PSk9iGsSsoRYyIcH214x8CNhaxDDF5n7uNI8Oofzbnq6Z1cm56lwWaqKq0LRZ+TaUn
         NjSZlk8VKEbSgnurKKOJ+pb8V5teIucsK2skJUvWfRCpNp3eKvNFd0ZvFkzG1cLW/BqE
         NN/Zd6YjKNieePi11OSu4JsAVk0pLFBrC9EAcHDRELw7QkyuAgnJ0W79mCy+aEbCRGRt
         Aotej9GVWxJ3pbE+19Yd5HaiXZmKDlGlzWpNfQjwsEKlNffPZhhIJINh3ZzheMz9DjI1
         G0A8k4gGUL+V77jBdrN5SBTh7uL+FP3DVLNY9I0qyPQkyl4GEoTKTvWqUg1pIUL4fTCf
         gFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569447; x=1769174247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhlx5emzP9b47xqsIY5Q/RFPv9dsLYm4piEORREEnEQ=;
        b=Gj8UXoKo9/jcXAtu5jd37QnaFEOi6Re9/Avbd7qUsxrsXAj38l/2kzJDZmdDfi24cp
         Emndqveca1mfe4HPz3yvm7LZt4V7JoYrPPQXLSUhXTm9d08BSreuR+yPt7Bd9ylioAAS
         2uGtx1GCqmaF7FWwNI0MzuKT4VKdpdcI9POC8wFP7bQeqGyTusFoI11Fy6h7ladqZ2Bt
         UwCl5AhLY4Xwb3BIQcE2eBMyItfeSSlwE9WIwgK+3c/MJ0bALhYttw/jPK3qG/xyuePU
         bO2eFrGFbiJkc2fmbeUJaaefXjwqB6cqaz/2IMVxVKn9rxdEHmYnls5a2BMw9J00JU/d
         lWBg==
X-Forwarded-Encrypted: i=1; AJvYcCXlnnoAIMQG5+yoCfLkkSj8hYfhEXdWUO5BBMRGiJXwD0V4iEARAO4m3dJy2VUWnJROBNZ7XtzD05zmTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjXDGx605CVhBUIBfHDUR6dFOnQNvU6PV7ADeWWYbwzPZqt50b
	6+DNXa/K1JNCsvztzpuzQfepz1egIe0VWE4q8Z2Pv6C+dAosiW131c2VW5A6jUOX8SjYoSzXDKS
	cV5+K
X-Gm-Gg: AY/fxX6MibmdCCi0WpIl42Tutz70dXHfJtxX1akPwQOnRfEUHe5rS5MsTI7pjF2E8DV
	02Uu0ugymtWLZKR1iAl2RvOcs+UrSfzymhO+KmfW5BJ1KLCBkijRx31ous/+VQapfUJiR421NrW
	laEV/7iywZY+6pZD8u7wCYMVaCiF+/RyJyvvUrT+BHpRWh3+DgTJiXbbK6+IgfTQmJ6BVUgU8t7
	RN1rk3+Q9X2ODHulXl6iPYd0IWSWmpRo5DhWmGwsmWokd5xkmzkM+iUPTz4jQiRbxgZ0IS8iCkT
	n3HFlVaesDV5XPn9yd5Ks2+COD6hbzQ4P0n93cuKeaMs5SF/OQdDB+BfRqqFFwr9UU5PVE81gfv
	2bfM1YCl9A6wR0MFSKwPvM2dqX0cesBGxMiGWCbcqvp1r8n5dxonzGNKWjRQNvSMtlcSr+27zWL
	4DvwBJ2YUvcxEn6/YmhfsJfAZxT1fspYr/DBTDuLuvCU0cazk795neujg6SbpUS0/xihZeYo6w8
	p0=
X-Received: by 2002:a17:907:702:b0:b87:2cf8:f7b2 with SMTP id a640c23a62f3a-b879324c7c0mr293012266b.56.1768569446608;
        Fri, 16 Jan 2026 05:17:26 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:22 +0100
Subject: [PATCH 3/5] clk: qcom: gdsc: Support enabling interconnect path
 for power domain
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-3-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=2630;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FtewN/DrAXamJnpTOxO78vEZuuizOqYgKqBWZjIni9M=;
 b=x4GXwqWuo6jrdq33GBtT6tJ+qKr74k1xcIHAngz8zsb5pzHU3zqpcBtB/3sXgYHAwKBDQUV4/
 MCX7Lg5LzliARKzTzK8Eg1nE2qFKjmTiYZqAzcdsWWTMObC+Om+nhzP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On newer SoCs like Milos the CAMSS_TOP_GDSC power domains requires the
enablement of the multimedia NoC, otherwise the GDSC will be stuck on
'off'.

Add support for getting an interconnect path as specified in the SoC
clock driver, and enabling/disabling that interconnect path when the
GDSC is being enabled/disabled.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
icc_enable()/icc_disable() seems like a nice API but doesn't work
without setting the bandwidth first, so it's not very useful for this
driver, at least I couldn't figure out how to use it correctly.
---
 drivers/clk/qcom/gdsc.c | 19 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 7deabf8400cf..ff1acaa3e008 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/interconnect.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -261,6 +262,8 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
+	icc_set_bw(sc->icc_path, 1, 1);
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_deassert_reset(sc);
 
@@ -360,6 +363,8 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	if (sc->flags & CLAMP_IO)
 		gdsc_assert_clamp_io(sc);
 
+	icc_set_bw(sc->icc_path, 0, 0);
+
 	return 0;
 }
 
@@ -574,6 +579,20 @@ int gdsc_register(struct gdsc_desc *desc,
 	if (!data->domains)
 		return -ENOMEM;
 
+	for (i = 0; i < num; i++) {
+		if (!scs[i] || !scs[i]->needs_icc)
+			continue;
+
+		scs[i]->icc_path = devm_of_icc_get_by_index(dev, scs[i]->icc_path_index);
+		if (IS_ERR(scs[i]->icc_path)) {
+			ret = PTR_ERR(scs[i]->icc_path);
+			if (ret != -ENODEV)
+				return ret;
+
+			scs[i]->icc_path = NULL;
+		}
+	}
+
 	for (i = 0; i < num; i++) {
 		if (!scs[i] || !scs[i]->supply)
 			continue;
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index dd843e86c05b..92ff6bcce7b1 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/pm_domain.h>
 
+struct icc_path;
 struct regmap;
 struct regulator;
 struct reset_controller_dev;
@@ -74,6 +75,10 @@ struct gdsc {
 
 	const char 			*supply;
 	struct regulator		*rsupply;
+
+	bool				needs_icc;
+	unsigned int			icc_path_index;
+	struct icc_path			*icc_path;
 };
 
 struct gdsc_desc {

-- 
2.52.0

