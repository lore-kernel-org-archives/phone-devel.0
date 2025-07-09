Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE3B2E765A
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072930; cv=none; b=ATJLT0ib44ehf+eHqcK1C9bhdpseopELPsNY9nri85E873JcbpFTZ8y//H4m0Ie7Vx+VKxMWVjQiQohlh7ZkXZF72EQ8l2QEwMQzX0nygrLgq9mw+MAzqFJI5NiEEagCSz8lTUdM+HobiI5dhtzuO8vL3lwacBPN8B2GyGhNJ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072930; c=relaxed/simple;
	bh=dqwE+mgZFmDVF9ARQ35sDJJ/X46qouKrH+a/CF0hG4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0VH31sByUKmUxJavJF7Q3SeNn9mR0IiLqDf7lOUTe8KeXJC9NZ078ZT5BB6Awtr862Lh3q8BpT4uksgYqMKXceX6x+qfG2AAs6IGMOhdVP3OsY92n4v8lz9WYV3bON/vkzs3XH6JQbI+zb81HYrFqdBD7PTYoplSEeAD+/9oK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=K6hq+9Qe; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="K6hq+9Qe"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0de1c378fso867077266b.3
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752072927; x=1752677727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MGHNaliWz7mYnqQYod2IP0rY/CEmdQgMImzv7dtE1Q=;
        b=K6hq+9Qew1kDjCw7OO/rcesSqRTVQiTuwJYlCc/wtP8JjuUl/3LUuyokf0O+0b6SF7
         Cm48TyWF8D8Nrt/90fZKn4eHiXSMeeefWDW818nTQHurB6fWZSt19XnZ4gbWWMsyY47a
         uPlYahwqYwfZo6eZrTfRdVkEuddyrUN/5MW5lvZZ4/xAXU2/1b6EdKDZ6K6YRpxsQ7kw
         toTIZFz3I84ZwczdH4XLJgKgg8hnsOVU2zH2f4hwez8vNsQxajLL9FDZduv+NR+OEp9f
         GjduxYhcFdEjs20vuWg2nEZz9xIT0XpdhZGlXO99YGdD6RCLNZhdGOSDI399j71lnUsO
         xxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072927; x=1752677727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MGHNaliWz7mYnqQYod2IP0rY/CEmdQgMImzv7dtE1Q=;
        b=OSCYzaB5adEb2SffYGFEEMXZPmGNY2AbVyypPSSzfPCcndUusf052y02cMPweYEE3p
         BaP0WaSXUIE6SjXUHSFNvE3p58amQi2h+mtRazOozwqSLM+ZASiQOe1z4M+dJrCpIlmE
         mrUUNIRFEkPOYgP3PpYmHN3pJPwhG9IivdriPUG+rr1ediMdxrN2/tG19y5Hi38aEcvX
         JsUWiBufwXUNj0o0kpATptLdHlSOYfF67NzmCTzGw7CJcfZPRdl4SdSocoNLYQS1yQS8
         ln+s5tpAXHDHvqEXjlHZEMLm19Du85wfzCIBwqHHfvdEeYyWF2qEtcEiw2Sudv1JMd16
         gdDg==
X-Forwarded-Encrypted: i=1; AJvYcCWjna8jScsmQJX+t/Xf0LAdrRXcIzVJZHnTNHHaZLfDbMviLlNsNoYRIoyx4Xija+d0swmT4eJUCNSvTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt1o8Vk50DyzGlWEF7wZMADL2e4x/8X8L0ZmCHT+1zROaYe89e
	OfUtjpU+p1EsR7vHJmhjWX74Vbjg8cNCogvuqt3vLUt7xtPMGDXBqMszLRSRgZQsSp4=
X-Gm-Gg: ASbGncvnm/qho6EYogp9zOZwXFwrHgJgVF8UIMQupeqausCCCf/eYPy5EGtRMxK8eGZ
	zyhKrcMVPyw+7NLT0Z8PDS+M3wEEiJ22nE458eJDsvNoK9FIECBhCAmdGW8LhGdDsFinpIckKd/
	MCHgdrzHFzsFmxzFHldKX1HYwh2H3KSf57IG9Lxs+i2J4eYIe37EQp4O8u4mwp9n/wOr+AzyU0P
	Lj/ok5LmvcmKdJlJ6weqFfHk22HrF5KkliK7xO27Yo7vOiegAVC5iM6MCYK07IuoRlpykfYv5Af
	cT3HubV3dbeulX329E+ENgNeCCrgrGDyGc+49cmbucoD5AaPSWMRarDkDsFKEr44APJYaZKpAY5
	1t3pPp6CrcDugqTDlGDcY3v903nYxGI6h
X-Google-Smtp-Source: AGHT+IHPOGWQN7CQo5uvqH3maITnR7iEOg+MpVOumRq8qlMhfQS1/sDkbsRXe/C9cg/75eQhqbeYCQ==
X-Received: by 2002:a17:907:3f89:b0:ae6:df9e:736c with SMTP id a640c23a62f3a-ae6e10bbee5mr9312366b.21.1752072926801;
        Wed, 09 Jul 2025 07:55:26 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b600ddsm1116795766b.158.2025.07.09.07.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:55:26 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 16:55:17 +0200
Subject: [PATCH v2 4/4] phy: qualcomm: phy-qcom-eusb2-repeater: Add support
 for PMIV0104
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-repeater-v2-4-b6eff075c097@fairphone.com>
References: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072923; l=1730;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dqwE+mgZFmDVF9ARQ35sDJJ/X46qouKrH+a/CF0hG4w=;
 b=lyt8D0KlGNc8UG/Ba5c6MpLOjIKEHZ2kTOawV2liOjxfTKc8u9Nw5YChPEsmez45eub/Or6uK
 TMYz3TmgQPZBVmIdMkPKcrbNwsoHX6fNfz3hrG8kiWbd2JZYNOLOxEc
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the eUSB2 repeater found on the PMIV0104. There is no
default init table for this PMIC, just the board-specific tuning
parameters are used on top of the default tuning values.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 61594739e5b12706775622e1f76af6ad5d2d29bf..3d4cdc4c18becd8efd5015e698b836ad4d7cf18c 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -82,6 +82,14 @@ static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
 	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
 };
 
+static const struct eusb2_repeater_cfg pmiv0104_eusb2_cfg = {
+	/* No PMIC-specific init sequence, only board level tuning via DT */
+	.init_tbl	= (struct eusb2_repeater_init_tbl_reg[]) {},
+	.init_tbl_num	= 0,
+	.vreg_list	= pm8550b_vreg_l,
+	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
+};
+
 static const struct eusb2_repeater_cfg smb2360_eusb2_cfg = {
 	.init_tbl	= smb2360_init_tbl,
 	.init_tbl_num	= ARRAY_SIZE(smb2360_init_tbl),
@@ -264,6 +272,10 @@ static const struct of_device_id eusb2_repeater_of_match_table[] = {
 		.compatible = "qcom,pm8550b-eusb2-repeater",
 		.data = &pm8550b_eusb2_cfg,
 	},
+	{
+		.compatible = "qcom,pmiv0104-eusb2-repeater",
+		.data = &pmiv0104_eusb2_cfg,
+	},
 	{
 		.compatible = "qcom,smb2360-eusb2-repeater",
 		.data = &smb2360_eusb2_cfg,

-- 
2.50.0

